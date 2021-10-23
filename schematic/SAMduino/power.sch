EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 2 4
Title "SAMduino"
Date "2021-10-22"
Rev "1.0"
Comp "Quantum Embedded Systems"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C C10
U 1 1 6160B74B
P 2200 1900
F 0 "C10" H 2315 1946 50  0000 L CNN
F 1 "10uF" H 2315 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2238 1750 50  0001 C CNN
F 3 "~" H 2200 1900 50  0001 C CNN
	1    2200 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 6160BE1F
P 2950 1900
F 0 "C12" H 3065 1946 50  0000 L CNN
F 1 "22uF" H 3065 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2988 1750 50  0001 C CNN
F 3 "~" H 2950 1900 50  0001 C CNN
	1    2950 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 6160C1EE
P 2950 2050
F 0 "#PWR019" H 2950 1800 50  0001 C CNN
F 1 "GND" H 2955 1877 50  0000 C CNN
F 2 "" H 2950 2050 50  0001 C CNN
F 3 "" H 2950 2050 50  0001 C CNN
	1    2950 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 6160C697
P 2200 2050
F 0 "#PWR017" H 2200 1800 50  0001 C CNN
F 1 "GND" H 2205 1877 50  0000 C CNN
F 2 "" H 2200 2050 50  0001 C CNN
F 3 "" H 2200 2050 50  0001 C CNN
	1    2200 2050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J1
U 1 1 6160E3E8
P 1150 1250
F 0 "J1" H 1150 1500 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1207 1476 50  0001 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Wuerth_6941xx301002" H 1200 1210 50  0001 C CNN
F 3 "~" H 1200 1210 50  0001 C CNN
	1    1150 1250
	1    0    0    -1  
$EndComp
Text Notes 8900 1300 0    50   ~ 0
Native USB
Text Notes 8900 2750 0    50   ~ 0
Serial to USB
Text GLabel 7200 750  1    50   Input ~ 0
VIN
$Comp
L power:GND #PWR014
U 1 1 61618806
P 1500 1650
F 0 "#PWR014" H 1500 1400 50  0001 C CNN
F 1 "GND" H 1505 1477 50  0000 C CNN
F 2 "" H 1500 1650 50  0001 C CNN
F 3 "" H 1500 1650 50  0001 C CNN
	1    1500 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 61618DDC
P 8700 1950
F 0 "#PWR029" H 8700 1700 50  0001 C CNN
F 1 "GND" H 8705 1777 50  0000 C CNN
F 2 "" H 8700 1950 50  0001 C CNN
F 3 "" H 8700 1950 50  0001 C CNN
	1    8700 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR030
U 1 1 61619362
P 8700 3400
F 0 "#PWR030" H 8700 3150 50  0001 C CNN
F 1 "GND" H 8705 3227 50  0000 C CNN
F 2 "" H 8700 3400 50  0001 C CNN
F 3 "" H 8700 3400 50  0001 C CNN
	1    8700 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 6161E49D
P 3150 1350
F 0 "#PWR022" H 3150 1100 50  0001 C CNN
F 1 "GND" H 3155 1177 50  0000 C CNN
F 2 "" H 3150 1350 50  0001 C CNN
F 3 "" H 3150 1350 50  0001 C CNN
	1    3150 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1650 1500 1550
Wire Wire Line
	1500 1250 1450 1250
Wire Wire Line
	1450 1350 1500 1350
Connection ~ 1500 1350
Wire Wire Line
	1500 1350 1500 1250
Wire Wire Line
	2200 1750 2200 1150
Wire Wire Line
	2950 1750 2950 1650
Text GLabel 3700 1650 2    50   Input ~ 0
VCC3V3
Connection ~ 2950 1650
Wire Wire Line
	3150 1250 2950 1250
Wire Wire Line
	2950 1250 2950 1650
