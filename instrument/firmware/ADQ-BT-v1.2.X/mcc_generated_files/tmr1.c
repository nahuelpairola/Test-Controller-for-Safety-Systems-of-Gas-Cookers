/**
  TMR1 Generated Driver File

  @Company
    Microchip Technology Inc.

  @File Name
    tmr1.c

  @Summary
    This is the generated driver implementation file for the TMR1 driver using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  @Description
    This source file provides APIs for TMR1.
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.65
        Device            :  PIC18F25K80
        Driver Version    :  2.00
    The generated drivers are tested against the following:
        Compiler          :  XC8 1.45
        MPLAB 	          :  MPLAB X 4.10
*/

/*
    (c) 2016 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
*/ 

/**
  Section: Included Files
*/

#include <xc.h>
#include "tmr1.h"
#include "../instrument.h"

/**
  Section: Global Variables Definitions
*/
volatile uint16_t timer1ReloadVal;
void (*TMR1_InterruptHandler)(void);

/**
  Section: TMR1 APIs
*/

void TMR1_Initialize(void)
{
    //Set the Timer to the options selected in the GUI

    //T1GSS T1G_pin; TMR1GE disabled; T1GTM disabled; T1GPOL low; T1GGO done; T1GSPM disabled; 
    T1GCON = 0x00;

    //TMR1H 177; 
    TMR1H = 0xB1;

    //TMR1L 224; 
    TMR1L = 0xE0;

    // Load the TMR value to reload variable
    timer1ReloadVal=(uint16_t)((TMR1H << 8) | TMR1L);

    // Clearing IF flag before enabling the interrupt.
    PIR1bits.TMR1IF = 0;

    // Enabling TMR1 interrupt.
    PIE1bits.TMR1IE = 1;

    // Set Default Interrupt Handler
    TMR1_SetInterruptHandler(TMR1_DefaultInterruptHandler);

    // T1CKPS 1:8; RD16 disabled; SOSCEN disabled; nT1SYNC do_not_synchronize; TMR1CS FOSC/4; TMR1ON enabled; 
    T1CON = 0x35;
}

void TMR1_StartTimer(void)
{
    // Start the Timer by writing to TMRxON bit
    T1CONbits.TMR1ON = 1;
}

void TMR1_StopTimer(void)
{
    // Stop the Timer by writing to TMRxON bit
    T1CONbits.TMR1ON = 0;
}

uint16_t TMR1_ReadTimer(void)
{
    uint16_t readVal;
    uint8_t readValHigh;
    uint8_t readValLow;
    
	
    readValLow = TMR1L;
    readValHigh = TMR1H;
    
    readVal = ((uint16_t)readValHigh << 8) | readValLow;

    return readVal;
}

void TMR1_WriteTimer(uint16_t timerVal)
{
    if (T1CONbits.nT1SYNC == 1)
    {
        // Stop the Timer by writing to TMRxON bit
        T1CONbits.TMR1ON = 0;

        // Write to the Timer1 register
        TMR1H = (timerVal >> 8);
        TMR1L = timerVal;

        // Start the Timer after writing to the register
        T1CONbits.TMR1ON =1;
    }
    else
    {
        // Write to the Timer1 register
        TMR1H = (timerVal >> 8);
        TMR1L = timerVal;
    }
}

void TMR1_Reload(void)
{
    TMR1_WriteTimer(timer1ReloadVal);
}

void TMR1_StartSinglePulseAcquisition(void)
{
    T1GCONbits.T1GGO = 1;
}

uint8_t TMR1_CheckGateValueStatus(void)
{
    return (T1GCONbits.T1GVAL);
}

void TMR1_ISR(void)
{
    static volatile unsigned int CountCallBack = 0;

    // Clear the TMR1 interrupt flag
    PIR1bits.TMR1IF = 0;
    TMR1_WriteTimer(timer1ReloadVal);
    
    // callback function - called every 10th pass
    if (++CountCallBack >= TMR1_INTERRUPT_TICKER_FACTOR)
    {
        // ticker function call
        TMR1_CallBack();

        // reset ticker counter
        CountCallBack = 0;
    }
}

