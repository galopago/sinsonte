EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "SINSONTE"
Date ""
Rev ""
Comp "Galopago"
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
P 2500 2850
F 0 "BT1" H 2050 3000 50  0000 L CNN
F 1 "Battery_Cell" H 1950 2800 50  0000 L CNN
F 2 "Battery:BatteryHolder_Keystone_2462_2xAA" V 2500 2910 50  0001 C CNN
F 3 "~" V 2500 2910 50  0001 C CNN
	1    2500 2850
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7000 Q1
U 1 1 60462339
P 4150 3650
F 0 "Q1" H 4354 3696 50  0000 L CNN
F 1 "2N7000" H 4354 3605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 4350 3575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7000.pdf" H 4150 3650 50  0001 L CNN
	1    4150 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 604643AE
P 3900 3300
F 0 "R1" H 3970 3346 50  0000 L CNN
F 1 "100k" H 3970 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3830 3300 50  0001 C CNN
F 3 "~" H 3900 3300 50  0001 C CNN
	1    3900 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 60467D8D
P 3250 3900
F 0 "J2" H 3250 4100 50  0000 C CNN
F 1 "CLOCK" H 3150 4000 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3250 3900 50  0001 C CNN
F 3 "~" H 3250 3900 50  0001 C CNN
	1    3250 3900
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 60495A78
P 2900 3950
F 0 "SW1" V 2850 4300 50  0000 R CNN
F 1 "SW_Push" V 3000 4400 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 2900 4150 50  0001 C CNN
F 3 "~" H 2900 4150 50  0001 C CNN
	1    2900 3950
	0    -1   1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 604A087C
P 8250 3500
F 0 "C2" H 8365 3546 50  0000 L CNN
F 1 "0.1uF" H 8365 3455 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 8288 3350 50  0001 C CNN
F 3 "~" H 8250 3500 50  0001 C CNN
	1    8250 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2650 6450 2650
Wire Wire Line
	6450 2650 6450 2150
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 6045F793
P 2950 2750
F 0 "J1" H 2800 2800 50  0000 C CNN
F 1 "BAT" H 2800 2700 50  0000 C CNN
F 2 "TerminalBlock_4Ucon:TerminalBlock_4Ucon_1x02_P3.50mm_Horizontal" H 2950 2750 50  0001 C CNN
F 3 "~" H 2950 2750 50  0001 C CNN
	1    2950 2750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8250 3150 8250 3350
$Comp
L Device:R R4
U 1 1 60522313
P 7950 3150
F 0 "R4" H 8020 3196 50  0000 L CNN
F 1 "220" H 8020 3105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7880 3150 50  0001 C CNN
F 3 "~" H 7950 3150 50  0001 C CNN
	1    7950 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8100 3150 8250 3150
$Comp
L Device:CP C4
U 1 1 6052DBA1
P 8450 3150
F 0 "C4" V 8195 3150 50  0000 C CNN
F 1 "100uF" V 8286 3150 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8488 3000 50  0001 C CNN
F 3 "~" H 8450 3150 50  0001 C CNN
	1    8450 3150
	0    -1   1    0   
$EndComp
$Comp
L Transistor_BJT:PN2222A Q2
U 1 1 60531EEE
P 8900 3150
F 0 "Q2" H 9090 3196 50  0000 L CNN
F 1 "PN2222A" H 9090 3105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 9100 3075 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/PN/PN2222A.pdf" H 8900 3150 50  0001 L CNN
	1    8900 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 60536D0E
P 8650 2900
F 0 "R6" H 8720 2946 50  0000 L CNN
F 1 "2.2k" H 8720 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 8580 2900 50  0001 C CNN
F 3 "~" H 8650 2900 50  0001 C CNN
	1    8650 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3050 8650 3150
Wire Wire Line
	8650 3150 8700 3150
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
	9000 2950 9000 2650
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 6047B078
P 8150 3600
F 0 "J4" H 8122 3574 50  0000 R CNN
F 1 "LIGHT_SENSOR" H 8122 3483 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8150 3600 50  0001 C CNN
F 3 "~" H 8150 3600 50  0001 C CNN
	1    8150 3600
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 604BEFDB
P 7200 3350
F 0 "R7" H 7270 3396 50  0000 L CNN
F 1 "R" H 7270 3305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7130 3350 50  0001 C CNN
F 3 "~" H 7200 3350 50  0001 C CNN
	1    7200 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3450 7050 3600
