EESchema Schematic File Version 2
LIBS:ADQ-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:74xgxx
LIBS:ac-dc
LIBS:actel
LIBS:allegro
LIBS:Altera
LIBS:analog_devices
LIBS:battery_management
LIBS:bbd
LIBS:bosch
LIBS:brooktre
LIBS:cmos_ieee
LIBS:dc-dc
LIBS:diode
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:infineon
LIBS:intersil
LIBS:ir
LIBS:Lattice
LIBS:leds
LIBS:LEM
LIBS:maxim
LIBS:mechanical
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic24mcu
LIBS:microchip_pic32mcu
LIBS:modules
LIBS:motor_drivers
LIBS:motors
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:Oscillators
LIBS:Power_Management
LIBS:powerint
LIBS:pspice
LIBS:references
LIBS:relays
LIBS:rfcom
LIBS:RFSolutions
LIBS:sensors
LIBS:silabs
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:transf
LIBS:triac_thyristor
LIBS:ttl_ieee
LIBS:video
LIBS:wiznet
LIBS:Worldsemi
LIBS:Xicor
LIBS:zetex
LIBS:Zilog
LIBS:ADQ-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "TESIS"
Date ""
Rev ""
Comp ""
Comment1 "PCB de adaptación y adquisición"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ADS1115 U5
U 1 1 5A0AD0AF
P 7200 3650
F 0 "U5" H 6500 4100 50  0000 L CNN
F 1 "ADS1115" H 7450 3300 50  0000 L CNN
F 2 "Housings_SSOP:VSSOP-10_3x3mm_Pitch0.5mm" H 7150 3600 50  0001 C CNN
F 3 "" H 6300 4050 50  0001 C CNN
	1    7200 3650
	1    0    0    -1  
$EndComp
$Comp
L C C13
U 1 1 5A186F83
P 7000 3100
F 0 "C13" H 7025 3200 50  0000 L CNN
F 1 "0.01uF" H 7025 3000 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7038 2950 50  0001 C CNN
F 3 "" H 7000 3100 50  0001 C CNN
	1    7000 3100
	0    -1   -1   0   
$EndComp
$Comp
L R R19
U 1 1 5A197812
P 8150 3150
F 0 "R19" V 8230 3150 50  0000 C CNN
F 1 "22k" V 8150 3150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8080 3150 50  0001 C CNN
F 3 "" H 8150 3150 50  0001 C CNN
	1    8150 3150
	-1   0    0    1   
$EndComp
Text GLabel 8150 3700 3    60   Input ~ 0
AD_SDA
$Comp
L R R18
U 1 1 5A1FF99A
P 7950 3150
F 0 "R18" V 8030 3150 50  0000 C CNN
F 1 "22k" V 7950 3150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7880 3150 50  0001 C CNN
F 3 "" H 7950 3150 50  0001 C CNN
	1    7950 3150
	-1   0    0    1   
$EndComp
Text GLabel 8350 3350 2    60   Input ~ 0
AD_ADDR_1/2
Text GLabel 6200 3850 0    60   Input ~ 0
1/5
Text GLabel 6450 3750 0    60   Input ~ 0
2/6
Text GLabel 6450 3550 0    60   Input ~ 0
3/7
Text GLabel 6200 3450 0    60   Input ~ 0
4/8
Text GLabel 7950 3700 3    60   Input ~ 0
AD_SCL
$Comp
L C C30
U 1 1 5A396E36
P 3350 1700
F 0 "C30" H 3375 1800 50  0000 L CNN
F 1 "0.01uF" H 3375 1600 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 3388 1550 50  0001 C CNN
F 3 "" H 3350 1700 50  0001 C CNN
	1    3350 1700
	0    -1   -1   0   
$EndComp
Text GLabel 3550 2050 2    60   Input ~ 0
1/5
$Comp
L MCP6N11-RESCUE-ADQ U1
U 1 1 5A396E3D
P 3150 2050
F 0 "U1" H 3200 2250 50  0000 L CNN
F 1 "MCP6N11" H 3200 2150 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 3150 2050 50  0001 C CNN
F 3 "" H 3150 2050 50  0001 C CNN
	1    3150 2050
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 5A396E43
P 3500 2250
F 0 "R9" V 3580 2250 50  0000 C CNN
F 1 "100k" V 3500 2250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3430 2250 50  0001 C CNN
F 3 "" H 3500 2250 50  0001 C CNN
	1    3500 2250
	-1   0    0    1   
$EndComp
$Comp
L R R13
U 1 1 5A396E49
P 3700 2450
F 0 "R13" V 3780 2450 50  0000 C CNN
F 1 "1k" V 3700 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3630 2450 50  0001 C CNN
F 3 "" H 3700 2450 50  0001 C CNN
	1    3700 2450
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 5A396E5C
P 2050 1950
F 0 "R1" V 2150 2050 50  0000 C CNN
F 1 "22k" V 2050 1950 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1980 1950 50  0001 C CNN
F 3 "" H 2050 1950 50  0001 C CNN
	1    2050 1950
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 5A396E62
P 2050 2150
F 0 "R2" V 2150 2250 50  0000 C CNN
F 1 "22k" V 2050 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1980 2150 50  0001 C CNN
F 3 "" H 2050 2150 50  0001 C CNN
	1    2050 2150
	0    -1   -1   0   
$EndComp
$Comp
L C C2
U 1 1 5A396E68
P 2450 1800
F 0 "C2" V 2500 1900 50  0000 L CNN
F 1 "470nF" V 2500 1500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 1650 50  0001 C CNN
F 3 "" H 2450 1800 50  0001 C CNN
	1    2450 1800
	0    -1   -1   0   
