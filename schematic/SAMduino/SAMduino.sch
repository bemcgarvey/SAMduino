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
F 2 "SamacSys_Parts:QFP50P1600X1600X160-100N" H 6850 3150 50  0001 L CNN
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
Text GLabel 7350 4150 2    50   Input ~ 0
NRST
$Comp
L power:GND #PWR012
U 1 1 6164797C
P 7000 3250
F 0 "#PWR012" H 7000 3000 50  0001 C CNN
F 1 "GND" V 7005 3122 50  0000 R CNN
F 2 "" H 7000 3250 50  0001 C CNN
F 3 "" H 7000 3250 50  0001 C CNN
	1    7000 3250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 61648851
P 4600 5750
F 0 "#PWR010" H 4600 5500 50  0001 C CNN
F 1 "GND" H 4605 5577 50  0000 C CNN
F 2 "" H 4600 5750 50  0001 C CNN
F 3 "" H 4600 5750 50  0001 C CNN
	1    4600 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 6164901A
P 4000 3350
F 0 "#PWR09" H 4000 3100 50  0001 C CNN
F 1 "GND" V 4005 3222 50  0000 R CNN
F 2 "" H 4000 3350 50  0001 C CNN
F 3 "" H 4000 3350 50  0001 C CNN
	1    4000 3350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 6164A44E
P 4000 2650
F 0 "#PWR08" H 4000 2400 50  0001 C CNN
F 1 "GND" V 4005 2522 50  0000 R CNN
F 2 "" H 4000 2650 50  0001 C CNN
F 3 "" H 4000 2650 50  0001 C CNN
	1    4000 2650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 6164AF20
P 3750 3050
F 0 "#PWR06" H 3750 2800 50  0001 C CNN
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
Text GLabel 7350 3150 2    50   Input ~ 0
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
F 1 "5k62 ± 1%" V 3584 750 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3630 750 50  0001 C CNN
F 3 "~" H 3700 750 50  0001 C CNN
	1    3700 750 
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 61658D40
P 3950 950
F 0 "C4" H 4065 996 50  0000 L CNN
F 1 "10p" H 4065 905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3988 800 50  0001 C CNN
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
L power:GND #PWR05
U 1 1 6165BD3A
P 3450 800
F 0 "#PWR05" H 3450 550 50  0001 C CNN
F 1 "GND" H 3455 627 50  0000 C CNN
F 2 "" H 3450 800 50  0001 C CNN
F 3 "" H 3450 800 50  0001 C CNN
	1    3450 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 6165C4E2
P 3950 1100
F 0 "#PWR07" H 3950 850 50  0001 C CNN
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
Text GLabel 7350 3850 2    50   Input ~ 0
ERASE
Text GLabel 4800 1300 1    50   Input ~ 0
HSDP
Text GLabel 4900 1300 1    50   Input ~ 0
HSDM
Wire Wire Line
	4800 1550 4800 1300
Wire Wire Line
	4900 1300 4900 1550
Text GLabel 7350 3450 2    50   Input ~ 0
CANTX
Text GLabel 7350 4850 2    50   Input ~ 0
CANRX
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
L Device:C C3
U 1 1 61634D1C
P 1950 5350
F 0 "C3" H 2065 5396 50  0000 L CNN
F 1 "20p" H 2065 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1988 5200 50  0001 C CNN
F 3 "~" H 1950 5350 50  0001 C CNN
	1    1950 5350
	-1   0    0    1   
$EndComp
$Comp
L Device:C C2
U 1 1 61635437
P 1350 5350
F 0 "C2" H 1465 5396 50  0000 L CNN
F 1 "20p" H 1465 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1388 5200 50  0001 C CNN
F 3 "~" H 1350 5350 50  0001 C CNN
	1    1350 5350
	-1   0    0    1   
$EndComp
$Comp
L Device:C C1
U 1 1 61635AF8
P 2600 7050
F 0 "C1" H 2715 7096 50  0000 L CNN
F 1 "100n" H 2715 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2638 6900 50  0001 C CNN
F 3 "~" H 2600 7050 50  0001 C CNN
	1    2600 7050
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 61636FE9
P 1050 6850
F 0 "#PWR04" H 1050 6600 50  0001 C CNN
F 1 "GND" H 1055 6677 50  0000 C CNN
F 2 "" H 1050 6850 50  0001 C CNN
F 3 "" H 1050 6850 50  0001 C CNN
	1    1050 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 6163756A
P 2600 7200
F 0 "#PWR01" H 2600 6950 50  0001 C CNN
F 1 "GND" H 2605 7027 50  0000 C CNN
F 2 "" H 2600 7200 50  0001 C CNN
F 3 "" H 2600 7200 50  0001 C CNN
	1    2600 7200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1050 6700 1050 6850