Wire Wire Line
	7050 3600 7200 3600
Wire Wire Line
	7200 3600 7200 3500
Wire Wire Line
	7950 3600 7200 3600
Connection ~ 7200 3600
$Comp
L Device:R R8
U 1 1 604D6C91
P 7250 4150
F 0 "R8" H 7320 4196 50  0000 L CNN
F 1 "R" H 7320 4105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7180 4150 50  0001 C CNN
F 3 "~" H 7250 4150 50  0001 C CNN
	1    7250 4150
	0    -1   -1   0   
$EndComp
$Comp
L Jumper:SolderJumper_3_Open JP1
U 1 1 604D7C1D
P 7650 4150
F 0 "JP1" V 7604 4218 50  0000 L CNN
F 1 "12H - 24H" V 7695 4218 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm_NumberLabels" H 7650 4150 50  0001 C CNN
F 3 "~" H 7650 4150 50  0001 C CNN
	1    7650 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 3650 8250 4950
Wire Wire Line
	7400 4150 7500 4150
Wire Wire Line
	4900 4250 4800 4250
Wire Wire Line
	4900 4450 4800 4450
Wire Wire Line
	7100 4800 7100 4150
Wire Wire Line
	6300 2750 6450 2750
Wire Wire Line
	8650 2750 8650 2650
Wire Wire Line
	8650 2650 9000 2650
Connection ~ 9000 2650
Wire Wire Line
	9000 2650 9000 2500
Wire Wire Line
	7650 4350 7650 4900
Wire Wire Line
	6300 4250 6400 4250
Wire Wire Line
	6400 4250 6400 5000
Wire Wire Line
	9000 3350 9000 5000
Wire Wire Line
	4600 4900 7650 4900
Wire Wire Line
	4800 4800 7100 4800
Connection ~ 6450 2650
Wire Wire Line
	6300 3250 6400 3250
Wire Wire Line
	6400 3250 6400 3750
Wire Wire Line
	6400 3750 6300 3750
Wire Wire Line
	9000 2400 9000 2300
Wire Wire Line
	9000 2300 7650 2300
Wire Wire Line
	7650 2300 7650 2950
Connection ~ 7650 2950
Wire Wire Line
	4600 4250 4600 4900
Wire Wire Line
	3900 3150 3900 2150
Wire Wire Line
	3900 2150 6450 2150
Connection ~ 3900 4900
Wire Wire Line
	3900 4900 4250 4900
Wire Wire Line
	4250 4900 4250 3850
$Comp
L Device:R R2
U 1 1 60464B9E
P 3750 4100
F 0 "R2" H 3600 4050 50  0000 L CNN
F 1 "100" H 3550 4150 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3680 4100 50  0001 C CNN
F 3 "~" H 3750 4100 50  0001 C CNN
	1    3750 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	2900 3750 2900 3650
Wire Wire Line
	3050 3900 3000 3900
$Comp
L Device:R R3
U 1 1 606E7686
P 2900 4500
F 0 "R3" H 2970 4546 50  0000 L CNN
F 1 "10" H 2970 4455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2830 4500 50  0001 C CNN
F 3 "~" H 2900 4500 50  0001 C CNN
	1    2900 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 4350 2900 4150
Wire Wire Line
	2900 4650 2900 4900
Connection ~ 2900 4900
Wire Wire Line
	2900 4900 3900 4900
Connection ~ 2900 4150
Wire Wire Line
	6300 2850 6350 2850
Wire Wire Line
	6350 2850 6350 2400
Wire Wire Line
	6350 2400 4250 2400
Wire Wire Line
	4250 2400 4250 3450
Connection ~ 3900 2150
Wire Wire Line
	2500 2150 3900 2150
Wire Wire Line
	2500 4900 2900 4900
Wire Wire Line
	2500 2150 2500 2650
Wire Wire Line
	2500 2950 2500 3000
Wire Wire Line
	2750 2750 2650 2750
Wire Wire Line
	2650 2750 2650 2650
Wire Wire Line
	2650 2650 2500 2650