$EndComp
$Comp
L C C4
U 1 1 5A396E6E
P 2450 2300
F 0 "C4" V 2500 2400 50  0000 L CNN
F 1 "470nF" V 2500 2000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 2150 50  0001 C CNN
F 3 "" H 2450 2300 50  0001 C CNN
	1    2450 2300
	0    -1   -1   0   
$EndComp
$Comp
L C C3
U 1 1 5A396E74
P 2450 2050
F 0 "C3" V 2500 2150 50  0000 L CNN
F 1 "470nF" V 2500 1750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 1900 50  0001 C CNN
F 3 "" H 2450 2050 50  0001 C CNN
	1    2450 2050
	0    -1   -1   0   
$EndComp
$Comp
L C C5
U 1 1 5A38FE6F
P 2450 2500
F 0 "C5" V 2550 2600 50  0000 L CNN
F 1 "470nF" V 2500 2200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 2350 50  0001 C CNN
F 3 "" H 2450 2500 50  0001 C CNN
	1    2450 2500
	0    -1   -1   0   
$EndComp
$Comp
L C C1
U 1 1 5A397AFD
P 2450 1600
F 0 "C1" V 2500 1700 50  0000 L CNN
F 1 "470nF" V 2500 1300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 1450 50  0001 C CNN
F 3 "" H 2450 1600 50  0001 C CNN
	1    2450 1600
	0    -1   -1   0   
$EndComp
$Comp
L C C31
U 1 1 5A3A2CF4
P 3350 3000
F 0 "C31" H 3375 3100 50  0000 L CNN
F 1 "0.01uF" H 3375 2900 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 3388 2850 50  0001 C CNN
F 3 "" H 3350 3000 50  0001 C CNN
	1    3350 3000
	0    -1   -1   0   
$EndComp
Text GLabel 3550 3350 2    60   Input ~ 0
2/6
$Comp
L MCP6N11-RESCUE-ADQ U2
U 1 1 5A3A2CFB
P 3150 3350
F 0 "U2" H 3200 3550 50  0000 L CNN
F 1 "MCP6N11" H 3200 3450 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 3150 3350 50  0001 C CNN
F 3 "" H 3150 3350 50  0001 C CNN
	1    3150 3350
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 5A3A2D01
P 3500 3550
F 0 "R10" V 3580 3550 50  0000 C CNN
F 1 "100k" V 3500 3550 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3430 3550 50  0001 C CNN
F 3 "" H 3500 3550 50  0001 C CNN
	1    3500 3550
	-1   0    0    1   
$EndComp
$Comp
L R R14
U 1 1 5A3A2D07
P 3700 3750
F 0 "R14" V 3780 3750 50  0000 C CNN
F 1 "1k" V 3700 3750 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3630 3750 50  0001 C CNN
F 3 "" H 3700 3750 50  0001 C CNN
	1    3700 3750
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 5A3A2D0D
P 2050 3250
F 0 "R3" V 2130 3250 50  0000 C CNN
F 1 "22k" V 2050 3250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1980 3250 50  0001 C CNN
F 3 "" H 2050 3250 50  0001 C CNN
	1    2050 3250
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 5A3A2D13
P 2050 3450
F 0 "R4" V 2130 3450 50  0000 C CNN
F 1 "22k" V 2050 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1980 3450 50  0001 C CNN
F 3 "" H 2050 3450 50  0001 C CNN
	1    2050 3450
	0    -1   -1   0   
$EndComp
$Comp
L C C7
U 1 1 5A3A2D19
P 2450 3100
F 0 "C7" V 2500 3200 50  0000 L CNN
F 1 "470nF" V 2500 2800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 2950 50  0001 C CNN
F 3 "" H 2450 3100 50  0001 C CNN
	1    2450 3100
	0    -1   -1   0   
$EndComp
$Comp
L C C9
U 1 1 5A3A2D1F
P 2450 3600
F 0 "C9" V 2500 3700 50  0000 L CNN
F 1 "470nF" V 2500 3300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 3450 50  0001 C CNN
F 3 "" H 2450 3600 50  0001 C CNN
	1    2450 3600
	0    -1   -1   0   
$EndComp
$Comp
L C C8
U 1 1 5A3A2D25
P 2450 3350
F 0 "C8" V 2500 3450 50  0000 L CNN
F 1 "470nF" V 2500 3050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 3200 50  0001 C CNN
F 3 "" H 2450 3350 50  0001 C CNN
	1    2450 3350
	0    -1   -1   0   
$EndComp
$Comp
L C C10
U 1 1 5A3A2D58
P 2450 3800
F 0 "C10" V 2550 3850 50  0000 L CNN
F 1 "470nF" V 2500 3500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 3650 50  0001 C CNN
F 3 "" H 2450 3800 50  0001 C CNN
	1    2450 3800
	0    -1   -1   0   
$EndComp
$Comp
L C C6
U 1 1 5A3A2D63
P 2450 2900
F 0 "C6" V 2500 3000 50  0000 L CNN
F 1 "470nF" V 2500 2600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 2750 50  0001 C CNN
F 3 "" H 2450 2900 50  0001 C CNN
	1    2450 2900
	0    -1   -1   0   
$EndComp
$Comp
L C C32
U 1 1 5A3A4DB7
P 3350 4300
F 0 "C32" H 3375 4400 50  0000 L CNN
F 1 "0.01uF" H 3375 4200 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 3388 4150 50  0001 C CNN
F 3 "" H 3350 4300 50  0001 C CNN
	1    3350 4300
	0    -1   -1   0   
