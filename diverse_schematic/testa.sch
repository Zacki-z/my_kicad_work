EESchema Schematic File Version 4
LIBS:my_custom_library
EELAYER 29 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Parallell Single-Ended EL84 with Triode + Cathode Feedback"
Date "2025-03-14"
Rev "1.0"
Comp "User Project"
Comment1 "Triode connected EL84 with Cathode Feedback and LM317 CCS"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr

$Comp
L VacuumTubes:EL84 U1
U 1 1 5A6DFAF7
P 4000 3000
F 0 "U1" H 4000 3300 50  0000 C CNN
F 1 "EL84" H 4000 2800 50  0000 C CNN
F 2 "Socket:Noval" H 4000 3000 50  0001 C CNN
F 3 "" H 4000 3000 50  0001 C CNN
$EndComp

$Comp
L VacuumTubes:EL84 U2
U 1 1 5A6DFAF8
P 5000 3000
F 0 "U2" H 5000 3300 50  0000 C CNN
F 1 "EL84" H 5000 2800 50  0000 C CNN
F 2 "Socket:Noval" H 5000 3000 50  0001 C CNN
F 3 "" H 5000 3000 50  0001 C CNN
$EndComp

$Comp
L Regulator_Linear:LM317 U3
U 1 1 5A6DFB01
P 4500 4000
F 0 "U3" H 4500 4250 50  0000 C CNN
F 1 "LM317" H 4500 3750 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3" H 4500 4000 50  0001 C CNN
F 3 "" H 4500 4000 50  0001 C CNN
$EndComp

$Comp
L Device:R R1
U 1 1 5A6DFB10
P 4000 3600
F 0 "R1" H 4070 3600 50  0000 L CNN
F 1 "100R" H 4070 3550 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4000 3600 50  0001 C CNN
F 3 "" H 4000 3600 50  0001 C CNN
$EndComp

$Comp
L Device:R R2
U 1 1 5A6DFB11
P 5000 3600
F 0 "R2" H 5070 3600 50  0000 L CNN
F 1 "100R" H 5070 3550 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5000 3600 50  0001 C CNN
F 3 "" H 5000 3600 50  0001 C CNN
$EndComp

$Comp
L Transformer:Audio_Transformer T1
U 1 1 5A6DFB20
P 6000 3000
F 0 "T1" H 6000 3250 50  0000 C CNN
F 1 "CFB Transformer" H 6000 2750 50  0000 C CNN
F 2 "AudioTransformers:Custom_CFB" H 6000 3000 50  0001 C CNN
F 3 "" H 6000 3000 50  0001 C CNN
$EndComp

Wire Wire Line
  4000 3100 4000 3500
Wire Wire Line
  5000 3100 5000 3500
Wire Wire Line
  4000 3500 4000 3700
Wire Wire Line
  5000 3500 5000 3700
Wire Wire Line
  4000 3700 4500 3700
Wire Wire Line
  5000 3700 4500 3700
Wire Wire Line
  4500 3700 4500 3800
Wire Wire Line
  4500 4200 4500 4300
Wire Wire Line
  4500 4300 4500 4400
Wire Wire Line
  4500 4400 4700 4400
Wire Wire Line
  4700 4400 4700 4500
$EndSCHEMATC