Connection ~ 2500 2650
Wire Wire Line
	2750 2850 2650 2850
Wire Wire Line
	2650 2850 2650 3000
Wire Wire Line
	2650 3000 2500 3000
Connection ~ 2500 3000
Wire Wire Line
	2500 3000 2500 4900
Wire Wire Line
	3050 4000 3000 4000
Wire Wire Line
	3000 4150 2900 4150
Wire Wire Line
	2900 3650 3000 3650
Connection ~ 3000 3650
Wire Wire Line
	3000 3650 3750 3650
Wire Wire Line
	3900 3650 3950 3650
Wire Wire Line
	3900 3450 3900 3650
Connection ~ 3900 3650
Wire Wire Line
	3750 4350 4650 4350
Wire Wire Line
	3900 4700 3900 4900
Wire Wire Line
	3900 4400 3900 3650
$Comp
L Device:CP C1
U 1 1 60465AFE
P 3900 4550
F 0 "C1" H 4018 4596 50  0000 L CNN
F 1 "10uF" H 4018 4505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 3938 4400 50  0001 C CNN
F 3 "~" H 3900 4550 50  0001 C CNN
	1    3900 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4350 3750 4250
Wire Wire Line
	3750 3950 3750 3650
Connection ~ 3750 3650
Wire Wire Line
	3750 3650 3900 3650
Wire Wire Line
	4250 4950 4250 4900
Connection ~ 4250 4900
Wire Wire Line
	6450 2750 6450 3250
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 60882A91
P 3550 4000
F 0 "J3" H 3650 3850 50  0000 R CNN
F 1 "PROG" H 3650 3750 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3550 4000 50  0001 C CNN
F 3 "~" H 3550 4000 50  0001 C CNN
	1    3550 4000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3000 3650 3000 3850
Wire Wire Line
	3350 3900 3300 3900
Wire Wire Line
	3300 3900 3300 3850
Wire Wire Line
	3300 3850 3000 3850
Connection ~ 3000 3850
Wire Wire Line
	3000 3850 3000 3900
Wire Wire Line
	3000 4000 3000 4050
Wire Wire Line
	3350 4000 3300 4000
Wire Wire Line
	3300 4000 3300 4050
Wire Wire Line
	3300 4050 3000 4050
Connection ~ 3000 4050
Wire Wire Line
	3000 4050 3000 4150
Wire Wire Line
	4800 2750 4800 3250
Connection ~ 4800 2750
Wire Wire Line
	4800 2750 4900 2750
Connection ~ 4800 3250
Wire Wire Line
	4800 3250 4900 3250
Wire Wire Line
	4800 3250 4800 3750
Connection ~ 4800 3750
Wire Wire Line
	4800 3750 4900 3750
Wire Wire Line
	4800 3750 4800 4250
Connection ~ 4800 4250
Wire Wire Line
	6400 3250 6450 3250
Connection ~ 6400 3250
Connection ~ 6450 3250
Wire Wire Line
	6450 3250 6450 4250
Wire Wire Line
	6400 4250 6450 4250
Connection ~ 6400 4250
Wire Wire Line
	4800 4450 4800 4800
Wire Wire Line
	4600 4900 4600 5000
Wire Wire Line
	4600 5000 6400 5000
Connection ~ 4600 4900
Connection ~ 6400 5000
Wire Wire Line
	6450 4950 8250 4950
Wire Wire Line
	6450 4950 4250 4950
Connection ~ 6450 4950
Connection ~ 6450 4250
Wire Wire Line
	6450 4250 6450 4950
Wire Wire Line
	3350 4100 3300 4100
Wire Wire Line
	3300 4100 3300 4050
Connection ~ 3300 4050
Wire Wire Line
	8300 3150 8250 3150
Connection ~ 8250 3150
Wire Wire Line
	8600 3150 8650 3150
Connection ~ 8650 3150
Wire Wire Line
	6400 5000 6950 5000
Wire Wire Line
	7750 3700 7750 2950
Wire Wire Line
	7750 2950 7650 2950
Wire Wire Line
	7750 3700 7950 3700
Wire Wire Line
	7200 3200 6950 3200
Wire Wire Line
	6950 3200 6950 5000
