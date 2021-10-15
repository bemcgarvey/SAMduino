EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 4 4
Title "SAMduino"
Date "2021-10-07"
Rev "1.0"
Comp "Quantum Embedded Systems"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:LED D8
U 1 1 6164EF7E
P 2650 1400
F 0 "D8" H 2643 1617 50  0000 C CNN
F 1 "Yellow" H 2643 1526 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 2650 1400 50  0001 C CNN
F 3 "~" H 2650 1400 50  0001 C CNN
	1    2650 1400
	0    1    1    0   
$EndComp
$Comp
L Device:LED D7
U 1 1 6164F637
P 2250 1400
F 0 "D7" H 2243 1617 50  0000 C CNN
F 1 "Blue" H 2243 1526 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 2250 1400 50  0001 C CNN
F 3 "~" H 2250 1400 50  0001 C CNN
	1    2250 1400
	0    1    1    0   
$EndComp
$Comp
L Device:LED D6
U 1 1 6164FBB6
P 1900 1400
F 0 "D6" H 1893 1617 50  0000 C CNN
F 1 "Green" H 1893 1526 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 1900 1400 50  0001 C CNN
F 3 "~" H 1900 1400 50  0001 C CNN
	1    1900 1400
	0    1    1    0   
$EndComp
$Comp
L Device:LED D5
U 1 1 616502B2
P 1550 1400
F 0 "D5" H 1543 1617 50  0000 C CNN
F 1 "Red" H 1543 1526 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 1550 1400 50  0001 C CNN
F 3 "~" H 1550 1400 50  0001 C CNN
	1    1550 1400
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 61651BC9
P 2650 1850
F 0 "R12" H 2720 1896 50  0000 L CNN
F 1 "220R" H 2720 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2580 1850 50  0001 C CNN
F 3 "~" H 2650 1850 50  0001 C CNN
	1    2650 1850
	-1   0    0    1   
$EndComp
$Comp
L Device:R R11
U 1 1 61652B0A
P 2250 1850
F 0 "R11" H 2320 1896 50  0000 L CNN
F 1 "220R" H 2320 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2180 1850 50  0001 C CNN
F 3 "~" H 2250 1850 50  0001 C CNN
	1    2250 1850
	-1   0    0    1   
$EndComp
$Comp
L Device:R R10
U 1 1 6165318A
P 1900 1850
F 0 "R10" H 1970 1896 50  0000 L CNN
F 1 "220R" H 1970 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1830 1850 50  0001 C CNN
F 3 "~" H 1900 1850 50  0001 C CNN
	1    1900 1850
	-1   0    0    1   
$EndComp
$Comp
L Device:R R9
U 1 1 616539D1
P 1550 1850
F 0 "R9" H 1620 1896 50  0000 L CNN
F 1 "220R" H 1620 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1480 1850 50  0001 C CNN
F 3 "~" H 1550 1850 50  0001 C CNN
	1    1550 1850
	-1   0    0    1   
$EndComp
$Comp
L Device:R R8
U 1 1 61656110
P 1450 5800
F 0 "R8" H 1520 5846 50  0000 L CNN
F 1 "100k" H 1520 5755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1380 5800 50  0001 C CNN
F 3 "~" H 1450 5800 50  0001 C CNN
	1    1450 5800
	-1   0    0    1   
$EndComp
$Comp
L Device:R R13
U 1 1 616567F6
P 2950 6150
F 0 "R13" H 3020 6196 50  0000 L CNN
F 1 "10k" H 3020 6105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2880 6150 50  0001 C CNN
F 3 "~" H 2950 6150 50  0001 C CNN
	1    2950 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2000 1550 2150
Wire Wire Line
	1550 2150 1750 2150
Wire Wire Line
	2650 2150 2650 2000
Wire Wire Line
	1550 1550 1550 1700
Wire Wire Line
	1900 1550 1900 1700
Wire Wire Line
	2250 1550 2250 1700
Wire Wire Line
	2650 1550 2650 1700
Wire Wire Line
	1900 2000 1900 2150
Wire Wire Line
	2250 2000 2250 2150
Wire Wire Line
	2250 2150 2400 2150
Text GLabel 1550 1050 1    50   Input ~ 0
PD4
Text GLabel 1900 1050 1    50   Input ~ 0
PD5
Text GLabel 2250 1050 1    50   Input ~ 0
PD6
Text GLabel 2650 1050 1    50   Input ~ 0
PD7
Wire Wire Line
	1550 1250 1550 1050