$Comp
L Device:R R3
U 1 1 61628FE0
P 6600 1650
F 0 "R3" V 6393 1650 50  0000 C CNN
F 1 "15k" V 6484 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6530 1650 50  0001 C CNN
F 3 "~" H 6600 1650 50  0001 C CNN
	1    6600 1650
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 61629740
P 6300 2100
F 0 "R2" H 6100 2150 50  0000 L CNN
F 1 "22k" H 6100 2050 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6230 2100 50  0001 C CNN
F 3 "~" H 6300 2100 50  0001 C CNN
	1    6300 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C20
U 1 1 61629C96
P 6900 2100
F 0 "C20" H 6600 2150 50  0000 L CNN
F 1 "4.7uF" H 6550 2050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6938 1950 50  0001 C CNN
F 3 "~" H 6900 2100 50  0001 C CNN
	1    6900 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 6162A7ED
P 6300 2500
F 0 "#PWR024" H 6300 2250 50  0001 C CNN
F 1 "GND" H 6305 2327 50  0000 C CNN
F 2 "" H 6300 2500 50  0001 C CNN
F 3 "" H 6300 2500 50  0001 C CNN
	1    6300 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1650 6900 1650
Wire Wire Line
	6900 1950 6900 1650
Wire Wire Line
	6300 2250 6300 2350
Wire Wire Line
	6900 2250 6900 2350
Wire Wire Line
	6900 2350 6300 2350
Connection ~ 6300 2350
Wire Wire Line
	6300 2350 6300 2500
Wire Wire Line
	6300 1950 6300 1650
Wire Wire Line
	6300 1650 6450 1650
Text GLabel 6150 1650 0    50   Input ~ 0
VUSB_Detect
Text GLabel 7550 3150 0    50   Input ~ 0
Serial_D+
Text GLabel 7550 3350 0    50   Input ~ 0
Serial_D-
Text GLabel 8000 2000 0    50   Input ~ 0
HSDP
Text GLabel 8000 2200 0    50   Input ~ 0
HSDM
Wire Wire Line
	7550 3150 7750 3150
Wire Wire Line
	7750 3150 7750 2850
Wire Wire Line
	7750 2850 8300 2850
Wire Wire Line
	7950 3350 7950 2950
Wire Wire Line
	7950 2950 8300 2950
Wire Wire Line
	7550 3350 7950 3350
Wire Wire Line
	8050 2000 8050 1400
Wire Wire Line
	8050 1400 8300 1400
Wire Wire Line
	8050 2000 8000 2000
Wire Wire Line
	8200 2200 8200 1500
Wire Wire Line
	8200 1500 8300 1500
Wire Wire Line
	8000 2200 8200 2200
Wire Wire Line
	6900 1650 7900 1650
Wire Wire Line
	7900 1650 7900 1200
Connection ~ 6900 1650
Connection ~ 7900 1200
Wire Wire Line
	7900 1200 8300 1200
$Comp
L Device:C C5
U 1 1 61612BEB
P 1050 6250
F 0 "C5" H 1165 6296 50  0000 L CNN
F 1 "100n" H 1165 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1088 6100 50  0001 C CNN
F 3 "~" H 1050 6250 50  0001 C CNN
	1    1050 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 61613A69
P 1450 6250
F 0 "C6" H 1565 6296 50  0000 L CNN
F 1 "100n" H 1565 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1488 6100 50  0001 C CNN
F 3 "~" H 1450 6250 50  0001 C CNN
	1    1450 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 61615169
P 1850 6250
F 0 "C8" H 1965 6296 50  0000 L CNN
F 1 "100n" H 1965 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1888 6100 50  0001 C CNN
F 3 "~" H 1850 6250 50  0001 C CNN
	1    1850 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 61616827
P 2250 6250
F 0 "C9" H 2365 6296 50  0000 L CNN
F 1 "100n" H 2365 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2288 6100 50  0001 C CNN
F 3 "~" H 2250 6250 50  0001 C CNN
	1    2250 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 61617F6A
P 2650 6250
F 0 "C11" H 2765 6296 50  0000 L CNN
F 1 "100n" H 2765 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2688 6100 50  0001 C CNN
F 3 "~" H 2650 6250 50  0001 C CNN
	1    2650 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 61619788
