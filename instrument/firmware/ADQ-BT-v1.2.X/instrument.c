/*
 * File:   instrument.c
 * Author: Nahuel
 *
 * Created on 27 de febrero de 2018, 19:18
 */

#include "instrument.h"
#include <xc.h>

void INSTRUMENT_Initialize(void) {
    Data.State = INSTRUMENT_INIT;
    LED_Connected = Off;
    LED_Running = Off;
    Data.conversionReady = false;
    Data.Bluetooth.ReceivingData = false;
    Data.Bluetooth.DatawasReceived = false;
    Data.Bluetooth.index_dataReceived = 0;
    for(int i = 0;i<BLUETHOOT_MAX_LENGHT_CHAR_RECEIVED; ++i) {
        Data.Bluetooth.DataReceived[i] = '0'; // Initialize array
    }
    Data.channeltogetData = CHANNEL_1;
    Data.counterSampling = 0;
    Data.SamplingWished = SAMPLING_10SPS;
    Data.counterSamplingWished = CONSTANT_SAMPLING_10SPS;
    
    INSTRUMENT_enableTimer(); // Start timer
    // Para evitar posibles primeras muestras grandes se muestrean todos los canales
    INSTRUMENT_enableADQcommunication();
    ADS1115_config(ADQ1_ADS_ADDRESS,ADQ_CONFIG_REG_1_A3);
    Data.Channel[CHANNEL_1].adc = ADS1115_read(ADQ1_ADS_ADDRESS);
    ADS1115_config(ADQ1_ADS_ADDRESS,ADQ_CONFIG_REG_1_A2);
    Data.Channel[CHANNEL_2].adc = ADS1115_read(ADQ1_ADS_ADDRESS);
    ADS1115_config(ADQ1_ADS_ADDRESS,ADQ_CONFIG_REG_1_A1);
    Data.Channel[CHANNEL_3].adc = ADS1115_read(ADQ1_ADS_ADDRESS);
    ADS1115_config(ADQ1_ADS_ADDRESS,ADQ_CONFIG_REG_1_A0);
    Data.Channel[CHANNEL_4].adc = ADS1115_read(ADQ1_ADS_ADDRESS);
    ADS1115_config(ADQ2_ADS_ADDRESS,ADQ_CONFIG_REG_1_A3);
    Data.Channel[CHANNEL_5].adc = ADS1115_read(ADQ2_ADS_ADDRESS);    
    ADS1115_config(ADQ2_ADS_ADDRESS,ADQ_CONFIG_REG_1_A2);
    Data.Channel[CHANNEL_6].adc = ADS1115_read(ADQ2_ADS_ADDRESS);
    ADS1115_config(ADQ2_ADS_ADDRESS,ADQ_CONFIG_REG_1_A1);
    Data.Channel[CHANNEL_7].adc = ADS1115_read(ADQ2_ADS_ADDRESS);
    ADS1115_config(ADQ2_ADS_ADDRESS,ADQ_CONFIG_REG_1_A0);
    Data.Channel[CHANNEL_8].adc = ADS1115_read(ADQ2_ADS_ADDRESS);
}