Wire Wire Line
	1900 1250 1900 1050
Wire Wire Line
	2250 1250 2250 1050
Wire Wire Line
	2650 1250 2650 1050
$Comp
L power:GND #PWR041
U 1 1 61639104
P 2650 4200
F 0 "#PWR041" H 2650 3950 50  0001 C CNN
F 1 "GND" H 2655 4027 50  0000 C CNN
F 2 "" H 2650 4200 50  0001 C CNN
F 3 "" H 2650 4200 50  0001 C CNN
	1    2650 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4050 2650 4200
$Comp
L power:GND #PWR039
U 1 1 61639BC6
P 1700 4200
F 0 "#PWR039" H 1700 3950 50  0001 C CNN
F 1 "GND" H 1705 4027 50  0000 C CNN
F 2 "" H 1700 4200 50  0001 C CNN
F 3 "" H 1700 4200 50  0001 C CNN
	1    1700 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4050 1700 4200
Text GLabel 1150 3950 1    50   Input ~ 0
Button1
Text GLabel 2100 3950 1    50   Input ~ 0
Button2
$Comp
L power:GND #PWR040
U 1 1 6163E102
P 2150 6150
F 0 "#PWR040" H 2150 5900 50  0001 C CNN
F 1 "GND" H 2155 5977 50  0000 C CNN
F 2 "" H 2150 6150 50  0001 C CNN
F 3 "" H 2150 6150 50  0001 C CNN
	1    2150 6150
	1    0    0    -1  
$EndComp
Text GLabel 1250 5600 0    50   Input ~ 0
VCC3V3
Text GLabel 1150 6050 0    50   Input ~ 0
NRST
Wire Wire Line
	2100 6050 2150 6050
Wire Wire Line
	2150 6050 2150 6150
Wire Wire Line
	1150 6050 1450 6050
Wire Wire Line
	1450 5950 1450 6050
Wire Wire Line
	1250 5600 1450 5600
Wire Wire Line
	1450 5600 1450 5650
Text GLabel 3650 5850 2    50   Input ~ 0
VCC3V3
Text GLabel 2850 5850 0    50   Input ~ 0
ERASE
$Comp
L power:GND #PWR042
U 1 1 6164499E
P 2950 6300
F 0 "#PWR042" H 2950 6050 50  0001 C CNN
F 1 "GND" H 2955 6127 50  0000 C CNN
F 2 "" H 2950 6300 50  0001 C CNN
F 3 "" H 2950 6300 50  0001 C CNN
	1    2950 6300
	1    0    0    -1  
$EndComp
Text Notes 9100 5000 0    50   ~ 0
USART0
Text Notes 7000 2050 0    50   ~ 0
TWI0
Text Notes 9150 6200 0    50   ~ 0
SPI0
Text Notes 6900 4500 0    50   ~ 0
ADC and DAC
$Comp
L Connector_Generic:Conn_01x08 J20
U 1 1 6166979A
P 9350 3750
F 0 "J20" V 9350 4150 50  0000 L CNN
F 1 "Conn_01x08" H 9430 3651 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Horizontal" H 9350 3750 50  0001 C CNN
F 3 "~" H 9350 3750 50  0001 C CNN
	1    9350 3750
	0    1    1    0   
$EndComp
Text Notes 9000 3950 0    50   ~ 0
Program/Debug
Text GLabel 9650 3250 1    50   Input ~ 0
NRST
Text GLabel 9550 3250 1    50   Input ~ 0
VCC3V3
$Comp
L power:GND #PWR050
U 1 1 6163E159
P 9450 3550
F 0 "#PWR050" H 9450 3300 50  0001 C CNN
F 1 "GND" H 9455 3377 50  0000 C CNN
F 2 "" H 9450 3550 50  0001 C CNN
F 3 "" H 9450 3550 50  0001 C CNN
	1    9450 3550
	-1   0    0    1   
$EndComp
Text GLabel 8950 3250 1    50   Input ~ 0
SWDIO
Text GLabel 9250 3250 1    50   Input ~ 0
SWCLK
Wire Wire Line
	9650 3550 9650 3250
Wire Wire Line
	9550 3550 9550 3250
Wire Wire Line
	8950 3550 8950 3500
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J17
U 1 1 616631CB
P 9150 1700
F 0 "J17" H 9200 1925 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 9200 1926 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 9150 1700 50  0001 C CNN
F 3 "~" H 9150 1700 50  0001 C CNN
	1    9150 1700
	1    0    0    -1  
