
EESchema Schematic Version 8
EELAYER 29 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "KT77 Push-Pull Tube Amplifier"
Date "2025-03-13"
Rev "1.0"
Comp "Designed in KiCad 8"
Comment1 "ECC83S Preamp and Phase Splitter"
Comment2 "KT77 Output Stage with Automatic Bias Control"
Comment3 "Toroidy TTG-EL34PP Output Transformer"
Comment4 "Generated Netlist for KT77 Push-Pull"
$EndDescr

$Comp
L Tube:12AX7 V1
U 1 1 60A1E5C1
P 2000 3000
F 0 "V1" H 2200 3100 50  0000 L CNN
F 1 "ECC83S" H 2200 2900 50  0000 L CNN
F 2 "Tube_Noval" H 2000 3000 50  0001 C CNN
F 3 "" H 2000 3000 50  0001 C CNN
	1    2000 3000
	1    0    0    -1  
$EndComp

$Comp
L Tube:KT77 V3
U 1 1 60A1E5D2
P 5000 3000
F 0 "V3" H 5200 3100 50  0000 L CNN
F 1 "KT77" H 5200 2900 50  0000 L CNN
F 2 "Tube_Octal" H 5000 3000 50  0001 C CNN
F 3 "" H 5000 3000 50  0001 C CNN
	1    5000 3000
	1    0    0    -1  
$EndComp

$Comp
L Device:R R1
U 1 1 60A1E5E1
P 2500 2500
F 0 "R1" V 2550 2500 50  0000 C CNN
F 1 "1MΩ" V 2450 2500 50  0000 C CNN
F 2 "Resistor_Axial" H 2500 2500 50  0001 C CNN
F 3 "" H 2500 2500 50  0001 C CNN
	1    2500 2500
	1    0    0    -1  
$EndComp

$Comp
L Device:R R2
U 1 1 60A1E5F1
P 2700 2500
F 0 "R2" V 2750 2500 50  0000 C CNN
F 1 "1MΩ" V 2650 2500 50  0000 C CNN
F 2 "Resistor_Axial" H 2700 2500 50  0001 C CNN
F 3 "" H 2700 2500 50  0001 C CNN
	1    2700 2500
	1    0    0    -1  
$EndComp

$Comp
L power:+400V #PWR01
U 1 1 60A1E601
P 2500 2200
F 0 "#PWR01" H 2500 2050 50  0001 C CNN
F 1 "+400V" H 2500 2350 50  0000 C CNN
F 2 "" H 2500 2200 50  0001 C CNN
F 3 "" H 2500 2200 50  0001 C CNN
	1    2500 2200
	1    0    0    -1  
$EndComp

$EndSCHEMATC