void TMR1_CallBack(void) // interrupcion cada 100ms (10ms*10s)
{
    // Add your custom callback code here
    if(TMR1_InterruptHandler)
    {
        TMR1_InterruptHandler();
    }
    // Se muestrea al inicio de los 100ms de la interrupcion
    if(Data.measuring && Data.counterSampling == 0){ 
        for(uint8_t i = 0; i<CHANNEL_QUANTITY;i++){ 
            if(Data.Bluetooth.channelToSend[i]){ // Se va a muestrear canal que se haya pedido
                if(i == 0){
                    ADS1115_config(ADQ1_ADS_ADDRESS,ADQ_CONFIG_REG_1_A3); // Se configura placa y canal
                    __delay_ms(ADQ_DELAY); // delay para asegurar fin de muestra
                    Data.Channel[i].adc = ADS1115_read(ADQ1_ADS_ADDRESS); // Se lee conversion
                    Data.Channel[i].voltage = (float)Data.Channel[i].adc*ADQ_CONST_CONVERSION; // Se convierte lectura AD a valor de voltaje
                    Data.Channel[i].time = Data.Channel[i].time + Data.SamplingWished; // Se incrementa tiempo de muestra
                } else if (i == 1){
                    ADS1115_config(ADQ1_ADS_ADDRESS,ADQ_CONFIG_REG_1_A2);
                    __delay_ms(ADQ_DELAY);
                    Data.Channel[i].adc = ADS1115_read(ADQ1_ADS_ADDRESS);
                    Data.Channel[i].voltage = (float)Data.Channel[i].adc*ADQ_CONST_CONVERSION;
                    Data.Channel[i].time = Data.Channel[i].time + Data.SamplingWished;
                } else if(i == 2){
                    ADS1115_config(ADQ1_ADS_ADDRESS,ADQ_CONFIG_REG_1_A1);
                    __delay_ms(ADQ_DELAY);
                    Data.Channel[i].adc = ADS1115_read(ADQ1_ADS_ADDRESS);
                    Data.Channel[i].voltage = (float)Data.Channel[i].adc*ADQ_CONST_CONVERSION;
                    Data.Channel[i].time = Data.Channel[i].time + Data.SamplingWished;
                } else if(i == 3){
                    ADS1115_config(ADQ1_ADS_ADDRESS,ADQ_CONFIG_REG_1_A0);
                    __delay_ms(ADQ_DELAY);
                    Data.Channel[i].adc = ADS1115_read(ADQ1_ADS_ADDRESS);
                    Data.Channel[i].voltage = (float)Data.Channel[i].adc*ADQ_CONST_CONVERSION;
                    Data.Channel[i].time = Data.Channel[i].time + Data.SamplingWished;
                } else if(i == 4){
                    ADS1115_config(ADQ2_ADS_ADDRESS,ADQ_CONFIG_REG_1_A3);
                    __delay_ms(ADQ_DELAY);
                    Data.Channel[i].adc = ADS1115_read(ADQ2_ADS_ADDRESS);
                    Data.Channel[i].voltage = (float)Data.Channel[i].adc*ADQ_CONST_CONVERSION;
                    Data.Channel[i].time = Data.Channel[i].time + Data.SamplingWished;
                } else if(i == 5){
                    ADS1115_config(ADQ2_ADS_ADDRESS,ADQ_CONFIG_REG_1_A2);
                    __delay_ms(ADQ_DELAY);
                    Data.Channel[i].adc = ADS1115_read(ADQ2_ADS_ADDRESS);
                    Data.Channel[i].voltage = (float)Data.Channel[i].adc*ADQ_CONST_CONVERSION;
                    Data.Channel[i].time = Data.Channel[i].time + Data.SamplingWished;
                } else if(i == 6){
                    ADS1115_config(ADQ2_ADS_ADDRESS,ADQ_CONFIG_REG_1_A1);
                    __delay_ms(ADQ_DELAY);
                    Data.Channel[i].adc = ADS1115_read(ADQ2_ADS_ADDRESS);
                    Data.Channel[i].voltage = (float)Data.Channel[i].adc*ADQ_CONST_CONVERSION;
                    Data.Channel[i].time = Data.Channel[i].time + Data.SamplingWished;
                } else if(i == 7){
                    ADS1115_config(ADQ2_ADS_ADDRESS,ADQ_CONFIG_REG_1_A0);
                    __delay_ms(ADQ_DELAY);
                    Data.Channel[i].adc = ADS1115_read(ADQ2_ADS_ADDRESS);
                    Data.Channel[i].voltage = (float)Data.Channel[i].adc*ADQ_CONST_CONVERSION;
                    Data.Channel[i].time = Data.Channel[i].time + Data.SamplingWished;
                }
            }
            // Si se analizaron los 8 canales la conversion esta lista
            if(i==7) { 
                Data.conversionReady = true;
            }
        }   
    }
    Data.counterSampling++; 
    if(Data.counterSampling>=Data.counterSamplingWished){
        Data.counterSampling = 0;
        if(Data.measuring){
            // En caso de reset de contador, y medicion en proceso, los datos estan listos para enviarse
            Data.readyToSend = true;
        }
    }
}

void TMR1_SetInterruptHandler(void (* InterruptHandler)(void)){
    TMR1_InterruptHandler = InterruptHandler;
}

void TMR1_DefaultInterruptHandler(void){
    // add your TMR1 interrupt custom code
    // or set custom function using TMR1_SetInterruptHandler()
}

/**
  End of File
*/