$EndComp
Text GLabel 3550 4650 2    60   Input ~ 0
3/7
$Comp
L MCP6N11-RESCUE-ADQ U3
U 1 1 5A3A4DBE
P 3150 4650
F 0 "U3" H 3200 4850 50  0000 L CNN
F 1 "MCP6N11" H 3200 4750 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 3150 4650 50  0001 C CNN
F 3 "" H 3150 4650 50  0001 C CNN
	1    3150 4650
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 5A3A4DC4
P 3500 4850
F 0 "R11" V 3580 4850 50  0000 C CNN
F 1 "100k" V 3500 4850 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3430 4850 50  0001 C CNN
F 3 "" H 3500 4850 50  0001 C CNN
	1    3500 4850
	-1   0    0    1   
$EndComp
$Comp
L R R23
U 1 1 5A3A4DCA
P 3700 5050
F 0 "R23" V 3780 5050 50  0000 C CNN
F 1 "1k" V 3700 5050 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3630 5050 50  0001 C CNN
F 3 "" H 3700 5050 50  0001 C CNN
	1    3700 5050
	0    -1   -1   0   
$EndComp
$Comp
L R R5
U 1 1 5A3A4DD0
P 2050 4550
F 0 "R5" V 2130 4550 50  0000 C CNN
F 1 "22k" V 2050 4550 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1980 4550 50  0001 C CNN
F 3 "" H 2050 4550 50  0001 C CNN
	1    2050 4550
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 5A3A4DD6
P 2050 4750
F 0 "R6" V 2130 4750 50  0000 C CNN
F 1 "22k" V 2050 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1980 4750 50  0001 C CNN
F 3 "" H 2050 4750 50  0001 C CNN
	1    2050 4750
	0    -1   -1   0   
$EndComp
$Comp
L C C12
U 1 1 5A3A4DDC
P 2450 4400
F 0 "C12" V 2500 4500 50  0000 L CNN
F 1 "470nF" V 2500 4100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 4250 50  0001 C CNN
F 3 "" H 2450 4400 50  0001 C CNN
	1    2450 4400
	0    -1   -1   0   
$EndComp
$Comp
L C C20
U 1 1 5A3A4DE2
P 2450 4900
F 0 "C20" V 2500 5000 50  0000 L CNN
F 1 "470nF" V 2500 4600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 4750 50  0001 C CNN
F 3 "" H 2450 4900 50  0001 C CNN
	1    2450 4900
	0    -1   -1   0   
$EndComp
$Comp
L C C16
U 1 1 5A3A4DE8
P 2450 4650
F 0 "C16" V 2500 4750 50  0000 L CNN
F 1 "470nF" V 2500 4350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 4500 50  0001 C CNN
F 3 "" H 2450 4650 50  0001 C CNN
	1    2450 4650
	0    -1   -1   0   
$EndComp
$Comp
L C C21
U 1 1 5A3A4E1B
P 2450 5100
F 0 "C21" V 2550 5200 50  0000 L CNN
F 1 "470nF" V 2500 4800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 4950 50  0001 C CNN
F 3 "" H 2450 5100 50  0001 C CNN
	1    2450 5100
	0    -1   -1   0   
$EndComp
$Comp
L C C11
U 1 1 5A3A4E26
P 2450 4200
F 0 "C11" V 2500 4300 50  0000 L CNN
F 1 "470nF" V 2500 3900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 4050 50  0001 C CNN
F 3 "" H 2450 4200 50  0001 C CNN
	1    2450 4200
	0    -1   -1   0   
$EndComp
$Comp
L C C33
U 1 1 5A3A4E38
P 3350 5600
F 0 "C33" H 3375 5700 50  0000 L CNN
F 1 "0.01uF" H 3375 5500 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 3388 5450 50  0001 C CNN
F 3 "" H 3350 5600 50  0001 C CNN
	1    3350 5600
	0    -1   -1   0   
$EndComp
Text GLabel 3550 5950 2    60   Input ~ 0
4/8
$Comp
L MCP6N11-RESCUE-ADQ U4
U 1 1 5A3A4E3F
P 3150 5950
F 0 "U4" H 3200 6150 50  0000 L CNN
F 1 "MCP6N11" H 3200 6050 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 3150 5950 50  0001 C CNN
F 3 "" H 3150 5950 50  0001 C CNN
	1    3150 5950
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 5A3A4E45
P 3500 6150
F 0 "R12" V 3580 6150 50  0000 C CNN
F 1 "100k" V 3500 6150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3430 6150 50  0001 C CNN
F 3 "" H 3500 6150 50  0001 C CNN
	1    3500 6150
	-1   0    0    1   
$EndComp
$Comp
L R R24
U 1 1 5A3A4E4B
P 3700 6350
F 0 "R24" V 3780 6350 50  0000 C CNN
F 1 "1k" V 3700 6350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3630 6350 50  0001 C CNN
F 3 "" H 3700 6350 50  0001 C CNN
	1    3700 6350
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 5A3A4E51
P 2050 5850
F 0 "R7" V 2150 5850 50  0000 C CNN
F 1 "22k" V 2050 5850 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1980 5850 50  0001 C CNN
F 3 "" H 2050 5850 50  0001 C CNN
	1    2050 5850
	0    -1   -1   0   
$EndComp
$Comp
L R R8
U 1 1 5A3A4E57
P 2050 6050
F 0 "R8" V 2150 6050 50  0000 C CNN
F 1 "22k" V 2050 6050 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1980 6050 50  0001 C CNN
F 3 "" H 2050 6050 50  0001 C CNN
	1    2050 6050
	0    -1   -1   0   
$EndComp
$Comp
L C C23
U 1 1 5A3A4E5D
P 2450 5700
F 0 "C23" V 2500 5800 50  0000 L CNN
F 1 "470nF" V 2500 5400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 5550 50  0001 C CNN
F 3 "" H 2450 5700 50  0001 C CNN
	1    2450 5700
	0    -1   -1   0   
