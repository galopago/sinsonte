EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_RaspberryPi_and_Boards:Pico U1
U 1 1 604585C3
P 5600 3500
F 0 "U1" H 5600 4715 50  0000 C CNN
F 1 "Pico" H 5600 4624 50  0000 C CNN
F 2 "MCU_RaspberryPi_and_Boards:RPi_Pico_SMD_TH" V 5600 3500 50  0001 C CNN
F 3 "" H 5600 3500 50  0001 C CNN
	1    5600 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT1
U 1 1 6045B25F
P 2900 3600
F 0 "BT1" H 2450 3750 50  0000 L CNN
F 1 "Battery_Cell" H 2350 3550 50  0000 L CNN
F 2 "Battery:BatteryHolder_Keystone_2462_2xAA" V 2900 3660 50  0001 C CNN
F 3 "~" V 2900 3660 50  0001 C CNN
	1    2900 3600
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7000 Q1
U 1 1 60462339
P 4500 5250
F 0 "Q1" H 4704 5296 50  0000 L CNN
F 1 "2N7000" H 4704 5205 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4700 5175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7000.pdf" H 4500 5250 50  0001 L CNN
	1    4500 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 604643AE
P 4300 5500
F 0 "R1" H 4370 5546 50  0000 L CNN
F 1 "R" H 4370 5455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4230 5500 50  0001 C CNN
F 3 "~" H 4300 5500 50  0001 C CNN
	1    4300 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 60464B9E
P 4300 4600
F 0 "R2" H 4370 4646 50  0000 L CNN
F 1 "R" H 4370 4555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4230 4600 50  0001 C CNN
F 3 "~" H 4300 4600 50  0001 C CNN
	1    4300 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 60465AFE
P 3800 5500
F 0 "C1" H 3918 5546 50  0000 L CNN
F 1 "CP" H 3918 5455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 3838 5350 50  0001 C CNN
F 3 "~" H 3800 5500 50  0001 C CNN
	1    3800 5500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 60467D8D
P 4250 2650
F 0 "J2" H 4250 2850 50  0000 C CNN
F 1 "CLOCK" H 4150 2750 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4250 2650 50  0001 C CNN
F 3 "~" H 4250 2650 50  0001 C CNN
	1    4250 2650
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 60495A78
P 3800 2700
F 0 "SW1" V 3750 3050 50  0000 R CNN
F 1 "SW_Push" V 3900 3150 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 3800 2900 50  0001 C CNN
F 3 "~" H 3800 2900 50  0001 C CNN
	1    3800 2700
	0    -1   1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 604A087C
P 7850 3450
F 0 "C2" H 7965 3496 50  0000 L CNN
F 1 "C" H 7965 3405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 7888 3300 50  0001 C CNN
F 3 "~" H 7850 3450 50  0001 C CNN
	1    7850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 5250 4300 4750
Wire Wire Line
	4300 4200 4300 4450
Wire Wire Line
	6300 2650 6600 2650
Wire Wire Line
	6600 2650 6600 2150
Wire Wire Line
	4300 5350 4300 5250
Connection ~ 4300 5250
Wire Wire Line
	4300 5750 4300 5650
Wire Wire Line
	4300 5750 4600 5750
Connection ~ 4300 5750
Wire Wire Line
	3800 5350 3800 5250
Wire Wire Line
	3800 5650 3800 5750
Connection ~ 3800 5750
Wire Wire Line
	3800 5750 4300 5750
Wire Wire Line
	2900 3700 2900 3850
Wire Wire Line
	2900 3400 2900 3250
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 6045F793
P 3500 3500
F 0 "J1" H 3350 3550 50  0000 C CNN
F 1 "BAT" H 3350 3450 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3500 3500 50  0001 C CNN
F 3 "~" H 3500 3500 50  0001 C CNN
	1    3500 3500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3300 3600 3200 3600
Wire Wire Line
	3200 3600 3200 3850
Wire Wire Line
	3200 3850 2900 3850
Connection ~ 2900 3850
Wire Wire Line
	2900 3850 2900 5750