$EndComp
Text Notes 9100 2000 0    50   ~ 0
Power
Text GLabel 8600 1600 0    50   Input ~ 0
VCC3V3
Text GLabel 9800 1600 2    50   Input ~ 0
VIN
Text GLabel 9800 1700 2    50   Input ~ 0
VDD5V
$Comp
L power:GND #PWR049
U 1 1 61664914
P 8950 2100
F 0 "#PWR049" H 8950 1850 50  0001 C CNN
F 1 "GND" H 8955 1927 50  0000 C CNN
F 2 "" H 8950 2100 50  0001 C CNN
F 3 "" H 8950 2100 50  0001 C CNN
	1    8950 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 1600 9450 1600
Wire Wire Line
	9800 1700 9450 1700
Wire Wire Line
	8600 1600 8800 1600
Wire Wire Line
	8950 1700 8800 1700
Wire Wire Line
	8800 1700 8800 1600
Connection ~ 8800 1600
Wire Wire Line
	8800 1600 8950 1600
Wire Wire Line
	8950 1800 8950 2050
Wire Wire Line
	9450 2050 8950 2050
Connection ~ 8950 2050
Wire Wire Line
	8950 2050 8950 2100
Wire Wire Line
	9450 1800 9450 2050
Text GLabel 8900 4650 0    50   Input ~ 0
RXD0
Text GLabel 9600 4650 2    50   Input ~ 0
TXD0
Text GLabel 8900 4750 0    50   Input ~ 0
VCC3V3
$Comp
L power:GND #PWR051
U 1 1 61676D10
P 9600 4800
F 0 "#PWR051" H 9600 4550 50  0001 C CNN
F 1 "GND" H 9605 4627 50  0000 C CNN
F 2 "" H 9600 4800 50  0001 C CNN
F 3 "" H 9600 4800 50  0001 C CNN
	1    9600 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J15
U 1 1 6163F9FC
P 7050 4100
F 0 "J15" H 7100 4417 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 7100 4326 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 7050 4100 50  0001 C CNN
F 3 "~" H 7050 4100 50  0001 C CNN
	1    7050 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J19
U 1 1 616413EF
P 9200 5850
F 0 "J19" H 9250 6167 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 9250 6076 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 9200 5850 50  0001 C CNN
F 3 "~" H 9200 5850 50  0001 C CNN
	1    9200 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 61644D35
P 6750 1500
F 0 "R14" H 6820 1546 50  0000 L CNN
F 1 "4k7" H 6820 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6680 1500 50  0001 C CNN
F 3 "~" H 6750 1500 50  0001 C CNN
	1    6750 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 616454C0
P 7450 1500
F 0 "R15" H 7520 1546 50  0000 L CNN
F 1 "4k7" H 7520 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7380 1500 50  0001 C CNN
F 3 "~" H 7450 1500 50  0001 C CNN
	1    7450 1500
	1    0    0    -1  
$EndComp
Text GLabel 6750 950  1    50   Input ~ 0
VCC3V3
Text GLabel 6600 1850 0    50   Input ~ 0
VCC3V3
Text GLabel 8700 5950 0    50   Input ~ 0
VCC3V3
$Comp
L Device:R R16
U 1 1 6163CC49
P 8400 3200
F 0 "R16" H 8200 3250 50  0000 L CNN
F 1 "100k" H 8150 3150 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8330 3200 50  0001 C CNN
F 3 "~" H 8400 3200 50  0001 C CNN
	1    8400 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 6163D47D
P 8650 3200
F 0 "R17" H 8720 3246 50  0000 L CNN
F 1 "100k" H 8720 3155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8580 3200 50  0001 C CNN
F 3 "~" H 8650 3200 50  0001 C CNN
	1    8650 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3350 8400 3500
Wire Wire Line
	8400 3500 8950 3500
Connection ~ 8950 3500
Wire Wire Line
	8950 3500 8950 3250
Wire Wire Line
	8650 3350 9250 3350
Wire Wire Line
	9250 3250 9250 3350
Connection ~ 9250 3350
Wire Wire Line
	9250 3350 9250 3550
Text GLabel 8550 2900 1    50   Input ~ 0
VCC3V3
Wire Wire Line
	8400 3050 8400 3000
Wire Wire Line
	8400 3000 8550 3000
Wire Wire Line
	8550 3000 8550 2900
Wire Wire Line
	8650 3050 8650 3000