void INSTRUMENT_Tasks (void) {
    switch(Data.State) {
        case INSTRUMENT_INIT:   
            INSTRUMENT_Initialize();
            Data.I2Cconfigurated = INSTRUMENT_enableADQcommunication();
            if(Data.I2Cconfigurated){
                Data.State = INSTRUMENT_ADQ_CHECK_AND_CONFIGURATION;
            }
            break;
        
        case INSTRUMENT_ADQ_CHECK_AND_CONFIGURATION: // Set configuration
            Data.ADQ1configurated = INSTRUMENT_configurationADQ(ADQ1_ADS_ADDRESS,ADQ_CONFIG_REG_1_A0);
            Data.ADQ2configurated = INSTRUMENT_configurationADQ(ADQ2_ADS_ADDRESS,ADQ_CONFIG_REG_1_A0);
            if(Data.ADQ1configurated && Data.ADQ2configurated) {
                Data.State = INSTRUMENT_BLUETOOTH_CHECK_CONNECTION;
                LED_CHANNEL_1 = Off;
                LED_CHANNEL_2 = Off;
//                INSTRUMENT_Bluetooth_Configuration(); // Enable to programm HC-05
            } else {
                if(!Data.ADQ1configurated) {
                    LED_CHANNEL_1 = On; // ERROR in ADQ1 connection
                } else { // Data.ADQ1configurated = false
                LED_CHANNEL_2 = On; // ERROR in ADQ2 connection
              }
            }
            break;
            
        case INSTRUMENT_BLUETOOTH_CHECK_CONNECTION:
            if(BLUETOOTH_STATE_PIN) {
                Data.Bluetooth.Connected = true;
                LED_Connected = On;
                Data.State = INSTRUMENT_BLUETOOTH_CHECK_IF_DATA_WAS_RECEIVED;
            } else { // Wait to connect
                Data.Bluetooth.Connected = false;
                INSTRUMENT_Reset();
                Data.State = INSTRUMENT_BLUETOOTH_CHECK_CONNECTION;//INSTRUMENT_ADQ_CHECK_AND_CONFIGURATION;
            }
            break;
            
        case INSTRUMENT_BLUETOOTH_CHECK_IF_DATA_WAS_RECEIVED: // Instrument is waiting an order
            if(eusart1RxCount>0) { // Si se recibio un dato se procesa
                Data.State = INSTRUMENT_BLUETOOTH_PROCESS_DATA_RECEIVED;
            } else {
                if (Data.Bluetooth.DataConcatenated && !Data.readyToSend) {
                    Data.State = INSTRUMENT_BLUETOOTH_SEND_DATA;
                }else {
                    Data.State = INSTRUMENT_ADQ_GET_DATA;
                }
            }
            break;
            
        case INSTRUMENT_BLUETOOTH_PROCESS_DATA_RECEIVED:
            Data.measuring = INSTRUMENT_processBluetoothDataReceived(EUSART1_Read());
            if(Data.measuring) {
                LED_Running = On;
                Data.State = INSTRUMENT_ADQ_GET_DATA;
            } else {
                LED_Running = Off;
                Data.State = INSTRUMENT_BLUETOOTH_CHECK_CONNECTION;
                Data.channeltogetData = CHANNEL_1;
                Data.SamplingWished = SAMPLING_10SPS;
                Data.counterSamplingWished = CONSTANT_SAMPLING_10SPS;
                LED_CHANNEL_1 = Off;    LED_CHANNEL_2 = Off;    
                LED_CHANNEL_3 = Off;    LED_CHANNEL_4 = Off;
                LED_CHANNEL_5 = Off;    LED_CHANNEL_6 = Off;
                LED_CHANNEL_7 = Off;    LED_CHANNEL_8 = Off;
            }
            break;
            
        case INSTRUMENT_ADQ_GET_DATA:
            if(Data.measuring) {
                if(Data.conversionReady) {
                    Data.conversionReady = false;
                    Data.State = INSTRUMENT_BLUETOOTH_CONCATENATE_DATA;
                } if(Data.Bluetooth.DataConcatenated){
                    if(Data.readyToSend){
                        Data.State = INSTRUMENT_BLUETOOTH_SEND_DATA;
                    }
                }
            } else { // Continue waiting orders
                LED_Running = Off;
                Data.State = INSTRUMENT_BLUETOOTH_CHECK_CONNECTION;
                Data.channeltogetData = CHANNEL_1;
                // Data.SamplingWished = SAMPLING_10SPS; 
                // Data.counterSamplingWished = CONSTANT_SAMPLING_10SPS;
                LED_CHANNEL_1 = Off;    LED_CHANNEL_2 = Off;    
                LED_CHANNEL_3 = Off;    LED_CHANNEL_4 = Off;
                LED_CHANNEL_5 = Off;    LED_CHANNEL_6 = Off;
                LED_CHANNEL_7 = Off;    LED_CHANNEL_8 = Off;
            }
            break;
            
        case INSTRUMENT_BLUETOOTH_CONCATENATE_DATA:
            Data.Bluetooth.DataConcatenated = INSTRUMENT_concatenateData();
            if(Data.Bluetooth.DataConcatenated) {
                Data.State = INSTRUMENT_BLUETOOTH_SEND_DATA;
            }
            break;
            
        case INSTRUMENT_BLUETOOTH_SEND_DATA:
            if(Data.readyToSend) {
                Data.readyToSend = false;
                Data.Bluetooth.DataConcatenated = false;
                Data.Bluetooth.sendData = INSTRUMENT_sendData(Data.Bluetooth.DatatoSend, Data.Bluetooth.lengthMessagetoSend);
                if(Data.Bluetooth.sendData) {
                    Data.Bluetooth.sendData = false;
                    Data.State = INSTRUMENT_BLUETOOTH_CHECK_CONNECTION;
                }
            } else {
                Data.State = INSTRUMENT_BLUETOOTH_CHECK_CONNECTION;
            }
            break;
            
        default:
            break;
    }
}