$EndComp
$Comp
L C C28
U 1 1 5A3A4E63
P 2450 6200
F 0 "C28" V 2500 6300 50  0000 L CNN
F 1 "470nF" V 2500 5900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 6050 50  0001 C CNN
F 3 "" H 2450 6200 50  0001 C CNN
	1    2450 6200
	0    -1   -1   0   
$EndComp
$Comp
L C C24
U 1 1 5A3A4E69
P 2450 5950
F 0 "C24" V 2500 6050 50  0000 L CNN
F 1 "470nF" V 2500 5650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 5800 50  0001 C CNN
F 3 "" H 2450 5950 50  0001 C CNN
	1    2450 5950
	0    -1   -1   0   
$EndComp
$Comp
L C C29
U 1 1 5A3A4E9C
P 2450 6400
F 0 "C29" V 2550 6500 50  0000 L CNN
F 1 "470nF" V 2500 6100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 6250 50  0001 C CNN
F 3 "" H 2450 6400 50  0001 C CNN
	1    2450 6400
	0    -1   -1   0   
$EndComp
$Comp
L C C22
U 1 1 5A3A4EA7
P 2450 5500
F 0 "C22" V 2500 5600 50  0000 L CNN
F 1 "470nF" V 2500 5200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 5350 50  0001 C CNN
F 3 "" H 2450 5500 50  0001 C CNN
	1    2450 5500
	0    -1   -1   0   
$EndComp
$Comp
L Conn_01x03_Male J1
U 1 1 5A441D2B
P 1600 2000
F 0 "J1" H 1700 2250 50  0000 C CNN
F 1 "IN_1/5" V 1500 2000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 1600 2000 50  0001 C CNN
F 3 "" H 1600 2000 50  0001 C CNN
	1    1600 2000
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03_Male J2
U 1 1 5A443D95
P 1600 3300
F 0 "J2" H 1700 3550 50  0000 C CNN
F 1 "IN_2/6" V 1500 3300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 1600 3300 50  0001 C CNN
F 3 "" H 1600 3300 50  0001 C CNN
	1    1600 3300
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03_Male J4
U 1 1 5A444B4A
P 1600 5900
F 0 "J4" H 1700 6150 50  0000 C CNN
F 1 "IN_4/8" V 1500 5900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 1600 5900 50  0001 C CNN
F 3 "" H 1600 5900 50  0001 C CNN
	1    1600 5900
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03_Male J3
U 1 1 5A4451CF
P 1600 4600
F 0 "J3" H 1700 4850 50  0000 C CNN
F 1 "IN_3/7" V 1500 4600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 1600 4600 50  0001 C CNN
F 3 "" H 1600 4600 50  0001 C CNN
	1    1600 4600
	1    0    0    -1  
$EndComp
NoConn ~ 7900 3450
Wire Wire Line
	7950 3300 7950 3650
Wire Wire Line
	7950 3650 7950 3700
Connection ~ 7950 3650
Wire Wire Line
	7950 2900 7950 2950
Wire Wire Line
	7950 2950 7950 3000
Wire Wire Line
	8150 2950 8150 3000
Connection ~ 7950 2950
Wire Wire Line
	6450 3750 6500 3750
Wire Wire Line
	6200 3850 6500 3850
Wire Wire Line
	8150 3300 8150 3550
Wire Wire Line
	8150 3550 8150 3700
Connection ~ 8150 3550
Connection ~ 7200 3100
Wire Wire Line
	6800 3100 6850 3100
Wire Wire Line
	6200 3450 6500 3450
Wire Wire Line
	6500 3550 6450 3550
Wire Wire Line
	3500 2100 3500 2050
Wire Wire Line
	3450 2050 3500 2050
Wire Wire Line
	3500 2050 3550 2050
Wire Wire Line
	3250 2350 3250 2450
Wire Wire Line
	3250 2450 3500 2450
Wire Wire Line
	3500 2450 3550 2450
Wire Wire Line
	3500 2450 3500 2400
Connection ~ 3500 2450
Wire Wire Line
	3050 1750 3050 1700
Connection ~ 3500 2050
Wire Wire Line
	3050 1700 3150 1700
Wire Wire Line
	3150 1700 3200 1700
Connection ~ 3150 1700
Connection ~ 3100 2400
Wire Wire Line
	3850 2450 3950 2450
Wire Wire Line
	3950 2450 4000 2450
Wire Wire Line
	1800 2000 1850 2000
Wire Wire Line
	1850 2000 1850 1950
Wire Wire Line
	1850 1950 1900 1950
Wire Wire Line
	1800 2100 1850 2100
Wire Wire Line
	1850 2100 1850 2150
Wire Wire Line
	1850 2150 1900 2150
Wire Wire Line
	2250 1600 2250 1800
Wire Wire Line
	2250 1800 2250 1950
Wire Wire Line
	2250 1950 2250 2050
Connection ~ 2250 2150
Connection ~ 2250 1950
Wire Wire Line
	2600 2050 2650 2050
Wire Wire Line
	2650 2050 2850 2050
Wire Wire Line
	2650 2150 2650 2050
Wire Wire Line
	2250 2050 2300 2050
Wire Wire Line
	2800 2300 2600 2300
Wire Wire Line
	2800 2550 3100 2550
Wire Wire Line
	3100 2550 3950 2550
Wire Wire Line
	3100 2550 3100 2400
Connection ~ 3100 2550
Connection ~ 2800 2300
Wire Wire Line
	2800 1800 2600 1800
Wire Wire Line
	3050 2350 3050 2400
Wire Wire Line
	3050 2400 3100 2400
Wire Wire Line
	3100 2400 3150 2400
Wire Wire Line
	3150 2400 3150 2350