Wire Wire Line
	8650 3000 8550 3000
Connection ~ 8550 3000
Wire Wire Line
	3450 5850 3650 5850
Wire Wire Line
	2850 5850 2950 5850
Wire Wire Line
	2950 6000 2950 5850
Connection ~ 2950 5850
Wire Wire Line
	2950 5850 3050 5850
Text GLabel 6600 1750 0    50   Input ~ 0
TWD0
Text GLabel 7600 1750 2    50   Input ~ 0
TWCK0
$Comp
L power:GND #PWR047
U 1 1 61689084
P 7350 1850
F 0 "#PWR047" H 7350 1600 50  0001 C CNN
F 1 "GND" H 7355 1677 50  0000 C CNN
F 2 "" H 7350 1850 50  0001 C CNN
F 3 "" H 7350 1850 50  0001 C CNN
	1    7350 1850
	1    0    0    -1  
$EndComp
Text Notes 7000 950  0    50   ~ 0
J13 and J16 = Pullup Enable
Text GLabel 9350 3250 1    50   Input ~ 0
PB5
Text GLabel 9800 5750 2    50   Input ~ 0
SPI0_MISO
Text GLabel 8700 5750 0    50   Input ~ 0
SPI0_MOSI
Text GLabel 8700 5850 0    50   Input ~ 0
SPI0_SPCK
Text GLabel 9800 5850 2    50   Input ~ 0
SPI0_NPCS0
Wire Wire Line
	8700 5750 9000 5750
Wire Wire Line
	8700 5850 9000 5850
Wire Wire Line
	8700 5950 9000 5950
Wire Wire Line
	9800 5750 9500 5750
Wire Wire Line
	9800 5850 9500 5850
$Comp
L power:GND #PWR052
U 1 1 616B60F2
P 9650 5950
F 0 "#PWR052" H 9650 5700 50  0001 C CNN
F 1 "GND" H 9655 5777 50  0000 C CNN
F 2 "" H 9650 5950 50  0001 C CNN
F 3 "" H 9650 5950 50  0001 C CNN
	1    9650 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 5950 9650 5950
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J14
U 1 1 61651F20
P 7050 1750
F 0 "J14" H 7100 1875 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 7100 1876 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical" H 7050 1750 50  0001 C CNN
F 3 "~" H 7050 1750 50  0001 C CNN
	1    7050 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1750 6750 1750
Wire Wire Line
	6850 1850 6600 1850
Wire Wire Line
	7350 1750 7450 1750
Wire Wire Line
	6750 1650 6750 1750
Connection ~ 6750 1750
Wire Wire Line
	6750 1750 6600 1750
Wire Wire Line
	7450 1650 7450 1750
Connection ~ 7450 1750
Wire Wire Line
	7450 1750 7600 1750
Wire Wire Line
	6750 1350 6750 1250
Wire Wire Line
	7450 1250 7450 1350
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J18
U 1 1 6167C1D2
P 9200 4650
F 0 "J18" H 9250 4775 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 9250 4776 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical" H 9200 4650 50  0001 C CNN
F 3 "~" H 9200 4650 50  0001 C CNN
	1    9200 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 4650 9000 4650
Wire Wire Line
	9000 4750 8900 4750
Wire Wire Line
	9500 4650 9600 4650
Wire Wire Line
	9600 4800 9600 4750
Wire Wire Line
	9600 4750 9500 4750
$Comp
L power:GND #PWR048
U 1 1 6168B90D
P 7500 4200
F 0 "#PWR048" H 7500 3950 50  0001 C CNN
F 1 "GND" H 7505 4027 50  0000 C CNN
F 2 "" H 7500 4200 50  0001 C CNN
F 3 "" H 7500 4200 50  0001 C CNN
	1    7500 4200
	1    0    0    -1  
$EndComp
Text GLabel 6650 4000 0    50   Input ~ 0
AFE0_AD0
Text GLabel 6650 4100 0    50   Input ~ 0
AFE0_AD1
Text GLabel 7500 4000 2    50   Input ~ 0
AFE0_AD2
Text GLabel 7500 4100 2    50   Input ~ 0
DAC0
Wire Wire Line
	6650 4200 6850 4200
Wire Wire Line
	7350 4100 7500 4100
Wire Wire Line
	7350 4200 7500 4200
Wire Wire Line
	9350 3250 9350 3550
