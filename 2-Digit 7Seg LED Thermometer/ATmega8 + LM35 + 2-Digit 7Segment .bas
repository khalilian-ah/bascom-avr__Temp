'======================================================================='

' Title: 2-Digit 7Segment LED Thermometer
' Last Updated :  05.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : ATmega8 + LM35 + 2-Digit 7Segment

'======================================================================='

$regfile = "m8def.dat"
$crystal = 1000000

Config Adc = Single , Prescaler = Auto , Reference = Internal

Config Portb = Output
Config Portd = Output
P0 Alias Portd

Dim A As Word
Dim B As Word
Dim C As Single
Dim D As Word
Dim F As Word
Dim V As Bit

Start Adc

'--------------------------------------

Do
A = Getadc(0)
B = Getadc(1)
C = A - b
C = C / 4

If C > 0 Then
V = 0
F = C
End If

If C < 0 Then
V = 1
C = C * -1
F = C * 1
End If

P0 = &B10 : D = F Mod 10 : Gosub Np
Waitms 20
P0 = &B01 : D = F / 10 : Gosub Np

Loop
End

'---------------------------------------

Np:
Portb = Lookup(d , 7seg)
Portb.7 = V
Waitms 4
Return

'-----------------------------------------
7seg:
Data &B1000000 , &B1111001 , &B0100100 , &B0110000 , &B0011001
Data &B0010010 , &B0000010 , &B1111000 , &B0000000 , &B0010000
'------------------------------------------