Wire Wire Line
	3500 1700 3950 1700
Wire Wire Line
	3950 1700 3950 2450
Wire Wire Line
	3950 2450 3950 2550
Connection ~ 3950 2450
Wire Wire Line
	7900 3550 8150 3550
Wire Wire Line
	8150 3550 8550 3550
Wire Wire Line
	2300 2300 2250 2300
Wire Wire Line
	2250 2150 2250 2300
Wire Wire Line
	2250 2300 2250 2500
Wire Wire Line
	2300 1800 2250 1800
Wire Wire Line
	2800 1600 2800 1800
Wire Wire Line
	2800 1800 2800 2300
Wire Wire Line
	2800 2300 2800 2500
Wire Wire Line
	2800 2500 2800 2550
Wire Wire Line
	2250 2500 2300 2500
Connection ~ 2250 2300
Wire Wire Line
	3150 1650 3150 1700
Wire Wire Line
	3150 1700 3150 1750
Wire Wire Line
	2300 1600 2250 1600
Connection ~ 2250 1800
Wire Wire Line
	2600 1600 2800 1600
Connection ~ 2800 1800
Wire Wire Line
	2600 2500 2800 2500
Connection ~ 2800 2500
Wire Wire Line
	3500 3400 3500 3350
Wire Wire Line
	3450 3350 3500 3350
Wire Wire Line
	3500 3350 3550 3350
Wire Wire Line
	3250 3650 3250 3750
Wire Wire Line
	3250 3750 3500 3750
Wire Wire Line
	3500 3750 3550 3750
Wire Wire Line
	3500 3750 3500 3700
Connection ~ 3500 3750
Wire Wire Line
	3050 3050 3050 3000
Connection ~ 3500 3350
Wire Wire Line
	3050 3000 3150 3000
Wire Wire Line
	3150 3000 3200 3000
Connection ~ 3150 3000
Connection ~ 3100 3700
Wire Wire Line
	3850 3750 3950 3750
Wire Wire Line
	3950 3750 4000 3750
Wire Wire Line
	1800 3300 1850 3300
Wire Wire Line
	1850 3300 1850 3250
Wire Wire Line
	1850 3250 1900 3250
Wire Wire Line
	1800 3400 1850 3400
Wire Wire Line
	1850 3400 1850 3450
Wire Wire Line
	1850 3450 1900 3450
Wire Wire Line
	2250 2900 2250 3100
Wire Wire Line
	2250 3100 2250 3250
Wire Wire Line
	2250 3250 2250 3350
Connection ~ 2250 3450
Connection ~ 2250 3250
Wire Wire Line
	2600 3350 2650 3350
Wire Wire Line
	2650 3350 2850 3350
Wire Wire Line
	2650 3450 2650 3350
Wire Wire Line
	2250 3350 2300 3350
Wire Wire Line
	2800 3600 2600 3600
Wire Wire Line
	3100 3850 3100 3700
Connection ~ 3100 3850
Connection ~ 2800 3600
Wire Wire Line
	2800 3100 2600 3100
Wire Wire Line
	3050 3650 3050 3700
Wire Wire Line
	3050 3700 3100 3700
Wire Wire Line
	3100 3700 3150 3700
Wire Wire Line
	3150 3700 3150 3650
Wire Wire Line
	3500 3000 3950 3000
Connection ~ 3950 3750
Wire Wire Line
	2300 3600 2250 3600
Wire Wire Line
	2250 3450 2250 3600
Wire Wire Line
	2250 3600 2250 3800
Wire Wire Line
	2300 3100 2250 3100
Wire Wire Line
	2800 2900 2800 3100
Wire Wire Line
	2800 3100 2800 3600
Wire Wire Line
	2800 3600 2800 3800
Wire Wire Line
	2800 3800 2800 3850
Wire Wire Line
	2250 3800 2300 3800
Connection ~ 2250 3600
Wire Wire Line
	3150 2950 3150 3000
Wire Wire Line
	3150 3000 3150 3050
Wire Wire Line
	2300 2900 2250 2900
Connection ~ 2250 3100
Wire Wire Line
	2600 2900 2800 2900
Connection ~ 2800 3100
Wire Wire Line
	2600 3800 2800 3800
Connection ~ 2800 3800
Wire Wire Line
	3500 4700 3500 4650
Wire Wire Line
	3450 4650 3500 4650
Wire Wire Line
	3500 4650 3550 4650
Wire Wire Line
	3250 4950 3250 5050
Wire Wire Line
	3250 5050 3500 5050
Wire Wire Line
	3500 5050 3550 5050
Wire Wire Line
	3500 5050 3500 5000
Connection ~ 3500 5050
Wire Wire Line
	3050 4350 3050 4300
Connection ~ 3500 4650
Wire Wire Line
	3050 4300 3150 4300
Wire Wire Line
	3150 4300 3200 4300
Connection ~ 3150 4300
Connection ~ 3100 5000
Wire Wire Line
	3850 5050 3950 5050
Wire Wire Line
	3950 5050 4000 5050
Wire Wire Line
	1800 4600 1850 4600
Wire Wire Line
	1850 4600 1850 4550
Wire Wire Line
	1850 4550 1900 4550
Wire Wire Line
	1800 4700 1850 4700
Wire Wire Line
	1850 4700 1850 4750
Wire Wire Line
	1850 4750 1900 4750
Wire Wire Line
	2250 4200 2250 4400
Wire Wire Line
	2250 4400 2250 4550
Wire Wire Line
	2250 4550 2250 4650
Connection ~ 2250 4750
Connection ~ 2250 4550
Wire Wire Line
	2600 4650 2650 4650
Wire Wire Line
	2650 4650 2850 4650
Wire Wire Line
	2650 4750 2650 4650
