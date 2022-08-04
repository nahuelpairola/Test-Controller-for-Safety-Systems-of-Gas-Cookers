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

#include "mcc_generated_files/mcc.h"
#include "ads1115.h"
#include "mcc_generated_files/eusart1.h"
#include <xc.h> // include processor files - each processor file is guarded.

#define Off     0
#define On      1

#define LED_Connected   LATBbits.LATB4
#define LED_Running     LATBbits.LATB5
#define LED_CHANNEL_1   LATAbits.LATA5
#define LED_CHANNEL_2   LATAbits.LATA3
#define LED_CHANNEL_3   LATAbits.LATA2
#define LED_CHANNEL_4   LATAbits.LATA1
#define LED_CHANNEL_5   LATAbits.LATA0
#define LED_CHANNEL_6   LATBbits.LATB3
#define LED_CHANNEL_7   LATBbits.LATB2
#define LED_CHANNEL_8   LATBbits.LATB1
#define CHANNEL_QUANTITY    8

#define BLUETOOTH_STATE_PIN     PORTCbits.RC5
#define BLUETOOTH_ENABLE_PIN    LATBbits.LATB0

#define BLUETOOTH_LENGHT_MESSAGE_RECEIVED       1
#define BLUETOOTH_MAX_LENGHT_MESSAGE_TO_SEND    128 
#define BLUETHOOT_MAX_LENGHT_CHAR_RECEIVED      15 // NO SE UTILIZA

#define SAMPLING_10SPS          0.1 // Time constant to increase each time sampled with 10sps
#define SAMPLING_5SPS           0.2 // Time constant to increase each time sampled with 5sps
#define SAMPLING_2SPS           0.5 // Time constant to increase each time sampled with 2sps
#define SAMPLING_1SPS           1.0 // Time constant to increase each time sampled with 1sps       

#define CONSTANT_SAMPLING_10SPS     1
#define CONSTANT_SAMPLING_5SPS      2
#define CONSTANT_SAMPLING_2SPS      5
#define CONSTANT_SAMPLING_1SPS      10

#define ADQ_CONST_CONVERSION        0.0006188307664 // (2,048/32767)*(1000/101) 
/*
 * 2,048: max valor de tension medido por la entrada del conversor
 * 32767: (2^15)-1, max valor en el AD
 * 1000: conversión de V a mV
 * 101: ganancia de amp op
*/
typedef enum { // enumerador de canales para usar en soft
    CHANNEL_1=0,
    CHANNEL_2,
    CHANNEL_3,
    CHANNEL_4,
    CHANNEL_5,
    CHANNEL_6,
    CHANNEL_7,
    CHANNEL_8
}CHAN;

typedef enum { // Estados posibles de la Machine State
    INSTRUMENT_INIT,
    INSTRUMENT_ADQ_CHECK_AND_CONFIGURATION,
    INSTRUMENT_BLUETOOTH_CHECK_CONNECTION,
    INSTRUMENT_BLUETOOTH_CHECK_IF_DATA_WAS_RECEIVED,
    INSTRUMENT_BLUETOOTH_PROCESS_DATA_RECEIVED,
    INSTRUMENT_ADQ_GET_DATA,
    INSTRUMENT_BLUETOOTH_CONCATENATE_DATA,
    INSTRUMENT_BLUETOOTH_SEND_DATA,
}STATES;

struct BLUETOOTH { // Estructura de datos relacionados con comunicación BT
    bool ATsent;
    bool checkConnection;
    bool HC06sentOK;
    bool Connected;
    bool DatawasReceived;
    bool ReceivingData;
    uint8_t index_dataReceived;
    uint8_t DataReceived[BLUETHOOT_MAX_LENGHT_CHAR_RECEIVED];
    uint8_t DatatoSend[BLUETOOTH_MAX_LENGHT_MESSAGE_TO_SEND];
    bool channelToSend[CHANNEL_QUANTITY];
    uint8_t lengthMessagetoSend;
    bool DataConcatenated;
    bool sendData;
};

struct CHANNEL { // Estructura para cada canal
    uint16_t adc;
    float voltage;
    float time;
};

struct DATA {
    STATES State;
    bool I2Cconfigurated;
    bool ADQ1configurated;
    bool ADQ2configurated;
    bool measuring;
    bool startSampling;
    bool conversionReady;
    bool readyToSend;
    uint8_t channeltogetData;
    float SamplingWished;
    uint16_t counterSamplingWished;
    uint16_t counterSampling;
    struct BLUETOOTH Bluetooth;
    struct CHANNEL Channel[CHANNEL_QUANTITY];
}Data;

void INSTRUMENT_Initialize(void);

void INSTRUMENT_Tasks(void);

void INSTRUMENT_Presentation(void);

void INSTRUMENT_Bluetooth_Configuration(void);

void INSTRUMENT_Reset(void);

void INSTRUMENT_enableTimer(void);

void INSTRUMENT_disableTimer(void);

bool INSTRUMENT_enableADQcommunication(void);

bool INSTRUMENT_configurationADQ(uint8_t adq_address, uint8_t channel);

bool INSTRUMENT_processBluetoothDataReceived(uint8_t datareceived);

bool INSTRUMENT_concatenateData(void);

bool INSTRUMENT_sendData (uint8_t *data, uint8_t lenght);