P 3050 6250
F 0 "C14" H 3165 6296 50  0000 L CNN
F 1 "100n" H 3165 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3088 6100 50  0001 C CNN
F 3 "~" H 3050 6250 50  0001 C CNN
	1    3050 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 6100 1050 6000
Wire Wire Line
	3050 6000 3050 6100
Wire Wire Line
	2650 6100 2650 6000
Connection ~ 2650 6000
Wire Wire Line
	2650 6000 3050 6000
Wire Wire Line
	2250 6100 2250 6000
Connection ~ 2250 6000
Wire Wire Line
	2250 6000 2650 6000
Wire Wire Line
	1850 6100 1850 6000
Connection ~ 1850 6000
Wire Wire Line
	1850 6000 2050 6000
Wire Wire Line
	1450 6100 1450 6000
Wire Wire Line
	1050 6000 1450 6000
Connection ~ 1450 6000
Wire Wire Line
	1450 6000 1850 6000
Wire Wire Line
	1050 6400 1050 6550
Wire Wire Line
	3050 6550 3050 6400
Wire Wire Line
	1050 6550 1450 6550
Wire Wire Line
	2650 6400 2650 6550
Connection ~ 2650 6550
Wire Wire Line
	2650 6550 3050 6550
Wire Wire Line
	2250 6400 2250 6550
Connection ~ 2250 6550
Wire Wire Line
	2250 6550 2650 6550
Wire Wire Line
	1850 6400 1850 6550
Connection ~ 1850 6550
Wire Wire Line
	1850 6550 2050 6550
Wire Wire Line
	1450 6400 1450 6550
Connection ~ 1450 6550
Wire Wire Line
	1450 6550 1850 6550
$Comp
L power:GND #PWR016
U 1 1 61630FF3
P 2050 6550
F 0 "#PWR016" H 2050 6300 50  0001 C CNN
F 1 "GND" H 2055 6377 50  0000 C CNN
F 2 "" H 2050 6550 50  0001 C CNN
F 3 "" H 2050 6550 50  0001 C CNN
	1    2050 6550
	1    0    0    -1  
$EndComp
Connection ~ 2050 6550
Wire Wire Line
	2050 6550 2250 6550
Text GLabel 2050 5900 1    50   Input ~ 0
VCC3V3
Wire Wire Line
	2050 5900 2050 6000
Connection ~ 2050 6000
Wire Wire Line
	2050 6000 2250 6000
Text Notes 1100 6900 0    50   ~ 0
VDDIO x 4, VDDIN, VDDUTMII
$Comp
L Device:C C15
U 1 1 6163B670
P 3600 6550
F 0 "C15" H 3715 6596 50  0000 L CNN
F 1 "4.7uF" H 3715 6505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3638 6400 50  0001 C CNN
F 3 "~" H 3600 6550 50  0001 C CNN
	1    3600 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 6163BF1A
P 3600 6250
F 0 "L1" V 3419 6250 50  0000 C CNN
F 1 "10uH" V 3510 6250 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 3600 6250 50  0001 C CNN
F 3 "~" H 3600 6250 50  0001 C CNN
	1    3600 6250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR021
U 1 1 6163CBDC
P 3600 6700
F 0 "#PWR021" H 3600 6450 50  0001 C CNN
F 1 "GND" H 3605 6527 50  0000 C CNN
F 2 "" H 3600 6700 50  0001 C CNN
F 3 "" H 3600 6700 50  0001 C CNN
	1    3600 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 6000 3600 6100
Text GLabel 3900 6400 2    50   Input ~ 0
VDDPLLUSB
Wire Wire Line
	3900 6400 3600 6400
Text GLabel 6600 4300 1    50   Input ~ 0
VDDOUT
$Comp
L Device:C C17
U 1 1 6165021F
P 5950 5350
F 0 "C17" H 6065 5396 50  0000 L CNN
F 1 "100n" H 6065 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5988 5200 50  0001 C CNN
F 3 "~" H 5950 5350 50  0001 C CNN
	1    5950 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 616532B6
