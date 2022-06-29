'======================================================================='

' Title: LCD Display Thermometer * Sensor MV
' Last Updated :  05.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : Atmega32 + LM35 + 16x2 Character lcd display

'======================================================================='

$regfile = "m32def.dat"
$crystal = 1000000

Config Lcdpin = Pin , Rs = Pind.0 , E = Pind.2 , Db4 = Pind.4 , Db5 = Pind.5 , Db6 = Pind.6 , Db7 = Pind.7
Config Lcd = 16 * 2
Cursor Off
Cls

Config Adc = Single , Prescaler = Auto , Reference = Avcc
Start Adc

Dim W As Word
Dim Input_mv As Single
Dim Temp As Single

Gosub Display_lcd_start_text

'--------------------------------------------

Do
   Gosub Read_the_adc
   Gosub Convert
   Gosub Display_lcd_1
   Gosub Display_lcd_2
   Waitms 200
Loop

End

'--------------------------------------------

Display_lcd_start_text:
   Cls :
   Locate 1 , 1 : Lcd "   www.M32.ir"
   Locate 2 , 1 : Lcd "AVR   PIC   8051"
   Wait 2 : Cls : Waitms 200
Return

'''''''''''''''''''''''''''''''''''

Read_the_adc:
   W = Getadc(7)
   Input_mv = W * 4.8828125
   'Input_v = Input_mv / 1000
Return

''''''''''''''''''''''''''''''''''

Convert:
   Temp = Input_mv / 10
Return

''''''''''''''''''''''''''''''''''

Display_lcd_1:
   Deflcdchar 0 , 7 , 5 , 7 , 32 , 32 , 32 , 32 , 32
   Locate 1 , 1 : Lcd "Temp: " ; Fusing(temp , "#.#") ; Chr(0) ; "C  "
Return

''''''''''''''''''''''''''''''''''

Display_lcd_2:
   Locate 2 , 1 : Lcd "Input: " ; Fusing(input_mv , "#.#") ; "mV"
Return

'-------------------------------------------------------------