NoConn ~ 9050 3550
NoConn ~ 9150 3550
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 6165F2CE
P 2600 2350
F 0 "J8" H 2550 2100 50  0000 L CNN
F 1 "Conn_01x02" V 2563 2430 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2600 2350 50  0001 C CNN
F 3 "~" H 2600 2350 50  0001 C CNN
	1    2600 2350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 61670D7F
P 1550 2450
F 0 "J7" H 1550 2600 50  0000 C CNN
F 1 "Conn_01x02" V 1513 2530 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1550 2450 50  0001 C CNN
F 3 "~" H 1550 2450 50  0001 C CNN
	1    1550 2450
	-1   0    0    1   
$EndComp
Text GLabel 2100 2550 3    50   Input ~ 0
VCC3V3
Wire Wire Line
	1750 2350 1750 2150
Connection ~ 1750 2150
Wire Wire Line
	1750 2150 1900 2150
Wire Wire Line
	2400 2350 2400 2150
Connection ~ 2400 2150
Wire Wire Line
	2400 2150 2650 2150
Wire Wire Line
	1750 2450 2100 2450
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J9
U 1 1 616E6DC3
P 5000 1350
F 0 "J9" H 5050 1775 50  0000 C CNN
F 1 "Conn_02x07_Odd_Even" H 5050 1776 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x07_P2.54mm_Vertical" H 5000 1350 50  0001 C CNN
F 3 "~" H 5000 1350 50  0001 C CNN
	1    5000 1350
	1    0    0    -1  
$EndComp
Text GLabel 4700 800  0    50   Input ~ 0
VCC3V3
Wire Wire Line
	4800 1050 4750 1050
$Comp
L power:GND #PWR043
U 1 1 616EEB3A
P 5350 1850
F 0 "#PWR043" H 5350 1600 50  0001 C CNN
F 1 "GND" H 5355 1677 50  0000 C CNN
F 2 "" H 5350 1850 50  0001 C CNN
F 3 "" H 5350 1850 50  0001 C CNN
	1    5350 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1650 5350 1650
Wire Wire Line
	5350 1650 5350 1800
Wire Wire Line
	4800 1650 4800 1800
Wire Wire Line
	4800 1800 5350 1800
Connection ~ 5350 1800
Wire Wire Line
	5350 1800 5350 1850
Text GLabel 4700 1150 0    50   Input ~ 0
PD0
Text GLabel 5400 1150 2    50   Input ~ 0
TXD0
Text GLabel 4700 1250 0    50   Input ~ 0
RXD0
Text GLabel 5400 1250 2    50   Input ~ 0
PA19
Text GLabel 4700 1350 0    50   Input ~ 0
PA18
Text GLabel 5400 1350 2    50   Input ~ 0
SPI0_NPCS0
Text GLabel 4700 1450 0    50   Input ~ 0
AFE0_AD2
Text GLabel 5400 1450 2    50   Input ~ 0
AFE0_AD1
Text GLabel 4700 1550 0    50   Input ~ 0
AFE0_AD0
Wire Wire Line
	5300 1550 5350 1550
Wire Wire Line
	5350 1550 5350 1650
Connection ~ 5350 1650
Wire Wire Line
	4700 1150 4800 1150
Wire Wire Line
	4700 1250 4800 1250
Wire Wire Line
	4700 1350 4800 1350
Wire Wire Line
	4700 1450 4800 1450
Wire Wire Line
	4700 1550 4800 1550
Wire Wire Line
	5300 1450 5400 1450
Wire Wire Line
	5300 1350 5400 1350
Wire Wire Line
	5300 1250 5400 1250
Wire Wire Line
	5300 1150 5400 1150
Text Notes 4500 1800 0    50   ~ 0
PIO1
$Comp
L Connector_Generic:Conn_02x11_Odd_Even J10
U 1 1 6176CEA9
P 5000 2950
F 0 "J10" H 5050 3575 50  0000 C CNN
F 1 "Conn_02x11_Odd_Even" H 5050 3576 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x11_P2.54mm_Vertical" H 5000 2950 50  0001 C CNN
F 3 "~" H 5000 2950 50  0001 C CNN
	1    5000 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x09_Odd_Even J11
U 1 1 6176F425
P 5000 4700
F 0 "J11" H 5050 5250 50  0000 C CNN
F 1 "Conn_02x09_Odd_Even" H 5050 5226 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x09_P2.54mm_Vertical" H 5000 4700 50  0001 C CNN
F 3 "~" H 5000 4700 50  0001 C CNN
	1    5000 4700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x09_Odd_Even J12