P 6350 5350
F 0 "C18" H 6465 5396 50  0000 L CNN
F 1 "100n" H 6465 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6388 5200 50  0001 C CNN
F 3 "~" H 6350 5350 50  0001 C CNN
	1    6350 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C19
U 1 1 6165654E
P 6750 5350
F 0 "C19" H 6865 5396 50  0000 L CNN
F 1 "100n" H 6865 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6788 5200 50  0001 C CNN
F 3 "~" H 6750 5350 50  0001 C CNN
	1    6750 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C21
U 1 1 61659884
P 7150 5350
F 0 "C21" H 7265 5396 50  0000 L CNN
F 1 "100n" H 7265 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7188 5200 50  0001 C CNN
F 3 "~" H 7150 5350 50  0001 C CNN
	1    7150 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C22
U 1 1 6165C8FC
P 7200 4400
F 0 "C22" V 6948 4400 50  0000 C CNN
F 1 "100n" V 7039 4400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7238 4250 50  0001 C CNN
F 3 "~" H 7200 4400 50  0001 C CNN
	1    7200 4400
	0    1    1    0   
$EndComp
$Comp
L Device:C C23
U 1 1 6165FA51
P 7200 4800
F 0 "C23" V 6948 4800 50  0000 C CNN
F 1 "1uF" V 7039 4800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7238 4650 50  0001 C CNN
F 3 "~" H 7200 4800 50  0001 C CNN
	1    7200 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 5200 5950 5100
Wire Wire Line
	5950 5100 6350 5100
Wire Wire Line
	7150 5100 7150 5200
Wire Wire Line
	7150 5650 7150 5500
Wire Wire Line
	5950 5500 5950 5650
Wire Wire Line
	6600 4300 6600 4400
Connection ~ 6600 5100
Wire Wire Line
	6600 5100 6750 5100
Wire Wire Line
	7050 4400 6600 4400
Connection ~ 6600 4400
Wire Wire Line
	6600 4400 6600 4800
Wire Wire Line
	7050 4800 6600 4800
Connection ~ 6600 4800
Wire Wire Line
	5950 5650 6350 5650
$Comp
L power:GND #PWR025
U 1 1 6168A47C
P 6600 5650
F 0 "#PWR025" H 6600 5400 50  0001 C CNN
F 1 "GND" H 6605 5477 50  0000 C CNN
F 2 "" H 6600 5650 50  0001 C CNN
F 3 "" H 6600 5650 50  0001 C CNN
	1    6600 5650
	1    0    0    -1  
$EndComp
Connection ~ 6600 5650
Wire Wire Line
	6600 5650 6750 5650
Wire Wire Line
	7350 4800 7500 4800
Wire Wire Line
	7350 4400 7500 4400
Wire Wire Line
	6350 5200 6350 5100
Connection ~ 6350 5100
Wire Wire Line
	6350 5100 6600 5100
Wire Wire Line
	6750 5200 6750 5100
Connection ~ 6750 5100
Wire Wire Line
	6750 5500 6750 5650
Connection ~ 6750 5650
Wire Wire Line
	6750 5650 7150 5650
Wire Wire Line
	6350 5500 6350 5650
Connection ~ 6350 5650
Wire Wire Line
	6350 5650 6600 5650
Text Notes 6300 6000 0    50   ~ 0
VDDCORE x 4
Wire Wire Line
	7500 4400 7500 4600
$Comp
L power:GND #PWR027
U 1 1 6168944A
P 7700 4600
F 0 "#PWR027" H 7700 4350 50  0001 C CNN
F 1 "GND" H 7800 4450 50  0000 R CNN
F 2 "" H 7700 4600 50  0001 C CNN
F 3 "" H 7700 4600 50  0001 C CNN
	1    7700 4600
	1    0    0    -1  
$EndComp
Connection ~ 7500 4600
Wire Wire Line
	7500 4600 7500 4800