Text GLabel 2750 6600 2    50   Input ~ 0
VCC3V3
Wire Wire Line
	2750 6600 2600 6600
Connection ~ 2600 6600
$Comp
L power:GND #PWR02
U 1 1 61641D03
P 1350 5500
F 0 "#PWR02" H 1350 5250 50  0001 C CNN
F 1 "GND" H 1355 5327 50  0000 C CNN
F 2 "" H 1350 5500 50  0001 C CNN
F 3 "" H 1350 5500 50  0001 C CNN
	1    1350 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 61642552
P 1950 5500
F 0 "#PWR03" H 1950 5250 50  0001 C CNN
F 1 "GND" H 1955 5327 50  0000 C CNN
F 2 "" H 1950 5500 50  0001 C CNN
F 3 "" H 1950 5500 50  0001 C CNN
	1    1950 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal X2
U 1 1 6164E680
P 1650 5050
F 0 "X2" H 1650 5318 50  0000 C CNN
F 1 "32.768 kHz 12.5 pF" H 1650 5227 50  0000 C CNN
F 2 "SamacSys_Parts:CM9VT1A" H 1650 5050 50  0001 C CNN
F 3 "~" H 1650 5050 50  0001 C CNN
F 4 "CM9V-T1A-32.768kHz-12.5pF-20PPM-TA-QC" H 1650 5050 50  0001 C CNN "Part Number"
F 5 "428-202257-MC01" H 1650 5050 50  0001 C CNN "Mouser Part Number"
	1    1650 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5050 1350 5050
Wire Wire Line
	1350 5050 1350 5200
Wire Wire Line
	1800 5050 1950 5050
Wire Wire Line
	1950 5050 1950 5200
Text GLabel 2250 6850 3    50   Input ~ 0
XIN
Text GLabel 1100 5050 0    50   Input ~ 0
XIN32
Text GLabel 2200 5050 2    50   Input ~ 0
XOUT32
Wire Wire Line
	2250 6700 2250 6850
Wire Wire Line
	1950 5050 2200 5050
Connection ~ 1950 5050
Wire Wire Line
	1350 5050 1100 5050
Connection ~ 1350 5050
Text GLabel 4400 1300 1    50   Input ~ 0
XIN
Wire Wire Line
	4400 1550 4400 1300
Text GLabel 3700 4750 0    50   Input ~ 0
XIN32
Text GLabel 3700 4850 0    50   Input ~ 0
XOUT32
Wire Wire Line
	3700 4750 4000 4750
Wire Wire Line
	4000 4850 3700 4850
Wire Wire Line
	6600 1550 6600 1300
Text GLabel 7350 4250 2    50   Input ~ 0
SWDIO
Text GLabel 7350 3650 2    50   Input ~ 0
SWCLK
Text GLabel 6100 6000 3    50   Input ~ 0
QCS
Text GLabel 6500 6000 3    50   Input ~ 0
QIO1
Text GLabel 4400 6000 3    50   Input ~ 0
QIO0
Text GLabel 5100 6000 3    50   Input ~ 0
QSCK
Wire Wire Line
	6500 6000 6500 5750
Wire Wire Line
	6100 6000 6100 5750
Wire Wire Line
	5100 6000 5100 5750
Wire Wire Line
	4400 6000 4400 5750
Text GLabel 3700 3950 0    50   Input ~ 0
QIO2
Wire Wire Line
	3700 3950 4000 3950
Text GLabel 3700 2550 0    50   Input ~ 0
QIO3
Wire Wire Line
	4000 2550 3700 2550
$Comp
L power:GND #PWR011
U 1 1 6163AE82
P 7000 2650
F 0 "#PWR011" H 7000 2400 50  0001 C CNN
F 1 "GND" V 7005 2522 50  0000 R CNN
F 2 "" H 7000 2650 50  0001 C CNN
F 3 "" H 7000 2650 50  0001 C CNN
	1    7000 2650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 616434F9
P 7000 3950
F 0 "#PWR013" H 7000 3700 50  0001 C CNN
F 1 "GND" V 7005 3822 50  0000 R CNN
F 2 "" H 7000 3950 50  0001 C CNN
F 3 "" H 7000 3950 50  0001 C CNN
	1    7000 3950
	0    -1   -1   0   
$EndComp
Text GLabel 7350 3550 2    50   Input ~ 0
TWD0
Text GLabel 7350 4450 2    50   Input ~ 0
TWCK0
Text GLabel 3700 3550 0    50   Input ~ 0
RXD0
Text GLabel 3700 3450 0    50   Input ~ 0
TXD0
Wire Wire Line
	4000 3450 3700 3450