Wire Wire Line
	2250 4650 2300 4650
Wire Wire Line
	2800 4900 2600 4900
Wire Wire Line
	2800 5150 3100 5150
Wire Wire Line
	3100 5150 3950 5150
Wire Wire Line
	3100 5150 3100 5000
Connection ~ 3100 5150
Connection ~ 2800 4900
Wire Wire Line
	2800 4400 2600 4400
Wire Wire Line
	3050 4950 3050 5000
Wire Wire Line
	3050 5000 3100 5000
Wire Wire Line
	3100 5000 3150 5000
Wire Wire Line
	3150 5000 3150 4950
Wire Wire Line
	3500 4300 3950 4300
Wire Wire Line
	3950 4300 3950 5050
Wire Wire Line
	3950 5050 3950 5150
Connection ~ 3950 5050
Wire Wire Line
	2300 4900 2250 4900
Wire Wire Line
	2250 4750 2250 4900
Wire Wire Line
	2250 4900 2250 5100
Wire Wire Line
	2300 4400 2250 4400
Wire Wire Line
	2800 4200 2800 4400
Wire Wire Line
	2800 4400 2800 4900
Wire Wire Line
	2800 4900 2800 5100
Wire Wire Line
	2800 5100 2800 5150
Wire Wire Line
	2250 5100 2300 5100
Connection ~ 2250 4900
Wire Wire Line
	3150 4250 3150 4300
Wire Wire Line
	3150 4300 3150 4350
Wire Wire Line
	2300 4200 2250 4200
Connection ~ 2250 4400
Wire Wire Line
	2600 4200 2800 4200
Connection ~ 2800 4400
Wire Wire Line
	2600 5100 2800 5100
Connection ~ 2800 5100
Wire Wire Line
	3250 6250 3250 6350
Wire Wire Line
	3250 6350 3500 6350
Wire Wire Line
	3500 6350 3550 6350
Wire Wire Line
	3500 6350 3500 6300
Connection ~ 3500 6350
Wire Wire Line
	3050 5650 3050 5600
Wire Wire Line
	3050 5600 3150 5600
Wire Wire Line
	3150 5600 3200 5600
Connection ~ 3150 5600
Connection ~ 3100 6300
Wire Wire Line
	3850 6350 3950 6350
Wire Wire Line
	3950 6350 4000 6350
Wire Wire Line
	1800 5900 1850 5900
Wire Wire Line
	1850 5900 1850 5850
Wire Wire Line
	1850 5850 1900 5850
Wire Wire Line
	1800 6000 1850 6000
Wire Wire Line
	1850 6000 1850 6050
Wire Wire Line
	1850 6050 1900 6050
Wire Wire Line
	2250 5500 2250 5700
Wire Wire Line
	2250 5700 2250 5850
Wire Wire Line
	2250 5850 2250 5950
Connection ~ 2250 6050
Connection ~ 2250 5850
Wire Wire Line
	2600 5950 2650 5950
Wire Wire Line
	2650 5950 2850 5950
Wire Wire Line
	2250 5950 2300 5950
Wire Wire Line
	2800 6200 2600 6200
Wire Wire Line
	2800 6450 3100 6450
Wire Wire Line
	3100 6450 3950 6450
Wire Wire Line
	3100 6450 3100 6300
Connection ~ 3100 6450
Connection ~ 2800 6200
Wire Wire Line
	2800 5700 2600 5700
Wire Wire Line
	3050 6250 3050 6300
Wire Wire Line
	3050 6300 3100 6300
Wire Wire Line
	3100 6300 3150 6300
Wire Wire Line
	3150 6300 3150 6250
Wire Wire Line
	3500 5600 3950 5600
Wire Wire Line
	3950 5600 3950 6350
Wire Wire Line
	3950 6350 3950 6450
Connection ~ 3950 6350
Wire Wire Line
	2300 6200 2250 6200
Wire Wire Line
	2250 6050 2250 6200
Wire Wire Line
	2250 6200 2250 6400
Wire Wire Line
	2300 5700 2250 5700
Wire Wire Line
	2800 5500 2800 5700
Wire Wire Line
	2800 5700 2800 6200
Wire Wire Line
	2800 6200 2800 6400
Wire Wire Line
	2800 6400 2800 6450
Wire Wire Line
	2250 6400 2300 6400
Connection ~ 2250 6200
Wire Wire Line
	3150 5550 3150 5600
Wire Wire Line
	3150 5600 3150 5650
Wire Wire Line
	2300 5500 2250 5500
Connection ~ 2250 5700
Wire Wire Line
	2600 5500 2800 5500
Connection ~ 2800 5700
Wire Wire Line
	2600 6400 2800 6400
Connection ~ 2800 6400
Wire Wire Line
	7200 3050 7200 3100
Wire Wire Line
	7200 3100 7200 3150
Wire Wire Line
	7900 3350 8300 3350
Wire Wire Line
	8300 3350 8350 3350
Wire Wire Line
	8300 3350 8300 3100
Wire Wire Line
	8300 3100 8550 3100
Connection ~ 8300 3350
Wire Wire Line
	3450 5950 3500 5950
Wire Wire Line
	3500 5950 3550 5950
Wire Wire Line
	3500 6000 3500 5950
Connection ~ 3500 5950
Wire Wire Line
	2850 2150 2750 2150
Wire Wire Line
	2750 2150 2750 1950
Wire Wire Line
	2750 1950 2250 1950
Wire Wire Line
	2250 1950 2200 1950
Wire Wire Line
	2200 2150 2250 2150
Wire Wire Line
	2250 2150 2650 2150
Wire Wire Line
	2850 2050 2850 1950
Connection ~ 2650 2050
Wire Wire Line
	2200 3450 2250 3450