$Comp
L Device:C C16
U 1 1 616F261C
P 4600 6550
F 0 "C16" H 4715 6596 50  0000 L CNN
F 1 "100n" H 4715 6505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4638 6400 50  0001 C CNN
F 3 "~" H 4600 6550 50  0001 C CNN
	1    4600 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:L L2
U 1 1 616F2622
P 4600 6250
F 0 "L2" V 4419 6250 50  0000 C CNN
F 1 "470R" V 4510 6250 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 4600 6250 50  0001 C CNN
F 3 "~" H 4600 6250 50  0001 C CNN
	1    4600 6250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR023
U 1 1 616F2628
P 4600 6700
F 0 "#PWR023" H 4600 6450 50  0001 C CNN
F 1 "GND" H 4605 6527 50  0000 C CNN
F 2 "" H 4600 6700 50  0001 C CNN
F 3 "" H 4600 6700 50  0001 C CNN
	1    4600 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 6000 4600 6100
Text GLabel 4900 6400 2    50   Input ~ 0
VREFP
Wire Wire Line
	4900 6400 4600 6400
$Comp
L Device:C C7
U 1 1 6163BBE4
P 1600 4350
F 0 "C7" H 1350 4350 50  0000 L CNN
F 1 "10uF" H 1300 4250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1638 4200 50  0001 C CNN
F 3 "~" H 1600 4350 50  0001 C CNN
	1    1600 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 6163CB48
P 3550 4350
F 0 "C13" H 3650 4350 50  0000 L CNN
F 1 "22uF" H 3650 4250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3588 4200 50  0001 C CNN
F 3 "~" H 3550 4350 50  0001 C CNN
	1    3550 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 6163D088
P 1600 4500
F 0 "#PWR015" H 1600 4250 50  0001 C CNN
F 1 "GND" H 1605 4327 50  0000 C CNN
F 2 "" H 1600 4500 50  0001 C CNN
F 3 "" H 1600 4500 50  0001 C CNN
	1    1600 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 6163D851
P 3550 4500
F 0 "#PWR020" H 3550 4250 50  0001 C CNN
F 1 "GND" H 3555 4327 50  0000 C CNN
F 2 "" H 3550 4500 50  0001 C CNN
F 3 "" H 3550 4500 50  0001 C CNN
	1    3550 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 6163E05D
P 2050 4200
F 0 "#PWR018" H 2050 3950 50  0001 C CNN
F 1 "GND" V 2055 4072 50  0000 R CNN
F 2 "" H 2050 4200 50  0001 C CNN
F 3 "" H 2050 4200 50  0001 C CNN
	1    2050 4200
	1    0    0    -1  
$EndComp
Text GLabel 2550 3250 2    50   Input ~ 0
VIN
Text GLabel 4300 4200 2    50   Input ~ 0
VDD5V
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J2
U 1 1 6167E5E9
P 2100 3250
F 0 "J2" H 2150 3400 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 2150 3376 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical" H 2100 3250 50  0001 C CNN
F 3 "~" H 2100 3250 50  0001 C CNN
	1    2100 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 1650 6900 1450
Text GLabel 2550 3350 2    50   Input ~ 0
VDD5V
Text Notes 1950 3650 0    50   ~ 0
Position\n1-2 5V from Vin\n3-4 5V from USB micro
Wire Wire Line
	1450 3250 1450 4000
Wire Wire Line
	2550 3250 2400 3250
NoConn ~ 8300 1600
NoConn ~ 8300 3050
Wire Wire Line
	7700 4600 7500 4600
Text GLabel 1600 1000 1    50   Input ~ 0
VIN
Connection ~ 3600 6400
Connection ~ 4600 6400
Text Notes 1850 4950 0    50   ~ 0
5 Volt supply  for CAN Transceiver\n1 A
Wire Wire Line
	6300 1650 6150 1650
Connection ~ 6300 1650
Wire Wire Line
	3050 6000 3600 6000
Connection ~ 3050 6000
Wire Wire Line
	3600 6000 4600 6000
Connection ~ 3600 6000
Wire Wire Line
	6600 4800 6600 5100
