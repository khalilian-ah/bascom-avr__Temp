'======================================================================='

' Title: 4-Digit 7Segment LED Thermometer
' Last Updated :  05.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : ATmega16 + LM35 + 4-Digit 7Segment

'======================================================================='

$regfile = "m16def.dat"
$crystal = 1000000

Config Adc = Single , Prescaler = Auto , Reference = Internal

Config Portb = Output
Config Portd = Output

Dim T1 As Word
Dim T2 As Word
Dim S As Single
Dim P As Word
Dim M As Byte
Dim N As Byte

Start Adc
Declare Sub Main1
Declare Sub Main2
Declare Sub Main3

'----------------------------------------------
Do

Call Main3
Call Main1
Call Main2

Loop
end

'--------------------------------------------

Main1:

T1 = Getadc(2)
T2 = Getadc(5)
S = T1 - T2
S = S / 4

If S > 0 Then
N = 10
P = S
End If

If S < 0 Then
N = 11
S = S / -1
S = S + 1
P = S
End If

''''''''''''''''''''''''''''''''''

Main2:

Portb = &B0111
M = 12
Call Main3

Portb = &B1011
M = P Mod 10
Call Main3

Portb = &B1101
M = P / 10
Call Main3

Portb = &B1110
M = N
Call Main3

Portb = &B1111
M = 0

''''''''''''''''''''''''''''''''

Main3:

Portd = Lookup(M , Dat)
Waitms 4

'-----------------------------------------------
Dat:
Data &H3F , &H06 , &H5B , &H4F , &H66 , &H6D , &H7D , &H07 , &H7F , &H6F , _
&H00 , &H40 , &H39
'-----------------------------------------------