U 1 1 61773446
P 5000 6350
F 0 "J12" H 5050 6900 50  0000 C CNN
F 1 "Conn_02x09_Odd_Even" H 5050 6876 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x09_P2.54mm_Vertical" H 5000 6350 50  0001 C CNN
F 3 "~" H 5000 6350 50  0001 C CNN
	1    5000 6350
	1    0    0    -1  
$EndComp
Text GLabel 4700 2550 0    50   Input ~ 0
PA22
Text GLabel 5400 2550 2    50   Input ~ 0
PA16
Text GLabel 4700 2650 0    50   Input ~ 0
PA23
Text GLabel 5400 2650 2    50   Input ~ 0
PD27
Text GLabel 4700 2750 0    50   Input ~ 0
PA15
Text GLabel 5400 2750 2    50   Input ~ 0
PD25
Text GLabel 4700 2850 0    50   Input ~ 0
PD26
Text GLabel 5400 2850 2    50   Input ~ 0
PD24
Text GLabel 4700 2950 0    50   Input ~ 0
PA24
Text GLabel 5400 2950 2    50   Input ~ 0
PA25
Text GLabel 4700 3050 0    50   Input ~ 0
SPI0_SPCK
Text GLabel 5400 3050 2    50   Input ~ 0
PA26
Text GLabel 4700 3150 0    50   Input ~ 0
SPI0_MOSI
Text GLabel 5400 3150 2    50   Input ~ 0
SPI0_MISO
Text GLabel 4700 3250 0    50   Input ~ 0
UTXD0
Text GLabel 5400 3250 2    50   Input ~ 0
PD19
Text GLabel 4700 3350 0    50   Input ~ 0
PD18
Text GLabel 5400 3350 2    50   Input ~ 0
PA27
Wire Wire Line
	4700 2550 4800 2550
Wire Wire Line
	4700 2650 4800 2650
Wire Wire Line
	4700 2750 4800 2750
Wire Wire Line
	4700 2850 4800 2850
Wire Wire Line
	4700 2950 4800 2950
Wire Wire Line
	4700 3050 4800 3050
Wire Wire Line
	4700 3150 4800 3150
Wire Wire Line
	4700 3250 4800 3250
Wire Wire Line
	4700 3350 4800 3350
Wire Wire Line
	5300 3350 5400 3350
Wire Wire Line
	5300 3250 5400 3250
Wire Wire Line
	5300 3150 5400 3150
Wire Wire Line
	5300 3050 5400 3050
Wire Wire Line
	5300 2950 5400 2950
Wire Wire Line
	5300 2850 5400 2850
Wire Wire Line
	5300 2750 5400 2750
Wire Wire Line
	5300 2650 5400 2650
Wire Wire Line
	5300 2550 5400 2550
$Comp
L power:GND #PWR044
U 1 1 616B4221
P 5350 3650
F 0 "#PWR044" H 5350 3400 50  0001 C CNN
F 1 "GND" H 5355 3477 50  0000 C CNN
F 2 "" H 5350 3650 50  0001 C CNN
F 3 "" H 5350 3650 50  0001 C CNN
	1    5350 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3450 4800 3600
Wire Wire Line
	4800 3600 5350 3600
Wire Wire Line
	5350 3600 5350 3650
Wire Wire Line
	5300 3450 5350 3450
Wire Wire Line
	5350 3450 5350 3600
Connection ~ 5350 3600
Text GLabel 4700 2200 0    50   Input ~ 0
VCC3V3
Wire Wire Line
	4800 2450 4800 2200
Wire Wire Line
	4800 2200 4700 2200
Wire Wire Line
	5300 2450 5300 2200
Wire Wire Line
	5300 2200 4800 2200
Connection ~ 4800 2200
Wire Wire Line
	4750 1050 4750 800 
Wire Wire Line
	4750 800  4700 800 
Wire Wire Line
	5300 1050 5300 800 
Wire Wire Line
	5300 800  4750 800 
Connection ~ 4750 800 
Text Notes 4500 3600 0    50   ~ 0
PIO2
$Comp
L power:GND #PWR045
U 1 1 616E3E2E
P 5350 5300
F 0 "#PWR045" H 5350 5050 50  0001 C CNN
F 1 "GND" H 5355 5127 50  0000 C CNN
F 2 "" H 5350 5300 50  0001 C CNN
F 3 "" H 5350 5300 50  0001 C CNN
	1    5350 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 5100 4800 5250