Wire Wire Line
	6750 5100 7150 5100
Wire Wire Line
	7650 5100 8350 5100
Wire Wire Line
	7650 5200 7650 5100
Wire Wire Line
	8350 5100 8350 5200
Connection ~ 8350 5500
Connection ~ 7650 5500
Wire Wire Line
	7650 5500 7900 5500
$Comp
L Device:L L3
U 1 1 616A4663
P 7650 5350
F 0 "L3" V 7469 5350 50  0000 C CNN
F 1 "470R" V 7560 5350 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 7650 5350 50  0001 C CNN
F 3 "~" H 7650 5350 50  0001 C CNN
	1    7650 5350
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR026
U 1 1 616C7B64
P 7650 5800
F 0 "#PWR026" H 7650 5550 50  0001 C CNN
F 1 "GND" H 7655 5627 50  0000 C CNN
F 2 "" H 7650 5800 50  0001 C CNN
F 3 "" H 7650 5800 50  0001 C CNN
	1    7650 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 616C75DC
P 8350 5800
F 0 "#PWR028" H 8350 5550 50  0001 C CNN
F 1 "GND" H 8355 5627 50  0000 C CNN
F 2 "" H 8350 5800 50  0001 C CNN
F 3 "" H 8350 5800 50  0001 C CNN
	1    8350 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 5500 8500 5500
Text GLabel 8500 5500 2    50   Input ~ 0
VDDUTMIC
Text GLabel 7900 5500 2    50   Input ~ 0
VDDPLL
$Comp
L Device:L L4
U 1 1 616A3701
P 8350 5350
F 0 "L4" V 8169 5350 50  0000 C CNN
F 1 "470R" V 8260 5350 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 8350 5350 50  0001 C CNN
F 3 "~" H 8350 5350 50  0001 C CNN
	1    8350 5350
	-1   0    0    1   
$EndComp
$Comp
L Device:C C25
U 1 1 61665C7A
P 8350 5650
F 0 "C25" H 8465 5696 50  0000 L CNN
F 1 "100n" H 8465 5605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8388 5500 50  0001 C CNN
F 3 "~" H 8350 5650 50  0001 C CNN
	1    8350 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C24
U 1 1 61662C5E
P 7650 5650
F 0 "C24" H 7765 5696 50  0000 L CNN
F 1 "100n" H 7765 5605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7688 5500 50  0001 C CNN
F 3 "~" H 7650 5650 50  0001 C CNN
	1    7650 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 5100 7650 5100
Connection ~ 7150 5100
Connection ~ 7650 5100
Text Notes 4000 2100 0    50   ~ 0
3.3V Power\n1 A
Text GLabel 1900 3350 0    50   Input ~ 0
VUSB5V
Wire Wire Line
	2550 3350 2400 3350
Text GLabel 6900 1450 1    50   Input ~ 0
VUSB5V
Wire Wire Line
	1450 3250 1900 3250
$Comp
L Device:LED D9
U 1 1 61678F2F
P 3450 1900
F 0 "D9" V 3489 1782 50  0000 R CNN
F 1 "Red" V 3398 1782 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 3450 1900 50  0001 C CNN
F 3 "~" H 3450 1900 50  0001 C CNN
	1    3450 1900
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R18
U 1 1 616798E1
P 3450 2250
F 0 "R18" H 3520 2296 50  0000 L CNN
F 1 "220R" H 3520 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3380 2250 50  0001 C CNN
F 3 "~" H 3450 2250 50  0001 C CNN
	1    3450 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 616879D3
P 3450 2400
F 0 "#PWR0101" H 3450 2150 50  0001 C CNN
F 1 "GND" H 3455 2227 50  0000 C CNN
F 2 "" H 3450 2400 50  0001 C CNN
F 3 "" H 3450 2400 50  0001 C CNN
	1    3450 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1650 3450 1650
Wire Wire Line
	3450 1750 3450 1650
Connection ~ 3450 1650
Wire Wire Line
	3450 1650 3700 1650
