'======================================================================='

' Title: LCD Display Thermometer
' Last Updated :  05.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : Atmega8 + LM35 + 16x2 Character lcd display

'======================================================================='

$regfile = "m8def.dat"
$crystal = 4000000

Config Lcdpin = Pin , Rs = Pd.0 , E = Pd.1 , Db4 = D.2 , Db5 = Pd.3 , Db6 = Pd.4 , Db7 = Pd.5
Config Lcd = 16 * 2

Config Adc = Single , Prescaler = Auto , Reference = Internal
Start Adc

Dim Temp As Word

Deflcdchar 0 , 31 , 31 , 31 , 31 , 31 , 31 , 31 , 31
Deflcdchar 1,14,17,17,14,32,32,32,32' replace ? with number (0-7)

Cursor Off

'--------------------------------------------

Do
Gosub Adc_convert
Home
Lcd "Temp is:" ; Temp ; Chr(1) ; "         "
Gosub Analog_degree
Loop
end

'------------------------------------------

Adc_convert:
Temp = Getadc(0)
Temp = Temp / 4
Waitms 30
Return

''''''''''''''''''''''''''''

Analog_degree:

 Select Case Temp
 Case 0
 Home L
 Lcd "                     "
 Case 1 To 3
  Home L
 Lcd Chr(0) ; "            "
 Case 3 To 6
  Home L
 Lcd Chr(0)
 Lcd Chr(0) ; "          "
 Case 6 To 9
  Home L
  Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0) ; "       "
 Case 9 To 11
 Home L
  Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "
  Case 11 To 14
  Home L
   Lcd Chr(0)
     Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "
    Case 14 To 18
    Home L
    Lcd Chr(0)
   Lcd Chr(0)
     Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "
      Case 18 To 22
      Home L
       Lcd Chr(0)
    Lcd Chr(0)
   Lcd Chr(0)
     Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "
       Case 22 To 28
       Home L
        Lcd Chr(0)
       Lcd Chr(0)
    Lcd Chr(0)
   Lcd Chr(0)
     Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "
         Case 28 To 34
         Home L
         Lcd Chr(0)
        Lcd Chr(0)
       Lcd Chr(0)
    Lcd Chr(0)
   Lcd Chr(0)
     Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "

           Case 34 To 40
           Home L
           Lcd Chr(0)
         Lcd Chr(0)
        Lcd Chr(0)
       Lcd Chr(0)
    Lcd Chr(0)
   Lcd Chr(0)
     Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "

             Case 40 To 48
             Home L
             Lcd Chr(0)
           Lcd Chr(0)
         Lcd Chr(0)
        Lcd Chr(0)
       Lcd Chr(0)
    Lcd Chr(0)
   Lcd Chr(0)
     Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "
                Case 48 To 58
                Home L
                Lcd Chr(0)
             Lcd Chr(0)
           Lcd Chr(0)
         Lcd Chr(0)
        Lcd Chr(0)
       Lcd Chr(0)
    Lcd Chr(0)
   Lcd Chr(0)
     Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "
                     Case 58 To 68
                     Home L
                       Lcd Chr(0)
                Lcd Chr(0)
             Lcd Chr(0)
           Lcd Chr(0)
         Lcd Chr(0)
        Lcd Chr(0)
       Lcd Chr(0)
    Lcd Chr(0)
   Lcd Chr(0)
     Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "
                       Case 68 To 78
                       Home L
                       Lcd Chr(0)
                       Lcd Chr(0)
                Lcd Chr(0)
             Lcd Chr(0)
           Lcd Chr(0)
         Lcd Chr(0)
        Lcd Chr(0)
       Lcd Chr(0)
    Lcd Chr(0)
   Lcd Chr(0)
     Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "

                          Case 78 To 88
                          Home L
                            Lcd Chr(0)
                       Lcd Chr(0)
                       Lcd Chr(0)
                Lcd Chr(0)
             Lcd Chr(0)
           Lcd Chr(0)
         Lcd Chr(0)
        Lcd Chr(0)
       Lcd Chr(0)
    Lcd Chr(0)
   Lcd Chr(0)
     Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "
                            Case 88 To 98
                            Home L
                               Lcd Chr(0)
                            Lcd Chr(0)
                       Lcd Chr(0)
                       Lcd Chr(0)
                Lcd Chr(0)
             Lcd Chr(0)
           Lcd Chr(0)
         Lcd Chr(0)
        Lcd Chr(0)
       Lcd Chr(0)
    Lcd Chr(0)
   Lcd Chr(0)
     Lcd Chr(0)
 Lcd Chr(0)
 Lcd Chr(0)
  Lcd Chr(0) ; "        "
  End Select
  Return

  '----------------------------------------------------------------