Wire Wire Line
	4000 3550 3700 3550
Text GLabel 3700 4050 0    50   Input ~ 0
SPI0_NPCS0
Text GLabel 6200 6000 3    50   Input ~ 0
SPI0_MISO
Text GLabel 6000 6000 3    50   Input ~ 0
SPI0_MOSI
Text GLabel 5800 6000 3    50   Input ~ 0
SPI0_SPCK
Wire Wire Line
	5800 6000 5800 5750
Wire Wire Line
	6200 6000 6200 5750
Wire Wire Line
	6000 6000 6000 5750
Wire Wire Line
	7000 2550 7350 2550
Wire Wire Line
	7000 3150 7350 3150
Wire Wire Line
	7000 3450 7350 3450
Wire Wire Line
	7000 3550 7350 3550
Wire Wire Line
	7000 3650 7350 3650
Wire Wire Line
	7000 3850 7350 3850
Wire Wire Line
	7000 4150 7350 4150
Wire Wire Line
	7000 4250 7350 4250
Wire Wire Line
	7000 4450 7350 4450
Wire Wire Line
	7000 4850 7350 4850
Text GLabel 7350 4550 2    50   Input ~ 0
URXD0
Text GLabel 6300 6000 3    50   Input ~ 0
UTXD0
Wire Wire Line
	6300 6000 6300 5750
Wire Wire Line
	7000 4550 7350 4550
Wire Wire Line
	5300 6000 5300 5750
Wire Wire Line
	5200 5750 5200 6000
Text GLabel 6600 1300 1    50   Input ~ 0
PB5
Text GLabel 4300 1300 1    50   Input ~ 0
DAC0
Wire Wire Line
	4300 1550 4300 1300
Text GLabel 3700 3650 0    50   Input ~ 0
Button1
Wire Wire Line
	3700 4050 4000 4050
Wire Wire Line
	3700 3650 4000 3650
Text GLabel 6300 1300 1    50   Input ~ 0
Button2
Wire Wire Line
	6300 1550 6300 1300
Text GLabel 7350 4050 2    50   Input ~ 0
CAN_STBY
Text GLabel 7350 3750 2    50   Input ~ 0
VUSB_Detect
Wire Wire Line
	7000 3750 7350 3750
Wire Wire Line
	7000 4050 7350 4050
Text GLabel 3700 2450 0    50   Input ~ 0
PD0
Text GLabel 3700 3750 0    50   Input ~ 0
PA19
Text GLabel 3700 3850 0    50   Input ~ 0
PA18
Text GLabel 3700 4350 0    50   Input ~ 0
AFE0_AD2
Text GLabel 3700 4450 0    50   Input ~ 0
AFE0_AD1
Text GLabel 3700 4650 0    50   Input ~ 0
AFE0_AD0
Wire Wire Line
	3700 4650 4000 4650
Wire Wire Line
	4000 4450 3700 4450
Wire Wire Line
	3700 4350 4000 4350
Wire Wire Line
	3700 3850 4000 3850
Wire Wire Line
	3700 3750 4000 3750
Wire Wire Line
	3700 2450 4000 2450
Text GLabel 7350 2450 2    50   Input ~ 0
PD15
Text GLabel 7350 2550 2    50   Input ~ 0
PB4
Text GLabel 7350 2750 2    50   Input ~ 0
PA0
Text GLabel 7350 2850 2    50   Input ~ 0
PD10
Text GLabel 7350 2950 2    50   Input ~ 0
PA1
Text GLabel 7350 3050 2    50   Input ~ 0
PD11
Text GLabel 7350 3350 2    50   Input ~ 0
PA2
Text GLabel 7350 4650 2    50   Input ~ 0
PD17
Text GLabel 7350 4750 2    50   Input ~ 0
PA5
Wire Wire Line
	7000 4750 7350 4750
Wire Wire Line
	7000 4650 7350 4650
Wire Wire Line
	7000 3350 7350 3350
Wire Wire Line
	7000 3050 7350 3050
Wire Wire Line
	7000 2950 7350 2950
Wire Wire Line
	7000 2850 7350 2850
Wire Wire Line
	7000 2750 7350 2750
Wire Wire Line
	7000 2450 7350 2450
Text GLabel 7350 4350 2    50   Input ~ 0
PD16
Wire Wire Line
	7000 4350 7350 4350