Wire Wire Line
	3450 2100 3450 2050
Wire Wire Line
	8700 1800 8700 1850
Wire Wire Line
	8700 3250 8700 3300
Wire Wire Line
	8600 1800 8600 1850
Wire Wire Line
	8600 1850 8700 1850
Connection ~ 8700 1850
Wire Wire Line
	8700 1850 8700 1950
Wire Wire Line
	8600 3250 8600 3300
Wire Wire Line
	8600 3300 8700 3300
Connection ~ 8700 3300
Wire Wire Line
	8700 3300 8700 3400
$Comp
L SamacSys_Parts:USB_B_Micro J3
U 1 1 616F34E3
P 8600 1400
F 0 "J3" H 8370 1389 50  0000 R CNN
F 1 "USB_B_Micro" H 8370 1298 50  0000 R CNN
F 2 "Connector_USB:USB_Micro-B_Amphenol_10104110_Horizontal" H 8750 1350 50  0001 C CNN
F 3 "~" H 8750 1350 50  0001 C CNN
	1    8600 1400
	-1   0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:USB_B_Mini J4
U 1 1 616F7E8C
P 8600 2850
F 0 "J4" H 8370 2839 50  0000 R CNN
F 1 "USB_B_Mini" H 8370 2748 50  0000 R CNN
F 2 "Connector_USB:USB_Mini-B_Wuerth_65100516121_Horizontal" H 8750 2800 50  0001 C CNN
F 3 "~" H 8750 2800 50  0001 C CNN
	1    8600 2850
	-1   0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 616FE655
P 1500 1550
F 0 "#FLG0101" H 1500 1625 50  0001 C CNN
F 1 "PWR_FLAG" V 1500 1678 50  0000 L CNN
F 2 "" H 1500 1550 50  0001 C CNN
F 3 "~" H 1500 1550 50  0001 C CNN
	1    1500 1550
	0    1    1    0   
$EndComp
Connection ~ 1500 1550
Wire Wire Line
	1500 1550 1500 1350
$Comp
L Diode:MBR0520LT D1
U 1 1 6167EC31
P 7500 1200
F 0 "D1" H 7500 1417 50  0000 C CNN
F 1 "MBR0520LT" H 7500 1326 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 7500 1025 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/MBR0520LT1-D.PDF" H 7500 1200 50  0001 C CNN
	1    7500 1200
	1    0    0    -1  
$EndComp
$Comp
L Diode:MBR0520LT D2
U 1 1 6167FDFE
P 7700 2650
F 0 "D2" H 7700 2867 50  0000 C CNN
F 1 "MBR0520LT" H 7700 2776 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 7700 2475 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/MBR0520LT1-D.PDF" H 7700 2650 50  0001 C CNN
	1    7700 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 750  7200 1200
Wire Wire Line
	7650 1200 7900 1200
Wire Wire Line
	7350 1200 7200 1200
Connection ~ 7200 1200
Wire Wire Line
	7200 1200 7200 2650
Wire Wire Line
	7850 2650 8300 2650
Wire Wire Line
	7200 2650 7550 2650
$Comp
L Device:LED D11
U 1 1 616AFF78
P 3950 4450
F 0 "D11" V 3989 4332 50  0000 R CNN
F 1 "Red" V 3898 4332 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 3950 4450 50  0001 C CNN
F 3 "~" H 3950 4450 50  0001 C CNN
	1    3950 4450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R19
U 1 1 616B107E
P 3950 4850
F 0 "R19" H 4020 4896 50  0000 L CNN
F 1 "330R" H 4020 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3880 4850 50  0001 C CNN
F 3 "~" H 3950 4850 50  0001 C CNN
	1    3950 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR053
U 1 1 616B23CB
P 3950 5000
F 0 "#PWR053" H 3950 4750 50  0001 C CNN
F 1 "GND" H 3955 4827 50  0000 C CNN
F 2 "" H 3950 5000 50  0001 C CNN
F 3 "" H 3950 5000 50  0001 C CNN
	1    3950 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4300 3950 4200