Connection ~ 6950 5000
Wire Wire Line
	6950 5000 9000 5000
Text Notes 3150 3350 0    50   ~ 0
Increase to 470K\nfor CircuitPython
Connection ~ 4800 4450
Wire Wire Line
	4600 4250 4650 4250
$Comp
L Connector:Conn_01x20_Male J5
U 1 1 618AE8C2
P 4450 3450
F 0 "J5" H 4558 4531 50  0000 C CNN
F 1 "Conn_01x20_Male" H 4450 4600 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x20_P2.54mm_Vertical" H 4450 3450 50  0001 C CNN
F 3 "~" H 4450 3450 50  0001 C CNN
	1    4450 3450
	1    0    0    -1  
$EndComp
Connection ~ 4650 4250
Wire Wire Line
	4650 4250 4800 4250
Connection ~ 4650 4350
Wire Wire Line
	4650 4350 4900 4350
Wire Wire Line
	4650 2550 4900 2550
Wire Wire Line
	4650 2650 4900 2650
Wire Wire Line
	4650 2750 4800 2750
Wire Wire Line
	4650 2850 4900 2850
Wire Wire Line
	4650 2950 4900 2950
Wire Wire Line
	4650 3050 4900 3050
Wire Wire Line
	4650 3150 4900 3150
Wire Wire Line
	4650 3250 4800 3250
Wire Wire Line
	4650 3350 4900 3350
Wire Wire Line
	4650 3450 4900 3450
Wire Wire Line
	4650 3550 4900 3550
Wire Wire Line
	4650 3650 4900 3650
Wire Wire Line
	4650 3750 4800 3750
Wire Wire Line
	4650 3850 4900 3850
Wire Wire Line
	4650 3950 4900 3950
Wire Wire Line
	4650 4050 4900 4050
Wire Wire Line
	4650 4150 4900 4150
Wire Wire Line
	4650 4450 4800 4450
Wire Wire Line
	6300 2550 6650 2550
Wire Wire Line
	6450 2650 6650 2650
Wire Wire Line
	6450 2750 6650 2750
Connection ~ 6450 2750
Wire Wire Line
	6300 3050 6650 3050
Wire Wire Line
	6450 3250 6650 3250
Wire Wire Line
	6300 3350 6650 3350
Wire Wire Line
	6300 3550 6650 3550
Wire Wire Line
	6300 3650 6650 3650
Wire Wire Line
	6650 3750 6400 3750
Connection ~ 6400 3750
Wire Wire Line
	6300 3850 6650 3850
Wire Wire Line
	6300 3950 6650 3950
Wire Wire Line
	6300 4050 6650 4050
Wire Wire Line
	6300 4150 6650 4150
Wire Wire Line
	6650 4250 6450 4250
Wire Wire Line
	6300 4350 6650 4350
Wire Wire Line
	6300 4450 6650 4450
Wire Wire Line
	6650 3150 6300 3150
Wire Wire Line
	7800 3150 6650 3150
Connection ~ 6650 3150
Wire Wire Line
	6650 3450 7050 3450
Wire Wire Line
	6300 3450 6650 3450
Connection ~ 6650 3450
$Comp
L Connector:Conn_01x20_Male J6
U 1 1 618B0A3E
P 6850 3450
F 0 "J6" H 6900 4550 50  0000 R CNN
F 1 "Conn_01x20_Male" H 7150 4650 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x20_P2.54mm_Vertical" H 6850 3450 50  0001 C CNN
F 3 "~" H 6850 3450 50  0001 C CNN
	1    6850 3450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7650 2950 7650 3950
Connection ~ 6650 2950
Wire Wire Line
	6650 2950 7650 2950
Wire Wire Line
	6300 2950 6650 2950
Wire Wire Line
	6350 2850 6650 2850
Connection ~ 6350 2850
$Comp
L Connector:Conn_01x05_Male J8
U 1 1 61902046
P 10650 5650
F 0 "J8" H 10758 6031 50  0000 C CNN
F 1 "Conn_01x05_Male" H 10758 5940 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 10650 5650 50  0001 C CNN
F 3 "~" H 10650 5650 50  0001 C CNN
	1    10650 5650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J7
