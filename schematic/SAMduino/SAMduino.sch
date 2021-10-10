EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 4
Title "SAMduino"
Date "2021-10-07"
Rev "1.0"
Comp "Quantum Embedded Systems"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 550  650  750  650 
U 615FD6B6
F0 "Power" 50
F1 "power.sch" 50
$EndSheet
$Comp
L SamacSys_Parts:ATSAMV71N21B-AABT IC1
U 1 1 6160851B
P 4000 2450
F 0 "IC1" H 5400 1350 50  0000 L CNN
F 1 "ATSAMV71N21B-AABT" H 5100 2150 50  0000 L CNN
F 2 "QFP50P1600X1600X160-100N" H 6850 3150 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/ATSAMV71N21B-AABT.pdf" H 6850 3050 50  0001 L CNN
F 4 "ARM Microcontrollers - MCU 300Mhz, 2MB Flash, 384KB SRAM, LQFP100, T&R" H 6850 2950 50  0001 L CNN "Description"
F 5 "1.6" H 6850 2850 50  0001 L CNN "Height"
F 6 "556-ATSAMV71N21BAABT" H 6850 2750 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=556-ATSAMV71N21BAABT" H 6850 2650 50  0001 L CNN "Mouser Price/Stock"
F 8 "Microchip" H 6850 2550 50  0001 L CNN "Manufacturer_Name"
F 9 "ATSAMV71N21B-AABT" H 6850 2450 50  0001 L CNN "Manufacturer_Part_Number"
	1    4000 2450
	1    0    0    -1  
$EndComp
Text Notes 600  950  0    50   ~ 10
Power\nand \nUSB Connectors
$Sheet
S 550  1500 750  700 
U 6161E553
F0 "External ICs" 50
F1 "external.sch" 50
$EndSheet
Text Notes 600  1800 0    50   ~ 10
Flash, CAN and\nUSB to Serial
$Sheet
S 550  2550 750  650 
U 616281DA
F0 "User" 50
F1 "leds.sch" 50
$EndSheet
Text Notes 600  2800 0    50   ~ 10
LEDs, Buttons\nand Headers
Text GLabel 7200 4150 2    50   Input ~ 0
MCLR
Wire Wire Line
	7000 4150 7200 4150
$Comp
L power:GND #PWR08
U 1 1 6164797C
P 7000 3250
F 0 "#PWR08" H 7000 3000 50  0001 C CNN
F 1 "GND" V 7005 3122 50  0000 R CNN
F 2 "" H 7000 3250 50  0001 C CNN
F 3 "" H 7000 3250 50  0001 C CNN
	1    7000 3250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 61648851
P 4600 5750
F 0 "#PWR07" H 4600 5500 50  0001 C CNN
F 1 "GND" H 4605 5577 50  0000 C CNN
F 2 "" H 4600 5750 50  0001 C CNN
F 3 "" H 4600 5750 50  0001 C CNN
	1    4600 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 6164901A
P 4000 3350
F 0 "#PWR06" H 4000 3100 50  0001 C CNN
F 1 "GND" V 4005 3222 50  0000 R CNN
F 2 "" H 4000 3350 50  0001 C CNN
F 3 "" H 4000 3350 50  0001 C CNN
	1    4000 3350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 6164A44E
P 4000 2650
F 0 "#PWR03" H 4000 2400 50  0001 C CNN
F 1 "GND" V 4005 2522 50  0000 R CNN
F 2 "" H 4000 2650 50  0001 C CNN
F 3 "" H 4000 2650 50  0001 C CNN
	1    4000 2650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6164AF20
P 3750 3050
F 0 "#PWR05" H 3750 2800 50  0001 C CNN
F 1 "GND" H 3700 3050 50  0000 R CNN
F 2 "" H 3750 3050 50  0001 C CNN
F 3 "" H 3750 3050 50  0001 C CNN
	1    3750 3050
	1    0    0    -1  
$EndComp
Text GLabel 5000 1300 1    50   Input ~ 0
VCC3V3
Text GLabel 6200 1300 1    50   Input ~ 0
VCC3V3
Text GLabel 7300 3150 2    50   Input ~ 0
VCC3V3
Text GLabel 4500 6000 3    50   Input ~ 0
VCC3V3
Text GLabel 3700 4250 0    50   Input ~ 0
VCC3V3
Text GLabel 3700 2850 0    50   Input ~ 0
VCC3V3
Wire Wire Line
	4000 2750 3700 2750
Wire Wire Line
	3700 4250 4000 4250
Wire Wire Line
	4500 5750 4500 6000
Wire Wire Line
	7000 3150 7300 3150
Wire Wire Line
	5000 1550 5000 1300
Wire Wire Line
	6200 1550 6200 1300
Text GLabel 6700 1300 1    50   Input ~ 0
VDDOUT
Wire Wire Line
	6700 1550 6700 1300
Text GLabel 5600 6000 3    50   Input ~ 0
VDDOUT
Wire Wire Line
	5600 5750 5600 6000
Text GLabel 3700 4550 0    50   Input ~ 0
VDDOUT
Wire Wire Line
	3700 4550 4000 4550
Text GLabel 3700 4150 0    50   Input ~ 0
VDDOUT
Wire Wire Line
	3700 4150 4000 4150
Text GLabel 3700 2750 0    50   Input ~ 0
VDDOUT
Wire Wire Line
	3700 2850 4000 2850
Text GLabel 5300 1300 1    50   Input ~ 0
VDDPLLUSB
Text GLabel 5700 1300 1    50   Input ~ 0
VDDPLL
Text GLabel 4700 1300 1    50   Input ~ 0
VDDUTMIC
Text GLabel 3700 3250 0    50   Input ~ 0
VREFP
Wire Wire Line
	4000 3250 3700 3250