Wire Wire Line
	4800 5250 5350 5250
Wire Wire Line
	5350 5250 5350 5300
Wire Wire Line
	5350 5100 5350 5250
Connection ~ 5350 5250
Wire Wire Line
	5300 5100 5350 5100
Text GLabel 4700 4050 0    50   Input ~ 0
VCC3V3
Wire Wire Line
	4800 4300 4800 4050
Wire Wire Line
	4800 4050 4700 4050
Wire Wire Line
	5300 4300 5300 4050
Wire Wire Line
	5300 4050 4800 4050
Connection ~ 4800 4050
Text GLabel 4700 4400 0    50   Input ~ 0
PA5
Wire Wire Line
	5300 4400 5300 4300
Connection ~ 5300 4300
Text GLabel 4700 4500 0    50   Input ~ 0
PD17
Text GLabel 5400 4500 2    50   Input ~ 0
URXD0
Text GLabel 4700 4600 0    50   Input ~ 0
TWCK0
Text GLabel 5400 4600 2    50   Input ~ 0
PD16
Text GLabel 4700 4700 0    50   Input ~ 0
TWD0
Text GLabel 5400 4700 2    50   Input ~ 0
PA2
Text GLabel 4700 4800 0    50   Input ~ 0
PD11
Text GLabel 5400 4800 2    50   Input ~ 0
PA1
Text GLabel 4700 4900 0    50   Input ~ 0
PD10
Text GLabel 5400 4900 2    50   Input ~ 0
PA0
Text GLabel 4700 5000 0    50   Input ~ 0
PB4
Text GLabel 5400 5000 2    50   Input ~ 0
PD15
Wire Wire Line
	4700 4400 4800 4400
Wire Wire Line
	4700 4500 4800 4500
Wire Wire Line
	4700 4600 4800 4600
Wire Wire Line
	4700 4700 4800 4700
Wire Wire Line
	4700 4800 4800 4800
Wire Wire Line
	4700 4900 4800 4900
Wire Wire Line
	4700 5000 4800 5000
Wire Wire Line
	5400 5000 5300 5000
Wire Wire Line
	5400 4900 5300 4900
Wire Wire Line
	5400 4800 5300 4800
Wire Wire Line
	5400 4700 5300 4700
Wire Wire Line
	5400 4600 5300 4600
Wire Wire Line
	5400 4500 5300 4500
Text Notes 4500 5250 0    50   ~ 0
PIO3
$Comp
L power:GND #PWR046
U 1 1 6176D490
P 5350 6950
F 0 "#PWR046" H 5350 6700 50  0001 C CNN
F 1 "GND" H 5355 6777 50  0000 C CNN
F 2 "" H 5350 6950 50  0001 C CNN
F 3 "" H 5350 6950 50  0001 C CNN
	1    5350 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 6750 4800 6900
Wire Wire Line
	4800 6900 5350 6900
Wire Wire Line
	5350 6900 5350 6950
Wire Wire Line
	5350 6750 5350 6900
Connection ~ 5350 6900
Text Notes 4500 6900 0    50   ~ 0
PIO4
Wire Wire Line
	5350 6750 5300 6750
Text GLabel 4700 5700 0    50   Input ~ 0
VCC3V3
Wire Wire Line
	4800 5950 4800 5700
Wire Wire Line
	4800 5700 4700 5700
Wire Wire Line
	5300 5950 5300 5700
Wire Wire Line
	5300 5700 4800 5700
Connection ~ 4800 5700
Text GLabel 4700 6050 0    50   Input ~ 0
PB5
Text GLabel 5400 6050 2    50   Input ~ 0
PD9
Text GLabel 4700 6150 0    50   Input ~ 0
PA28
Text GLabel 5400 6150 2    50   Input ~ 0
PA30
Text GLabel 4700 6250 0    50   Input ~ 0
PA31
Text GLabel 5400 6250 2    50   Input ~ 0
PD7
Text GLabel 4700 6350 0    50   Input ~ 0
PD6
Text GLabel 5400 6350 2    50   Input ~ 0
PD5
Text GLabel 4700 6450 0    50   Input ~ 0
PD4
Text GLabel 5400 6450 2    50   Input ~ 0
PD3
Text GLabel 4700 6550 0    50   Input ~ 0
PD2
Text GLabel 5400 6550 2    50   Input ~ 0
PD1
Text GLabel 4700 6650 0    50   Input ~ 0
PB8
Text GLabel 5400 6650 2    50   Input ~ 0
DAC0
Wire Wire Line
	4700 6050 4800 6050