Text GLabel 4500 1300 1    50   Input ~ 0
PB8
Text GLabel 5100 1300 1    50   Input ~ 0
PD1
Text GLabel 5200 1300 1    50   Input ~ 0
PD2
Text GLabel 5400 1300 1    50   Input ~ 0
PD3
Text GLabel 5500 1300 1    50   Input ~ 0
PD4
Text GLabel 5600 1300 1    50   Input ~ 0
PD5
Text GLabel 5800 1300 1    50   Input ~ 0
PD6
Text GLabel 5900 1300 1    50   Input ~ 0
PD7
Text GLabel 6000 1300 1    50   Input ~ 0
PA31
Text GLabel 6100 1300 1    50   Input ~ 0
PA30
Text GLabel 6400 1300 1    50   Input ~ 0
PA28
Text GLabel 6500 1300 1    50   Input ~ 0
PD9
Wire Wire Line
	6500 1550 6500 1300
Wire Wire Line
	6400 1550 6400 1300
Wire Wire Line
	6100 1550 6100 1300
Wire Wire Line
	6000 1550 6000 1300
Wire Wire Line
	5900 1550 5900 1300
Wire Wire Line
	5800 1550 5800 1300
Wire Wire Line
	5600 1550 5600 1300
Wire Wire Line
	5500 1550 5500 1300
Wire Wire Line
	5400 1550 5400 1300
Wire Wire Line
	5200 1550 5200 1300
Wire Wire Line
	5100 1550 5100 1300
Wire Wire Line
	4500 1550 4500 1300
Text GLabel 4300 6000 3    50   Input ~ 0
PA22
Text GLabel 4700 6000 3    50   Input ~ 0
PA16
Text GLabel 4800 6000 3    50   Input ~ 0
PA23
Text GLabel 4900 6000 3    50   Input ~ 0
PD27
Text GLabel 5000 6000 3    50   Input ~ 0
PA15
Text GLabel 5200 6000 3    50   Input ~ 0
PD25
Text GLabel 5300 6000 3    50   Input ~ 0
PD26
Text GLabel 5400 6000 3    50   Input ~ 0
PD24
Text GLabel 5500 6000 3    50   Input ~ 0
PA24
Text GLabel 5700 6000 3    50   Input ~ 0
PA25
Text GLabel 5900 6000 3    50   Input ~ 0
PA26
Text GLabel 6400 6000 3    50   Input ~ 0
PD19
Text GLabel 6600 6000 3    50   Input ~ 0
PD18
Text GLabel 6700 6000 3    50   Input ~ 0
PA27
Wire Wire Line
	6700 6000 6700 5750
Wire Wire Line
	6600 6000 6600 5750
Wire Wire Line
	6400 6000 6400 5750
Wire Wire Line
	5900 6000 5900 5750
Wire Wire Line
	5700 6000 5700 5750
Wire Wire Line
	5500 6000 5500 5750
Wire Wire Line
	5400 6000 5400 5750
Wire Wire Line
	5000 6000 5000 5750
Wire Wire Line
	4900 6000 4900 5750
Wire Wire Line
	4800 6000 4800 5750
Wire Wire Line
	4700 6000 4700 5750
Wire Wire Line
	4300 6000 4300 5750
Text Notes 1350 7000 0    50   ~ 0
Main Oscillator
Text Notes 1300 5850 0    50   ~ 0
Slow Clock Oscillator
$Comp
L SamacSys_Parts:AMPMAFB-12.0000T X1
U 1 1 6171D4C5
P 1050 6600
F 0 "X1" H 1650 6865 50  0000 C CNN
F 1 "12 MHz" H 1650 6774 50  0000 C CNN
F 2 "SamacSys_Parts:ASTMUPCE3312000MHZLJET" H 2100 6700 50  0001 L CNN
F 3 "" H 2100 6600 50  0001 L CNN
F 4 "12 MHz Crystal or MEMS oscillator" H 2100 6500 50  0001 L CNN "Description"
F 5 "0.89" H 2100 6400 50  0001 L CNN "Height"
F 6 "" H 2100 6300 50  0001 L CNN "Mouser Part Number"
F 7 "" H 2100 6200 50  0001 L CNN "Mouser Price/Stock"
F 8 "" H 2100 6100 50  0001 L CNN "Manufacturer_Name"
F 9 "" H 2100 6000 50  0001 L CNN "Manufacturer_Part_Number"
	1    1050 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 6600 2600 6900
Wire Wire Line
	2250 6600 2350 6600
Wire Wire Line
	2350 6600 2350 6250
Wire Wire Line
	2350 6250 1050 6250
Wire Wire Line
	1050 6250 1050 6600
Connection ~ 2350 6600
Wire Wire Line
	2350 6600 2600 6600
$EndSCHEMATC
