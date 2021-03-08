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
P 8000 3550
F 0 "BT1" H 8118 3646 50  0000 L CNN
F 1 "Battery_Cell" H 8118 3555 50  0000 L CNN
F 2 "Battery:BatteryHolder_Keystone_2462_2xAA" V 8000 3610 50  0001 C CNN
F 3 "~" V 8000 3610 50  0001 C CNN
	1    8000 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2650 8000 2650
Wire Wire Line
	8000 2650 8000 3200
Wire Wire Line
	8000 4800 4650 4800
Wire Wire Line
	4650 4800 4650 2750
Wire Wire Line
	4650 2750 4900 2750
Wire Wire Line
	8000 3650 8000 3750
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 6045F793
P 7600 3450
F 0 "J1" H 7708 3631 50  0000 C CNN
F 1 "Conn_01x02_Male" H 7708 3540 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7600 3450 50  0001 C CNN
F 3 "~" H 7600 3450 50  0001 C CNN
	1    7600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 3550 7850 3550
Wire Wire Line
	7850 3550 7850 3750
Wire Wire Line
	7850 3750 8000 3750
Connection ~ 8000 3750
Wire Wire Line
	8000 3750 8000 4800
Wire Wire Line
	7800 3450 7850 3450
Wire Wire Line
	7850 3450 7850 3200
Wire Wire Line
	7850 3200 8000 3200
Connection ~ 8000 3200
Wire Wire Line
	8000 3200 8000 3350
$Comp
L Transistor_FET:2N7000 Q1
U 1 1 60462339
P 8150 2300
F 0 "Q1" H 8354 2346 50  0000 L CNN
F 1 "2N7000" H 8354 2255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8350 2225 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7000.pdf" H 8150 2300 50  0001 L CNN
	1    8150 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 604643AE
P 9200 2950
F 0 "R1" H 9270 2996 50  0000 L CNN
F 1 "R" H 9270 2905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9130 2950 50  0001 C CNN
F 3 "~" H 9200 2950 50  0001 C CNN
	1    9200 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 60464B9E
P 9200 3450
F 0 "R2" H 9270 3496 50  0000 L CNN
F 1 "R" H 9270 3405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9130 3450 50  0001 C CNN
F 3 "~" H 9200 3450 50  0001 C CNN
	1    9200 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 60465274
P 9750 3200
F 0 "R3" H 9820 3246 50  0000 L CNN
F 1 "R" H 9820 3155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9680 3200 50  0001 C CNN
F 3 "~" H 9750 3200 50  0001 C CNN
	1    9750 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 60465AFE
P 8900 4100
F 0 "C1" H 9018 4146 50  0000 L CNN
F 1 "CP" H 9018 4055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8938 3950 50  0001 C CNN
F 3 "~" H 8900 4100 50  0001 C CNN
	1    8900 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 60467D8D
P 9550 2400
F 0 "J2" H 9658 2581 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9658 2490 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9550 2400 50  0001 C CNN
F 3 "~" H 9550 2400 50  0001 C CNN
	1    9550 2400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
