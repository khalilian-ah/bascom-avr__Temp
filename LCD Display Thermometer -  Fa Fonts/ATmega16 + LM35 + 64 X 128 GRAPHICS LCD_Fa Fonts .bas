'======================================================================='

' Title: LCD Display Thermometer * Fa Fonts
' Last Updated :  05.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : ATmega16 + LM35 + 64 X 128 GRAPHICS LCD

'======================================================================='

$regfile = "m16def.dat"
$crystal = 1000000

Config Graphlcd = 128 * 64 , Dataport = Portd , Controlport = Portc , Ce = 0 , _
Cd = 1 , Wr = 2 , Rd = 3 , Reset = 4 , Fs = 5 , Mode = 6

Config Adc = Single , Prescaler = Auto , Reference = Internal

Dim A As Byte
Dim B As Byte
Dim C As String * 3
Dim L As Byte
Dim S As Byte
Dim T As Word
Dim X As Byte
Dim Y As String * 1
Dim D As String * 1

'------------------------------------------

Showpic 0 , 0 , Pic11
Wait 3

Do
Start Adc

Main1:

T = Getadc(2)
T = T / 4

If T = S Then Goto Main1
S = T

Showpic 0 , 0 , Pic10
For X = 8 To 110
Showpic X , 8 , Pic15
Next X

L = T + 8
For X = 8 To L
Showpic X , 8 , Pic12
Next X


Main2:

C = Str(t)
A = Len(c)

Select Case A

Case Is = 1
B = Val(c)

Select Case B

Case Is = 0
Showpic 0 , 32 , Pic0

Case Is = 1
Showpic 0 , 32 , Pic1

Case Is = 2
Showpic 0 , 32 , Pic2

Case Is = 3
Showpic 0 , 32 , Pic3

Case Is = 4
Showpic 0 , 32 , Pic4

Case Is = 5
Showpic 0 , 32 , Pic5

Case Is = 6
Showpic 0 , 32 , Pic6

Case Is = 7
Showpic 0 , 32 , Pic7

Case Is = 8
Showpic 0 , 32 , Pic8

Case Is = 9
Showpic 0 , 32 , Pic9

End Select

Showpic 24 , 32 , Pic14


Case Is = 2
D = Mid(c , 1 , 1)
B = Val(d)

Select Case B

Case Is = 0
Showpic 0 , 32 , Pic0

Case Is = 1
Showpic 0 , 32 , Pic1

Case Is = 2
Showpic 0 , 32 , Pic2

Case Is = 3
Showpic 0 , 32 , Pic3

Case Is = 4
Showpic 0 , 32 , Pic4

Case Is = 5
Showpic 0 , 32 , Pic5

Case Is = 6
Showpic 0 , 32 , Pic6

Case Is = 7
Showpic 0 , 32 , Pic7

Case Is = 8
Showpic 0 , 32 , Pic8

Case Is = 9
Showpic 0 , 32 , Pic9

End Select


Y = Mid(c , 2 , 1)
B = Val(y)

Select Case B

Case Is = 0
Showpic 24 , 32 , Pic0

Case Is = 1
Showpic 24 , 32 , Pic1

Case Is = 2
Showpic 24 , 32 , Pic2

Case Is = 3
Showpic 24 , 32 , Pic3

Case Is = 4
Showpic 24 , 32 , Pic4

Case Is = 5
Showpic 24 , 32 , Pic5

Case Is = 6
Showpic 24 , 32 , Pic6

Case Is = 7
Showpic 24 , 32 , Pic7

Case Is = 8
Showpic 24 , 32 , Pic8

Case Is = 9
Showpic 24 , 32 , Pic9

End Select

Showpic 48 , 32 , Pic14

End Select

Waitms 100

Goto Main1

loop
end

'----------------------------------------------

Pic0:
$bgf "0.bgf"

Pic1:
$bgf "1.bgf"

Pic2:
$bgf "2.bgf"

Pic3:
$bgf "3.bgf"

Pic4:
$bgf "4.bgf"

Pic5:
$bgf "5.bgf"

Pic6:
$bgf "6.bgf"

Pic7:
$bgf "7.bgf"

Pic8:
$bgf "8.bgf"

Pic9:
$bgf "9.bgf"

Pic10:
$bgf "CADR.bgf"

Pic11:
$bgf "DAMASANJ.bgf"

Pic12:
$bgf "KHATY.bgf"

Pic14:
$bgf "CANTIGRAD.bgf"

Pic15:
$bgf "WHITE.bgf"

'-------------------------------------------