Wire Wire Line
	4700 6150 4800 6150
Wire Wire Line
	4700 6250 4800 6250
Wire Wire Line
	4700 6350 4800 6350
Wire Wire Line
	4700 6450 4800 6450
Wire Wire Line
	4700 6550 4800 6550
Wire Wire Line
	4700 6650 4800 6650
Wire Wire Line
	5300 6050 5400 6050
Wire Wire Line
	5300 6150 5400 6150
Wire Wire Line
	5300 6250 5400 6250
Wire Wire Line
	5300 6350 5400 6350
Wire Wire Line
	5300 6450 5400 6450
Wire Wire Line
	5300 6550 5400 6550
Wire Wire Line
	5300 6650 5400 6650
Text GLabel 6650 4200 0    50   Input ~ 0
VCC3V3
Wire Wire Line
	6850 4100 6650 4100
Wire Wire Line
	6650 4000 6850 4000
Wire Wire Line
	7350 4000 7500 4000
Wire Wire Line
	2100 2550 2100 2450
Connection ~ 2100 2450
Wire Wire Line
	2100 2450 2400 2450
Text Notes 900  2750 0    50   ~ 0
J7 and J8 = LED enable
$Comp
L Connector_Generic:Conn_01x02 J13
U 1 1 617D99E4
P 6950 1150
F 0 "J13" H 7030 1096 50  0000 L CNN
F 1 "Conn_01x02" H 7030 1051 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6950 1150 50  0001 C CNN
F 3 "~" H 6950 1150 50  0001 C CNN
	1    6950 1150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J16
U 1 1 617DA7ED
P 7650 1150
F 0 "J16" H 7730 1096 50  0000 L CNN
F 1 "Conn_01x02" H 7730 1051 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7650 1150 50  0001 C CNN
F 3 "~" H 7650 1150 50  0001 C CNN
	1    7650 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1150 6750 1050
Wire Wire Line
	7450 1150 7450 1050
Wire Wire Line
	7450 1050 6750 1050
Connection ~ 6750 1050
Wire Wire Line
	6750 1050 6750 950 
$Comp
L Switch:SW_MEC_5E SW4
U 1 1 616A2681
P 3250 5850
F 0 "SW4" H 3250 6235 50  0000 C CNN
F 1 "ERASE" H 3250 6144 50  0000 C CNN
F 2 "SamacSys_Parts:PTS647SK38SMTR2LFS" H 3250 6150 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=1371" H 3250 6150 50  0001 C CNN
	1    3250 5850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_MEC_5E SW3
U 1 1 616B6278
P 1900 6050
F 0 "SW3" H 1900 6435 50  0000 C CNN
F 1 "MCLR" H 1900 6350 50  0000 C CNN
F 2 "SamacSys_Parts:PTS647SK38SMTR2LFS" H 1900 6350 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=1371" H 1900 6350 50  0001 C CNN
	1    1900 6050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_MEC_5E SW1
U 1 1 616C3AE5
P 1500 4050
F 0 "SW1" H 1500 4343 50  0000 C CNN
F 1 "SW_MEC_5E" H 1500 4344 50  0001 C CNN
F 2 "SamacSys_Parts:FSM16JH" H 1500 4350 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=1371" H 1500 4350 50  0001 C CNN
	1    1500 4050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_MEC_5E SW2
U 1 1 616C4A6F
P 2450 4050
F 0 "SW2" H 2450 4343 50  0000 C CNN
F 1 "SW_MEC_5E" H 2450 4344 50  0001 C CNN
F 2 "SamacSys_Parts:FSM16JH" H 2450 4350 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=1371" H 2450 4350 50  0001 C CNN
	1    2450 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 4050 1150 4050
Wire Wire Line
	1150 4050 1150 3950
Wire Wire Line
	2250 4050 2100 4050
Wire Wire Line
	2100 4050 2100 3950
NoConn ~ 1700 5950
NoConn ~ 2100 5950
NoConn ~ 3050 5750
NoConn ~ 3450 5750
NoConn ~ 1700 3950
NoConn ~ 1300 3950
NoConn ~ 2250 3950
NoConn ~ 2650 3950
Connection ~ 1450 6050
Wire Wire Line
	1450 6050 1700 6050
Text Notes 950  4800 0    50   ~ 0
Do the buttons need a series current limiting resistor
$EndSCHEMATC
