/*
 * File:   ads1115.c
 * Author: nahue
 *
 * Created on 30 de diciembre de 2021, 09:38
 */

#include "ads1115.h"
#include "instrument.h"

/* 
 * baudrate = 400kbs
 * FOSC=64000000
 * SPADD=((FOSC/BAURATE)/4)-1=39
*/

//_____________________I2C BLOCK________________________//

void I2C_Master_Init(void){
    TRISCbits.TRISC3 = 1; //SCL Setting as input as given in datasheet
    TRISCbits.TRISC4 = 1; //SDA Setting as input as given in datasheet
    SSPSTAT = 0b10000000; // 
    SSPCON1 = 0b00101000; //SSP module como master
    SSPCON2 = 0b00000000; 
    SSPADD = 39; // Setting Clock Speed 400kbps
}

void I2C_Master_Wait(void){
    while ((SSPCON2 & 0b00011111) || (SSPSTAT & 0b00000100)); //Transmit is in progress
}

void I2C_Master_Start(void){
    I2C_Master_Wait(); 
    SSPCON2bits.SEN = 1; //Initiate start condition
}

void I2C_Master_Stop(void){
    I2C_Master_Wait();
    SSPCON2bits.PEN = 1; // Initiate stop condition
}

void I2C_Master_RepeatedStart(void){
    I2C_Master_Wait();
    SSPCON2bits.RSEN=1; // Restart
}

void I2C_Master_Write(uint8_t d){
    I2C_Master_Wait();
    SSPBUF = d; //Write data to SSPBUF
}

uint8_t I2C_Master_Read(uint8_t a){
    uint8_t temp;
    I2C_Master_Wait();
    SSPCON2bits.RCEN = 1; //Receive mode enabled
    I2C_Master_Wait();
    temp = SSPBUF; //Read data from SSPBUF.
    I2C_Master_Wait();
    SSPCON2bits.ACKDT = (a)?0:1; //Acknowledge bit
    SSPCON2bits.ACKEN = 1; //Acknowledge sequence
    return temp;
}

//_______________ADS1115 CONFIG AND DATA BLOCK__________________//
bool ADS1115_config(uint8_t address, uint8_t channel){
    I2C_Master_Start(); // Start communication
    I2C_Master_Wait();
    I2C_Master_Write(address); // send direction, ADQ1 or ADQ2 with last bit 0 (write ADS)
    I2C_Master_Wait();
    I2C_Master_Write(0b00000001); //Command to config registers
    I2C_Master_Wait();
    I2C_Master_Write(channel);
    I2C_Master_Wait();
    I2C_Master_Write(0b11100011);
    I2C_Master_Stop(); // Stop communication
    I2C_Master_Wait();
    return true;
}

//**************************************************************
uint16_t ADS1115_read(uint8_t address){ // read last channel sampled
    uint8_t datah;
    uint8_t datal;
    uint16_t data;
    I2C_Master_Start(); // Start communication
    I2C_Master_Wait(); 
    I2C_Master_Write(address);
    I2C_Master_Wait();
    I2C_Master_Write(0b00000000); // command to read registers
    I2C_Master_Wait();
    I2C_Master_RepeatedStart();
    I2C_Master_Wait();
    I2C_Master_Write(address|0b00000001);
    I2C_Master_Wait();
    datah = I2C_Master_Read(1);
    datal = I2C_Master_Read(0);
    data=((uint16_t)datah<<8)|(uint16_t)datal;
    I2C_Master_Stop();
    I2C_Master_Wait();
    return data;
}

//*************************************************************