Wire Wire Line
	3300 3500 3200 3500
Wire Wire Line
	3200 3500 3200 3250
Wire Wire Line
	3200 3250 2900 3250
Connection ~ 2900 3250
Wire Wire Line
	2900 3250 2900 2150
Wire Wire Line
	3800 2500 3800 2450
Connection ~ 3800 2150
Wire Wire Line
	3800 2150 6600 2150
Wire Wire Line
	3800 5250 3800 3000
Connection ~ 3800 5250
Wire Wire Line
	4050 2650 3950 2650
Wire Wire Line
	3950 2650 3950 2450
Wire Wire Line
	3950 2450 3800 2450
Connection ~ 3800 2450
Wire Wire Line
	3800 2450 3800 2150
Wire Wire Line
	4050 2750 3950 2750
Wire Wire Line
	3950 3000 3800 3000
Wire Wire Line
	3950 2750 3950 3000
Connection ~ 3800 3000
Wire Wire Line
	3800 3000 3800 2900
Wire Wire Line
	7850 3150 7850 3300
$Comp
L Device:R R4
U 1 1 60522313
P 7600 3150
F 0 "R4" H 7670 3196 50  0000 L CNN
F 1 "R" H 7670 3105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7530 3150 50  0001 C CNN
F 3 "~" H 7600 3150 50  0001 C CNN
	1    7600 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 3150 7850 3150
Wire Wire Line
	7450 3150 6300 3150
Connection ~ 7850 3150
$Comp
L Device:CP C4
U 1 1 6052DBA1
P 8450 3150
F 0 "C4" V 8195 3150 50  0000 C CNN
F 1 "CP" V 8286 3150 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8488 3000 50  0001 C CNN
F 3 "~" H 8450 3150 50  0001 C CNN
	1    8450 3150
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:PN2222A Q2
U 1 1 60531EEE
P 8900 3150
F 0 "Q2" H 9090 3196 50  0000 L CNN
F 1 "PN2222A" H 9090 3105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9100 3075 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/PN/PN2222A.pdf" H 8900 3150 50  0001 L CNN
	1    8900 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 60536D0E
P 8650 2900
F 0 "R6" H 8720 2946 50  0000 L CNN
F 1 "R" H 8720 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 8580 2900 50  0001 C CNN
F 3 "~" H 8650 2900 50  0001 C CNN
	1    8650 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 3150 8650 3150
Wire Wire Line
	8650 3050 8650 3150
Connection ~ 8650 3150
Wire Wire Line
	8650 3150 8700 3150
Connection ~ 6600 2150
$Comp
L Device:Speaker LS1
U 1 1 60540C5C
P 9200 2400
F 0 "LS1" H 9370 2396 50  0000 L CNN
F 1 "Speaker" H 9370 2305 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9200 2200 50  0001 C CNN
F 3 "~" H 9190 2350 50  0001 C CNN
	1    9200 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 2150 9000 2400
Wire Wire Line
	9000 2950 9000 2650
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 6047B078
P 7500 3600
F 0 "J3" H 7472 3574 50  0000 R CNN
F 1 "LIGHT_SENSOR" H 7472 3483 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7500 3600 50  0001 C CNN
F 3 "~" H 7500 3600 50  0001 C CNN
	1    7500 3600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6300 2950 6700 2950
$Comp
L Device:R R7
U 1 1 604BEFDB
P 6700 3350
F 0 "R7" H 6770 3396 50  0000 L CNN
F 1 "R" H 6770 3305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 6630 3350 50  0001 C CNN
F 3 "~" H 6700 3350 50  0001 C CNN
	1    6700 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2950 6700 3200
Wire Wire Line
	6300 3450 6550 3450
Wire Wire Line
	6550 3450 6550 3600
Wire Wire Line
	6550 3600 6700 3600
Wire Wire Line
	6700 3600 6700 3500
Wire Wire Line
	7300 3600 6700 3600
