/* Microchip Technology Inc. and its subsidiaries.  You may use this software 
 * and any derivatives exclusively with Microchip products. 
 * 
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER 
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED 
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A 
 * PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION 
 * WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS 
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE 
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS 
 * IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF 
 * ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE 
 * TERMS. 
 */

/* 
 * File:   
 * Author: 
 * Comments:
 * Revision history: 
 */

// This is a guard condition so that contents of this file are not included
// more than once.  

#include <xc.h> // include processor files - each processor file is guarded.
#include <stdbool.h>
#include <stdint.h>

#define ADQ1_ADS_ADDRESS        0b10010010 // Direccion placa de canal 1 al 4
#define ADQ2_ADS_ADDRESS        0b10010000 // Direccion placa de canal 5 al 8
#define ADQ_CONFIG_REG          0b00000001 // Registro para escritura (no se utiliza directamente)
#define ADQ_CONV_REG            0b00000000 // Registro para lectura (no se utiliza directamente)
#define ADQ_CONFIG_REG_1_A0     0b11000101 // Inicia single-shot, A0 y GND, 2,048V, Single-shot CANAL 4 Y 8
#define ADQ_CONFIG_REG_1_A1     0b11010101 // Inicia single-shot, A1 y GND, 2,048V, Single-shot CANAL 3 Y 7
#define ADQ_CONFIG_REG_1_A2     0b11100101 // Inicia single-shot, A2 y GND, 2,048V, Single-shot CANAL 2 Y 6
#define ADQ_CONFIG_REG_1_A3     0b11110101 // Inicia single-shot, A3 y GND, 2,048V, Single-shot CANAL 1 Y 5
#define ADQ_CONFIG_REG_2        0b11100011  

#define ADQ_DELAY               3 //  en milisegundos

// Example in Microchip Forum, TO TEST

void I2C_Master_Init(void);

void I2C_Master_Wait(void);

void I2C_Master_Start(void);

void I2C_Master_Stop(void);

void I2C_Master_RepeatedStart(void);

void I2C_Master_Write(uint8_t d);

uint8_t I2C_Master_Read(uint8_t a);

bool ADS1115_config(uint8_t address, uint8_t channel);

uint16_t ADS1115_read(uint8_t address);

uint16_t ADS1115_read_demo(uint8_t address);