U 1 1 6190E2F0
P 9600 5650
F 0 "J7" H 9708 6031 50  0000 C CNN
F 1 "Conn_01x05_Male" H 9708 5940 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 9600 5650 50  0001 C CNN
F 3 "~" H 9600 5650 50  0001 C CNN
	1    9600 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 5450 9800 5550
Wire Wire Line
	9800 5650 9800 5550
Connection ~ 9800 5550
Wire Wire Line
	9800 5750 9800 5650
Connection ~ 9800 5650
Wire Wire Line
	9800 5850 9800 5750
Connection ~ 9800 5750
Wire Wire Line
	10850 5850 10850 5750
Wire Wire Line
	10850 5750 10850 5650
Connection ~ 10850 5750
Wire Wire Line
	10850 5550 10850 5450
Wire Wire Line
	10850 5650 10850 5550
Connection ~ 10850 5650
Connection ~ 10850 5550
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 6194F5CD
P 9100 6250
F 0 "J9" H 9208 6431 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9208 6340 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9100 6250 50  0001 C CNN
F 3 "~" H 9100 6250 50  0001 C CNN
	1    9100 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 6250 9300 6350
$Comp
L Connector:Conn_01x02_Male J13
U 1 1 6195EF97
P 9100 6050
F 0 "J13" H 9208 6231 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9208 6140 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9100 6050 50  0001 C CNN
F 3 "~" H 9100 6050 50  0001 C CNN
	1    9100 6050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J12
U 1 1 6195FB17
P 9100 5850
F 0 "J12" H 9208 6031 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9208 5940 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9100 5850 50  0001 C CNN
F 3 "~" H 9100 5850 50  0001 C CNN
	1    9100 5850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J11
U 1 1 6196008A
P 9100 5650
F 0 "J11" H 9208 5831 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9208 5740 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9100 5650 50  0001 C CNN
F 3 "~" H 9100 5650 50  0001 C CNN
	1    9100 5650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J10
U 1 1 61960476
P 9100 5450
F 0 "J10" H 9208 5631 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9208 5540 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9100 5450 50  0001 C CNN
F 3 "~" H 9100 5450 50  0001 C CNN
	1    9100 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 6050 9300 6150
Wire Wire Line
	9300 5950 9300 5850
Wire Wire Line
	9300 5750 9300 5650
Wire Wire Line
	9300 5550 9300 5450
$Comp
L Connector:Conn_01x02_Male J18
U 1 1 61984084
P 10050 6250
F 0 "J18" H 10158 6431 50  0000 C CNN
F 1 "Conn_01x02_Male" H 10158 6340 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10050 6250 50  0001 C CNN
F 3 "~" H 10050 6250 50  0001 C CNN
	1    10050 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J17
U 1 1 61984FA8
P 10050 6050
F 0 "J17" H 10158 6231 50  0000 C CNN
F 1 "Conn_01x02_Male" H 10158 6140 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10050 6050 50  0001 C CNN
F 3 "~" H 10050 6050 50  0001 C CNN
	1    10050 6050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J16
U 1 1 61985BD2
P 10050 5850
F 0 "J16" H 10158 6031 50  0000 C CNN
F 1 "Conn_01x02_Male" H 10158 5940 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10050 5850 50  0001 C CNN
F 3 "~" H 10050 5850 50  0001 C CNN
	1    10050 5850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J15
U 1 1 61986D11
P 10050 5650
F 0 "J15" H 10158 5831 50  0000 C CNN
F 1 "Conn_01x02_Male" H 10158 5740 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10050 5650 50  0001 C CNN
F 3 "~" H 10050 5650 50  0001 C CNN
	1    10050 5650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J14
U 1 1 619876D5
P 10050 5450
F 0 "J14" H 10158 5631 50  0000 C CNN
F 1 "Conn_01x02_Male" H 10158 5540 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10050 5450 50  0001 C CNN
F 3 "~" H 10050 5450 50  0001 C CNN
	1    10050 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 5450 10250 5550
Wire Wire Line
	10250 5650 10250 5750
Wire Wire Line
	10250 5850 10250 5950
Wire Wire Line
	10250 6050 10250 6150
Wire Wire Line
	10250 6250 10250 6350
Text Notes 9750 5150 0    50   ~ 0
PROTO AREA
$EndSCHEMATC