Wire Wire Line
	4700 1300 4700 1550
Wire Wire Line
	5300 1300 5300 1550
Wire Wire Line
	5700 1300 5700 1550
$Comp
L Device:R R1
U 1 1 61658515
P 3700 750
F 0 "R1" V 3493 750 50  0000 C CNN
F 1 "5k62 +- 1%" V 3584 750 50  0000 C CNN
F 2 "" V 3630 750 50  0001 C CNN
F 3 "~" H 3700 750 50  0001 C CNN
	1    3700 750 
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 61658D40
P 3950 950
F 0 "C1" H 4065 996 50  0000 L CNN
F 1 "10p" H 4065 905 50  0000 L CNN
F 2 "" H 3988 800 50  0001 C CNN
F 3 "~" H 3950 950 50  0001 C CNN
	1    3950 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 750  3950 750 
Wire Wire Line
	4600 750  4600 1550
Wire Wire Line
	3950 800  3950 750 
Connection ~ 3950 750 
Wire Wire Line
	3950 750  4600 750 
$Comp
L power:GND #PWR01
U 1 1 6165BD3A
P 3450 800
F 0 "#PWR01" H 3450 550 50  0001 C CNN
F 1 "GND" H 3455 627 50  0000 C CNN
F 2 "" H 3450 800 50  0001 C CNN
F 3 "" H 3450 800 50  0001 C CNN
	1    3450 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 6165C4E2
P 3950 1100
F 0 "#PWR02" H 3950 850 50  0001 C CNN
F 1 "GND" H 3955 927 50  0000 C CNN
F 2 "" H 3950 1100 50  0001 C CNN
F 3 "" H 3950 1100 50  0001 C CNN
	1    3950 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 750  3450 750 
Wire Wire Line
	3450 750  3450 800 
Text GLabel 7200 3850 2    50   Input ~ 0
ERASE
Wire Wire Line
	7000 3850 7200 3850
Text GLabel 4800 1300 1    50   Input ~ 0
Native_D+
Text GLabel 4900 1300 1    50   Input ~ 0
Native_D-
Wire Wire Line
	4800 1550 4800 1300
Wire Wire Line
	4900 1300 4900 1550
Text GLabel 3700 4050 0    50   Input ~ 0
CANTX
Text GLabel 3700 4350 0    50   Input ~ 0
CANRX
Wire Wire Line
	4000 4350 3700 4350
Wire Wire Line
	4000 4050 3700 4050
Wire Wire Line
	4000 2950 3900 2950
Wire Wire Line
	3900 2950 3900 3050
Wire Wire Line
	4000 3150 3900 3150
Wire Wire Line
	4000 3050 3900 3050
Connection ~ 3900 3050
Wire Wire Line
	3900 3050 3900 3150
Wire Wire Line
	3900 3050 3750 3050
$Comp
L SamacSys_Parts:CM9V-T1A-32.768kHz-12.5pF-20PPM-TA-QC Y?
U 1 1 6163BE49
P 8550 2350
F 0 "Y?" H 9178 2346 50  0000 L CNN
F 1 "CM9V-T1A-32.768kHz-12.5pF-20PPM-TA-QC" H 9178 2255 50  0000 L CNN
F 2 "CM9VT1A" H 9200 2450 50  0001 L CNN
F 3 "https://www.mouser.de/datasheet/2/530/CM9V_T1A-2326756.pdf" H 9200 2350 50  0001 L CNN
F 4 "CM9V-T1A Tuning Fork Crystal 32.768kHz in 1.0x 1.6mm package" H 9200 2250 50  0001 L CNN "Description"
F 5 "0.5" H 9200 2150 50  0001 L CNN "Height"
F 6 "428-202257-MC01" H 9200 2050 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Micro-Crystal/CM9V-T1A-32768kHz-125pF-20PPM-TA-QC?qs=7bTaA%2FLYtSaZfaN72uDr4g%3D%3D" H 9200 1950 50  0001 L CNN "Mouser Price/Stock"
F 8 "Micro Crystal AG" H 9200 1850 50  0001 L CNN "Manufacturer_Name"
F 9 "CM9V-T1A-32.768kHz-12.5pF-20PPM-TA-QC" H 9200 1750 50  0001 L CNN "Manufacturer_Part_Number"
	1    8550 2350
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:ASTMUPCE-33-12.000MHZ-LJ-E-T Y?
U 1 1 6163D1D7
P 8750 3900
F 0 "Y?" H 9250 4165 50  0000 C CNN
F 1 "ASTMUPCE-33-12.000MHZ-LJ-E-T" H 9250 4074 50  0000 C CNN
F 2 "ASTMUPCE3312000MHZLJET" H 9600 4000 50  0001 L CNN
F 3 "https://abracon.com/Oscillators/ASTMUPC.pdf" H 9600 3900 50  0001 L CNN
F 4 "Standard Clock Oscillators MEMS OSC XO 12.0000MHZ LVCMOS" H 9600 3800 50  0001 L CNN "Description"
F 5 "0.8" H 9600 3700 50  0001 L CNN "Height"
F 6 "815-UPCE3312LJET" H 9600 3600 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/ABRACON/ASTMUPCE-33-12000MHZ-LJ-E-T?qs=%2FPOkb%252BiDxRX9piuXNFIeDg%3D%3D" H 9600 3500 50  0001 L CNN "Mouser Price/Stock"
F 8 "ABRACON" H 9600 3400 50  0001 L CNN "Manufacturer_Name"
F 9 "ASTMUPCE-33-12.000MHZ-LJ-E-T" H 9600 3300 50  0001 L CNN "Manufacturer_Part_Number"
	1    8750 3900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