Wire Wire Line
	2250 3450 2650 3450
Wire Wire Line
	2850 3350 2850 3250
Connection ~ 2650 3350
Wire Wire Line
	2850 3450 2750 3450
Wire Wire Line
	2750 3450 2750 3250
Wire Wire Line
	2750 3250 2250 3250
Wire Wire Line
	2250 3250 2200 3250
Wire Wire Line
	2850 4750 2750 4750
Wire Wire Line
	2750 4750 2750 4550
Wire Wire Line
	2750 4550 2250 4550
Wire Wire Line
	2250 4550 2200 4550
Wire Wire Line
	2200 4750 2250 4750
Wire Wire Line
	2250 4750 2650 4750
Wire Wire Line
	2850 4650 2850 4550
Connection ~ 2650 4650
Wire Wire Line
	2850 6050 2750 6050
Wire Wire Line
	2750 6050 2750 5850
Wire Wire Line
	2750 5850 2250 5850
Wire Wire Line
	2250 5850 2200 5850
Wire Wire Line
	2850 5950 2850 5850
Connection ~ 2650 5950
Wire Wire Line
	2200 6050 2250 6050
Wire Wire Line
	2250 6050 2650 6050
Wire Wire Line
	2650 6050 2650 5950
Wire Wire Line
	1850 1850 1850 1900
Wire Wire Line
	1850 1900 1800 1900
Wire Wire Line
	1850 3150 1850 3200
Wire Wire Line
	1850 3200 1800 3200
Wire Wire Line
	1800 4500 1850 4500
Wire Wire Line
	1850 4500 1850 4450
Wire Wire Line
	1800 5800 1850 5800
Wire Wire Line
	1850 5800 1850 5750
Wire Wire Line
	7200 4200 7200 4150
$Comp
L Conn_01x04_Male J5
U 1 1 5A4C6961
P 8750 3650
F 0 "J5" H 8800 3850 50  0000 C CNN
F 1 "CONN_ADQ_1/2" V 8700 3600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 8750 3650 50  0001 C CNN
F 3 "" H 8750 3650 50  0001 C CNN
	1    8750 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7900 3650 7950 3650
Wire Wire Line
	7950 3650 8550 3650
Wire Wire Line
	8550 3750 8500 3750
Wire Wire Line
	8550 3850 8500 3850
$Comp
L +5V #PWR01
U 1 1 5A4D6965
P 8500 3000
F 0 "#PWR01" H 8500 2850 50  0001 C CNN
F 1 "+5V" H 8500 3140 50  0000 C CNN
F 2 "" H 8500 3000 50  0001 C CNN
F 3 "" H 8500 3000 50  0001 C CNN
	1    8500 3000
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR02
U 1 1 5A4D6F33
P 7950 2900
F 0 "#PWR02" H 7950 2750 50  0001 C CNN
F 1 "+5V" H 7950 3040 50  0000 C CNN
F 2 "" H 7950 2900 50  0001 C CNN
F 3 "" H 7950 2900 50  0001 C CNN
	1    7950 2900
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR03
U 1 1 5A4D75D2
P 7200 3050
F 0 "#PWR03" H 7200 2900 50  0001 C CNN
F 1 "+5V" H 7200 3190 50  0000 C CNN
F 2 "" H 7200 3050 50  0001 C CNN
F 3 "" H 7200 3050 50  0001 C CNN
	1    7200 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3100 7200 3100
Wire Wire Line
	8150 2950 7950 2950
$Comp
L +5V #PWR04
U 1 1 5A4D9369
P 8500 3750
F 0 "#PWR04" H 8500 3600 50  0001 C CNN
F 1 "+5V" H 8500 3900 50  0000 C CNN
F 2 "" H 8500 3750 50  0001 C CNN
F 3 "" H 8500 3750 50  0001 C CNN
	1    8500 3750
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR05
U 1 1 5A4D96DE
P 3150 1650
F 0 "#PWR05" H 3150 1500 50  0001 C CNN
F 1 "+5V" H 3150 1790 50  0000 C CNN
F 2 "" H 3150 1650 50  0001 C CNN
F 3 "" H 3150 1650 50  0001 C CNN
	1    3150 1650
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR06
U 1 1 5A4D9AB5
P 3150 2950
F 0 "#PWR06" H 3150 2800 50  0001 C CNN
F 1 "+5V" H 3150 3090 50  0000 C CNN
F 2 "" H 3150 2950 50  0001 C CNN
F 3 "" H 3150 2950 50  0001 C CNN
	1    3150 2950
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR07
U 1 1 5A4D9BCE
P 3150 4250
F 0 "#PWR07" H 3150 4100 50  0001 C CNN
F 1 "+5V" H 3150 4390 50  0000 C CNN
F 2 "" H 3150 4250 50  0001 C CNN
F 3 "" H 3150 4250 50  0001 C CNN
	1    3150 4250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR08
U 1 1 5A4D9F6F
P 3150 5550
F 0 "#PWR08" H 3150 5400 50  0001 C CNN
F 1 "+5V" H 3150 5690 50  0000 C CNN
F 2 "" H 3150 5550 50  0001 C CNN
F 3 "" H 3150 5550 50  0001 C CNN
	1    3150 5550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 5A4DAB4C
P 8500 3850
F 0 "#PWR09" H 8500 3600 50  0001 C CNN
F 1 "GND" H 8550 3700 50  0000 C CNN
F 2 "" H 8500 3850 50  0001 C CNN
F 3 "" H 8500 3850 50  0001 C CNN
	1    8500 3850
	0    1    1    0   