void INSTRUMENT_Presentation(void) {
    __delay_ms(200);
    LED_Connected = On;     __delay_ms(200);
    LED_Running = On;       __delay_ms(200);
    LED_CHANNEL_1 = On;     __delay_ms(200);
    LED_CHANNEL_2 = On;     __delay_ms(200);
    LED_CHANNEL_3 = On;     __delay_ms(200);
    LED_CHANNEL_4 = On;     __delay_ms(200);
    LED_CHANNEL_5 = On;     __delay_ms(200);
    LED_CHANNEL_6 = On;     __delay_ms(200);
    LED_CHANNEL_7 = On;     __delay_ms(200);
    LED_CHANNEL_8 = On;     __delay_ms(500);

    LED_Connected = Off;    LED_Running = Off;
    LED_CHANNEL_1 = Off;    LED_CHANNEL_2 = Off;    
    LED_CHANNEL_3 = Off;    LED_CHANNEL_4 = Off;
    LED_CHANNEL_5 = Off;    LED_CHANNEL_6 = Off;
    LED_CHANNEL_7 = Off;    LED_CHANNEL_8 = Off;
}

void INSTRUMENT_Bluetooth_Configuration(void) {
    LED_Connected = Off;
    LED_Running = Off;
    LED_CHANNEL_3 = On;
    PIE1bits.RC1IE = 0;
    BAUDCON1 = 0x08;
    RCSTA1 = 0x90;
    TXSTA1 = 0xA4;
    SPBRG1 = 0xA0;
    SPBRGH1 = 0x01;
    PIE1bits.RC1IE = 1;
    BLUETOOTH_ENABLE_PIN = On;
    __delay_ms(2000);
    LED_Running = On;
    EUSART1_Write('A');EUSART1_Write('T');EUSART1_Write('+');EUSART1_Write('N');
    EUSART1_Write('A');EUSART1_Write('M');EUSART1_Write('E');EUSART1_Write('=');
    EUSART1_Write('M');EUSART1_Write('A');EUSART1_Write('C');EUSART1_Write('O');
    EUSART1_Write('S');EUSART1_Write('E');EUSART1_Write('R');EUSART1_Write('\r');
    EUSART1_Write('\n');
    __delay_ms(1000);
    EUSART1_Write('A');EUSART1_Write('T');EUSART1_Write('+');EUSART1_Write('U');
    EUSART1_Write('A');EUSART1_Write('R');EUSART1_Write('T');EUSART1_Write('=');
    EUSART1_Write('5');EUSART1_Write('7');EUSART1_Write('6');EUSART1_Write('0');
    EUSART1_Write('0');EUSART1_Write(',');EUSART1_Write('0');EUSART1_Write(',');
    EUSART1_Write('0');EUSART1_Write('\r');EUSART1_Write('\n');
    __delay_ms(3000);
    BLUETOOTH_ENABLE_PIN = Off;
    EUSART1_Initialize();
    __delay_ms(3000);
    LED_Running = Off;
    LED_CHANNEL_3 = Off;
}

void INSTRUMENT_Reset(void){
    LED_Connected = Off;
    LED_Running = Off;
    Data.channeltogetData = CHANNEL_1;
    Data.SamplingWished = SAMPLING_10SPS;
    Data.counterSamplingWished = CONSTANT_SAMPLING_10SPS;
    Data.counterSampling = 0;
    Data.conversionReady = false;
    Data.measuring = false;
    Data.readyToSend = false;
    Data.Bluetooth.DataConcatenated = false;
    Data.Bluetooth.sendData = false;
    Data.Bluetooth.ReceivingData = false;
    Data.Bluetooth.DatawasReceived = false;
    Data.Bluetooth.index_dataReceived = 0;
    for(int i = 0;i<CHANNEL_QUANTITY;i++) {
        Data.Channel[i].time = 0.;
        Data.Channel[i].voltage = 0.;
        Data.Bluetooth.channelToSend[i] = false;
    }
    for(int i = 0; i<BLUETHOOT_MAX_LENGHT_CHAR_RECEIVED;++i) {
        Data.Bluetooth.DataReceived[i] = '0';
    }
    LED_CHANNEL_1 = Off;    LED_CHANNEL_2 = Off;
    LED_CHANNEL_3 = Off;    LED_CHANNEL_4 = Off;
    LED_CHANNEL_5 = Off;    LED_CHANNEL_6 = Off;
    LED_CHANNEL_7 = Off;    LED_CHANNEL_8 = Off;
    INSTRUMENT_disableTimer();
    INSTRUMENT_enableTimer(); // reset timer
}

void INSTRUMENT_enableTimer(void) {
    TMR1_StartTimer();
}