Connection ~ 6700 3600
$Comp
L Device:R R8
U 1 1 604D6C91
P 6700 4150
F 0 "R8" H 6770 4196 50  0000 L CNN
F 1 "R" H 6770 4105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 6630 4150 50  0001 C CNN
F 3 "~" H 6700 4150 50  0001 C CNN
	1    6700 4150
	0    -1   -1   0   
$EndComp
$Comp
L Jumper:SolderJumper_3_Open JP1
U 1 1 604D7C1D
P 7050 4150
F 0 "JP1" V 7004 4218 50  0000 L CNN
F 1 "12H - 24H" V 7095 4218 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm_NumberLabels" H 7050 4150 50  0001 C CNN
F 3 "~" H 7050 4150 50  0001 C CNN
	1    7050 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	7850 3600 7850 4950
Wire Wire Line
	6850 4150 6900 4150
Wire Wire Line
	7050 2950 6700 2950
Connection ~ 6700 2950
Wire Wire Line
	7050 2950 7050 3950
Wire Wire Line
	4600 5750 4600 5450
Wire Wire Line
	2900 2150 3800 2150
Wire Wire Line
	2900 5750 3800 5750
Wire Wire Line
	7850 3150 8300 3150
Wire Wire Line
	4900 4250 4600 4250
Wire Wire Line
	4900 4450 4800 4450
Wire Wire Line
	4800 4450 4800 4800
Wire Wire Line
	4800 4800 6550 4800
Wire Wire Line
	6550 4800 6550 4150
Wire Wire Line
	6300 2750 6450 2750
Wire Wire Line
	6450 2750 6450 4950
Wire Wire Line
	4600 4250 4600 4900
Wire Wire Line
	6600 2150 9000 2150
Wire Wire Line
	8650 2750 8650 2650
Wire Wire Line
	8650 2650 9000 2650
Connection ~ 9000 2650
Wire Wire Line
	9000 2650 9000 2500
Wire Wire Line
	7050 4350 7050 4900
Wire Wire Line
	7050 4900 4600 4900
Connection ~ 4600 4900
Wire Wire Line
	4600 4900 4600 5050
Wire Wire Line
	6300 4250 6400 4250
Wire Wire Line
	6400 4250 6400 5000
Wire Wire Line
	6400 5000 7200 5000
Wire Wire Line
	9000 3350 9000 5000
Wire Wire Line
	6450 4950 7850 4950
Wire Wire Line
	7300 3700 7200 3700
Wire Wire Line
	7200 3700 7200 5000
Connection ~ 7200 5000
Wire Wire Line
	7200 5000 9000 5000
Wire Wire Line
	3800 5250 4300 5250
$Comp
L Connector:Conn_01x17_Male J4
U 1 1 604C5DB6
P 4550 3350
F 0 "J4" H 4658 4331 50  0000 C CNN
F 1 "Conn_01x17_Male" H 4658 4240 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x17_P2.54mm_Vertical" H 4550 3350 50  0001 C CNN
F 3 "~" H 4550 3350 50  0001 C CNN
	1    4550 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4350 4450 4200
Wire Wire Line
	4450 4200 4300 4200
Wire Wire Line
	4450 4350 4900 4350
Wire Wire Line
	4750 2550 4900 2550
Wire Wire Line
	4750 2650 4900 2650
Wire Wire Line
	4750 2750 4900 2750
Wire Wire Line
	4750 2850 4900 2850
Wire Wire Line
	4750 2950 4900 2950
Wire Wire Line
	4750 3050 4900 3050
Wire Wire Line
	4750 3150 4900 3150
Wire Wire Line
	4750 3250 4900 3250
Wire Wire Line
	4750 3350 4900 3350
Wire Wire Line
	4750 3450 4900 3450
Wire Wire Line
	4750 3550 4900 3550
Wire Wire Line
	4750 3650 4900 3650
Wire Wire Line
	4750 3750 4900 3750
Wire Wire Line
	4750 3850 4900 3850
Wire Wire Line
	4750 3950 4900 3950
Wire Wire Line
	4750 4050 4900 4050
Wire Wire Line
	4750 4150 4900 4150
$EndSCHEMATC