Connection ~ 3950 4200
Wire Wire Line
	3950 4200 4300 4200
Wire Wire Line
	3950 4700 3950 4600
$Comp
L SamacSys_Parts:AZ1117CH-5.0TRG1 IC2
U 1 1 61726A3D
P 2050 4200
F 0 "IC2" H 2700 3735 50  0000 C CNN
F 1 "AZ1117CH-5.0TRG1" H 2700 3826 50  0000 C CNN
F 2 "SOT230P700X180-4N" H 3200 4300 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/AZ1117C.pdf" H 3200 4200 50  0001 L CNN
F 4 "DiodesZetex AZ1117CH-5.0TRG1, LDO Regulator, 300mA, 5 V, +/-1% 3+Tab-Pin, SOT-223" H 3200 4100 50  0001 L CNN "Description"
F 5 "1.8" H 3200 4000 50  0001 L CNN "Height"
F 6 "621-AZ1117CH-5.0TRG1" H 3200 3900 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Diodes-Incorporated/AZ1117CH-50TRG1?qs=FKu9oBikfSlJYUAtiuMgOw%3D%3D" H 3200 3800 50  0001 L CNN "Mouser Price/Stock"
F 8 "Diodes Inc." H 3200 3700 50  0001 L CNN "Manufacturer_Name"
F 9 "AZ1117CH-5.0TRG1" H 3200 3600 50  0001 L CNN "Manufacturer_Part_Number"
	1    2050 4200
	1    0    0    1   
$EndComp
Wire Wire Line
	1450 4000 1600 4000
Wire Wire Line
	1600 4200 1600 4000
Connection ~ 1600 4000
Wire Wire Line
	1600 4000 2050 4000
Wire Wire Line
	3350 4200 3400 4200
Wire Wire Line
	2050 4100 1900 4100
Wire Wire Line
	1900 4100 1900 4550
Wire Wire Line
	1900 4550 3400 4550
Wire Wire Line
	3400 4550 3400 4200
Connection ~ 3400 4200
Wire Wire Line
	3400 4200 3550 4200
$Comp
L SamacSys_Parts:AZ1117IH-3.3TRG1 IC3
U 1 1 61788364
P 3150 1350
F 0 "IC3" H 3800 885 50  0000 C CNN
F 1 "AZ1117IH-3.3TRG1" H 3800 976 50  0000 C CNN
F 2 "SOT230P700X180-4N" H 4300 1450 50  0001 L CNN
F 3 "" H 4300 1350 50  0001 L CNN
F 4 "LDO Voltage Regulators LDO BJT HiCurr 1.35A 10Hz to 10KHz" H 4300 1250 50  0001 L CNN "Description"
F 5 "1.8" H 4300 1150 50  0001 L CNN "Height"
F 6 "621-AZ1117IH-3.3TRG1" H 4300 1050 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Diodes-Incorporated/AZ1117IH-33TRG1?qs=cpo3%2FpBou2jnS4SxLgAVoA%3D%3D" H 4300 950 50  0001 L CNN "Mouser Price/Stock"
F 8 "Diodes Inc." H 4300 850 50  0001 L CNN "Manufacturer_Name"
F 9 "AZ1117IH-3.3TRG1" H 4300 750 50  0001 L CNN "Manufacturer_Part_Number"
	1    3150 1350
	1    0    0    1   
$EndComp
Wire Wire Line
	4450 1350 4450 1550
Wire Wire Line
	4450 1550 3450 1550
Wire Wire Line
	3450 1550 3450 1650
Connection ~ 2200 1150
Text Notes 650  1650 0    50   ~ 0
DC IN 15V Max\nCenter Pin Positive!
Connection ~ 3550 4200
Wire Wire Line
	3550 4200 3950 4200
Wire Wire Line
	1450 1150 1600 1150
Wire Wire Line
	2200 1150 3150 1150
Wire Wire Line
	1600 1000 1600 1150
Connection ~ 1600 1150
Wire Wire Line
	1600 1150 2200 1150
$EndSCHEMATC