void INSTRUMENT_disableTimer(void) {
    TMR1_StopTimer();
}

bool INSTRUMENT_enableADQcommunication(void) {
    I2C_Master_Init();
    return true;
}

bool INSTRUMENT_configurationADQ(uint8_t adq_address, uint8_t channel) {
    return (ADS1115_config(adq_address,channel));
}

bool INSTRUMENT_processBluetoothDataReceived(uint8_t datareceived) { // Se devuelve true en caso que haya que muestrar un canal
    bool futureMeasuring;
    futureMeasuring = false;
    switch(datareceived) {
        case '*':
            Data.Bluetooth.ReceivingData = true;
            break;
        case ';':
            Data.Bluetooth.ReceivingData = false;
            break;
        case 'A': // Start sampling CHANNEL_1
            if(!Data.Bluetooth.channelToSend[CHANNEL_1]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_1] = true;
                LED_CHANNEL_1 = On;
                Data.Channel[CHANNEL_1].voltage = 0.;
                Data.Channel[CHANNEL_1].time = 0.; // Reset time
            }
            break;
        case 'B': // End sampling CHANNEL_1
            if(Data.Bluetooth.channelToSend[CHANNEL_1]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_1] = false;
                LED_CHANNEL_1 = Off;
                Data.Channel[CHANNEL_1].time = 0.; // Reset time
                Data.Channel[CHANNEL_1].voltage = 0.;
            }
            break;
        case 'C': // Start sampling CHANNEL_2
            if(!Data.Bluetooth.channelToSend[CHANNEL_2]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_2] = true;
                LED_CHANNEL_2 = On;
                Data.Channel[CHANNEL_2].time = 0.; // Reset time
                Data.Channel[CHANNEL_2].voltage = 0.;
            }
            break;
        case 'D': // End sampling CHANNEL_2
            if(Data.Bluetooth.channelToSend[CHANNEL_2]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_2] = false;
                LED_CHANNEL_2 = Off;
                Data.Channel[CHANNEL_2].time = 0.; // Reset time
                Data.Channel[CHANNEL_2].voltage = 0.;
            }
            break;
        case 'E': // Start sampling CHANNEL_3
            if(!Data.Bluetooth.channelToSend[CHANNEL_3]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_3] = true;
                LED_CHANNEL_3 = On;
                Data.Channel[CHANNEL_3].time = 0.; // Reset time
                Data.Channel[CHANNEL_3].voltage = 0.;
            }
            break;
        case 'F': // End sampling CHANNEL_3
            if(Data.Bluetooth.channelToSend[CHANNEL_3]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_3] = false;
                LED_CHANNEL_3 = Off;
                Data.Channel[CHANNEL_3].time = 0.; // Reset time
                Data.Channel[CHANNEL_3].voltage = 0.;
            }
            break;
        case 'G': // Start sampling CHANNEL_4
            if(!Data.Bluetooth.channelToSend[CHANNEL_4]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_4] = true;
                LED_CHANNEL_4 = On;
                Data.Channel[CHANNEL_4].time = 0.; // Reset time
                Data.Channel[CHANNEL_4].voltage = 0.;
            }
            break;
        case 'H': // End sampling CHANNEL_4
            if(Data.Bluetooth.channelToSend[CHANNEL_4]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_4] = false;
                LED_CHANNEL_4 = Off;
                Data.Channel[CHANNEL_4].time = 0.; // Reset time
                Data.Channel[CHANNEL_4].voltage = 0.;
            }
            break;
        case 'I': // Start sampling CHANNEL_5
            if(!Data.Bluetooth.channelToSend[CHANNEL_5]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_5] = true;
                LED_CHANNEL_5 = On;
                Data.Channel[CHANNEL_5].time = 0.; // Reset time
                Data.Channel[CHANNEL_5].voltage = 0.;
            }
            break;
        case 'J': // End sampling CHANNEL_5
            if(Data.Bluetooth.channelToSend[CHANNEL_5]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_5] = false;
                LED_CHANNEL_5 = Off;
                Data.Channel[CHANNEL_5].time = 0.; // Reset time
                Data.Channel[CHANNEL_5].voltage = 0.;
            }
            break;
        case 'K': // Start sampling CHANNEL_6
            if(!Data.Bluetooth.channelToSend[CHANNEL_6]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_6] = true;
                LED_CHANNEL_6 = On;
                Data.Channel[CHANNEL_6].time = 0.; // Reset time
                Data.Channel[CHANNEL_6].voltage = 0.;
            }
            break;
        case 'L': // End sampling CHANNEL_6
            if(Data.Bluetooth.channelToSend[CHANNEL_6]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_6] = false;
                LED_CHANNEL_6 = Off;
                Data.Channel[CHANNEL_6].time = 0.; // Reset time
                Data.Channel[CHANNEL_6].voltage = 0.;
            }
            break;
        case 'M': // Start sampling CHANNEL_7
            if(!Data.Bluetooth.channelToSend[CHANNEL_7]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_7] = true;
                LED_CHANNEL_7 = On;
                Data.Channel[CHANNEL_7].time = 0.; // Reset time
                Data.Channel[CHANNEL_7].voltage = 0.;
            }
            break;
        case 'N': // End sampling CHANNEL_7
            if(Data.Bluetooth.channelToSend[CHANNEL_7]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_7] = false;
                LED_CHANNEL_7 = Off;
                Data.Channel[CHANNEL_7].time = 0.; // Reset time
                Data.Channel[CHANNEL_7].voltage = 0.;
            }
            break;
        case 'O': // Start sampling CHANNEL_8
            if(!Data.Bluetooth.channelToSend[CHANNEL_8]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_8] = true;
                LED_CHANNEL_8 = On;
                Data.Channel[CHANNEL_8].time = 0.; // Reset time
                Data.Channel[CHANNEL_8].voltage = 0.;
            }
            break;
        case 'P': // End sampling CHANNEL_8
            if(Data.Bluetooth.channelToSend[CHANNEL_8]&&Data.Bluetooth.ReceivingData) {
                Data.Bluetooth.channelToSend[CHANNEL_8] = false;
                LED_CHANNEL_8 = Off;
                Data.Channel[CHANNEL_8].time = 0.; // Reset time
                Data.Channel[CHANNEL_8].voltage = 0.;
            }
            break;
        case 'Q': // 10 SPS
            if(Data.Bluetooth.ReceivingData){
                Data.SamplingWished = SAMPLING_10SPS;
                Data.counterSamplingWished = CONSTANT_SAMPLING_10SPS;
            }
            break;
        case 'R': // 2 SPS
            if(Data.Bluetooth.ReceivingData){
                Data.SamplingWished = SAMPLING_2SPS;
                Data.counterSamplingWished = CONSTANT_SAMPLING_2SPS;            
            }
            break;
        case 'S': // 5 SPS
            if(Data.Bluetooth.ReceivingData){
                Data.SamplingWished = SAMPLING_5SPS;
                Data.counterSamplingWished = CONSTANT_SAMPLING_5SPS;
            }
            break;
        case 'T': // 1 SPS
            if(Data.Bluetooth.ReceivingData){
                Data.SamplingWished = SAMPLING_1SPS;
                Data.counterSamplingWished = CONSTANT_SAMPLING_1SPS;
            }
            break;
        default:
            break;
        }
    for(uint8_t i = 0;i<CHANNEL_QUANTITY;i++){
        futureMeasuring |= Data.Bluetooth.channelToSend[i];
    }
    return futureMeasuring;
}