$EndComp
$Comp
L GND #PWR010
U 1 1 5A4DACA2
P 7200 4200
F 0 "#PWR010" H 7200 3950 50  0001 C CNN
F 1 "GND" H 7200 4050 50  0000 C CNN
F 2 "" H 7200 4200 50  0001 C CNN
F 3 "" H 7200 4200 50  0001 C CNN
	1    7200 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 5A4DB00D
P 6800 3100
F 0 "#PWR011" H 6800 2850 50  0001 C CNN
F 1 "GND" H 6800 2950 50  0000 C CNN
F 2 "" H 6800 3100 50  0001 C CNN
F 3 "" H 6800 3100 50  0001 C CNN
	1    6800 3100
	0    1    1    0   
$EndComp
$Comp
L GND #PWR012
U 1 1 5A4DB30C
P 8500 3200
F 0 "#PWR012" H 8500 2950 50  0001 C CNN
F 1 "GND" H 8500 3050 50  0000 C CNN
F 2 "" H 8500 3200 50  0001 C CNN
F 3 "" H 8500 3200 50  0001 C CNN
	1    8500 3200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR013
U 1 1 5A4DB45B
P 4000 2450
F 0 "#PWR013" H 4000 2200 50  0001 C CNN
F 1 "GND" H 4000 2300 50  0000 C CNN
F 2 "" H 4000 2450 50  0001 C CNN
F 3 "" H 4000 2450 50  0001 C CNN
	1    4000 2450
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR014
U 1 1 5A4DE9C3
P 1850 1850
F 0 "#PWR014" H 1850 1600 50  0001 C CNN
F 1 "GND" H 1850 1700 50  0000 C CNN
F 2 "" H 1850 1850 50  0001 C CNN
F 3 "" H 1850 1850 50  0001 C CNN
	1    1850 1850
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR015
U 1 1 5A4DF900
P 4000 3750
F 0 "#PWR015" H 4000 3500 50  0001 C CNN
F 1 "GND" H 4000 3600 50  0000 C CNN
F 2 "" H 4000 3750 50  0001 C CNN
F 3 "" H 4000 3750 50  0001 C CNN
	1    4000 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 3000 3950 3750
Wire Wire Line
	3950 3750 3950 3850
Wire Wire Line
	3950 3850 3100 3850
Wire Wire Line
	3100 3850 2800 3850
$Comp
L GND #PWR016
U 1 1 5A4E220C
P 4000 5050
F 0 "#PWR016" H 4000 4800 50  0001 C CNN
F 1 "GND" H 4000 4900 50  0000 C CNN
F 2 "" H 4000 5050 50  0001 C CNN
F 3 "" H 4000 5050 50  0001 C CNN
	1    4000 5050
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR017
U 1 1 5A4E2B38
P 1850 4450
F 0 "#PWR017" H 1850 4200 50  0001 C CNN
F 1 "GND" H 1850 4300 50  0000 C CNN
F 2 "" H 1850 4450 50  0001 C CNN
F 3 "" H 1850 4450 50  0001 C CNN
	1    1850 4450
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR018
U 1 1 5A4E4C3C
P 1850 3150
F 0 "#PWR018" H 1850 2900 50  0001 C CNN
F 1 "GND" H 1850 3000 50  0000 C CNN
F 2 "" H 1850 3150 50  0001 C CNN
F 3 "" H 1850 3150 50  0001 C CNN
	1    1850 3150
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR019
U 1 1 5A4E6BAC
P 4000 6350
F 0 "#PWR019" H 4000 6100 50  0001 C CNN
F 1 "GND" H 4000 6200 50  0000 C CNN
F 2 "" H 4000 6350 50  0001 C CNN
F 3 "" H 4000 6350 50  0001 C CNN
	1    4000 6350
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR020
U 1 1 5A4E70FD
P 1850 5750
F 0 "#PWR020" H 1850 5500 50  0001 C CNN
F 1 "GND" H 1850 5600 50  0000 C CNN
F 2 "" H 1850 5750 50  0001 C CNN
F 3 "" H 1850 5750 50  0001 C CNN
	1    1850 5750
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x03_Male J6
U 1 1 5A4E99CD
P 8750 3100
F 0 "J6" H 8850 3350 50  0000 C CNN
F 1 "AD_ADDR_1/2" V 8700 3200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 8750 3100 50  0001 C CNN
F 3 "" H 8750 3100 50  0001 C CNN
	1    8750 3100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8500 3000 8550 3000
Wire Wire Line
	8500 3200 8550 3200
Text Notes 1550 6700 0    60   Italic 0
NOTA: \n- Todas las resistencias de 100k, 22k y 1k son de tolerancia 1%.
Wire Notes Line
	4850 750  4850 7550
Text Notes 700  7500 0    60   ~ 0
Etapa de adaptación de señal
Text Notes 5050 6350 0    60   ~ 0
Etapa de muestreo de señal y configuración de PCB (ADQ1 o 2)
Text Notes 750  950  0    60   Italic 0
Filtro de entrada:\n- Frecuencia de corte -3dB por entrada f1 = 1/(2pi*(22k)*(2*470nF)) = 7,7Hz\n- Frecuencia de corte -3dB modo común f2 = 1/(2pi*(2*22k)*(470nF)) = 7,7Hz
Text Notes 3100 1350 0    60   Italic 0
Ganancia G=1+ (100k/1k) = 101
Text Notes 8950 4200 0    60   Italic 0
Medición:\n- Rango: +/-1,024V\n- Modo: Single-Shot
Text Notes 8950 3200 0    60   Italic 0
Jumper:\n- ADQ1 - Jumper entre 1-2\n- ADQ2 - Jumper entre 2-3
Text Notes 650  1500 0    60   Italic 0
Tensión de entrada:\n- Rango: 0 a 10,24mV\n- Resolución: 0,3uV
$EndSCHEMATC