bool INSTRUMENT_concatenateData(void) {
    Data.Bluetooth.lengthMessagetoSend = 0;
    // Start message to send
    Data.Bluetooth.DatatoSend[Data.Bluetooth.lengthMessagetoSend] = '*';
    Data.Bluetooth.lengthMessagetoSend++;
    for(uint8_t i=0;i<CHANNEL_QUANTITY;i++) {
        // Detect length of the message to know when to separate the measurements
        if(Data.Bluetooth.lengthMessagetoSend==1) {
            // Detect which channel to send 
            if(Data.Bluetooth.channelToSend[i]) {
                Data.Bluetooth.lengthMessagetoSend += sprintf(
                        &(Data.Bluetooth.DatatoSend[Data.Bluetooth.lengthMessagetoSend]),
                        "%d:%.1f,%.2f",i+1,Data.Channel[i].time,Data.Channel[i].voltage);
            }
        } else {
            if(Data.Bluetooth.channelToSend[i]) {
                Data.Bluetooth.lengthMessagetoSend += sprintf(
                        &(Data.Bluetooth.DatatoSend[Data.Bluetooth.lengthMessagetoSend]),
                        "-%d:%.1f,%.2f",i+1,Data.Channel[i].time,Data.Channel[i].voltage);
            }
        }
    }
    // End of message
    Data.Bluetooth.DatatoSend[Data.Bluetooth.lengthMessagetoSend++] = ';';
    return true;
}

bool INSTRUMENT_sendData (uint8_t *data, uint8_t lenght) {
    for(int i=0;i<lenght;i++) {
        EUSART1_Write(data[i]);
    }
    return true;
}
