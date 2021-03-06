'======================================================================='

' Title: Lcd Display Thermostat Digital
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

Config Portb.6 = Input : Portb.6 = 1 : Up_key1 Alias Pinb.6
Config Portb.7 = Input : Portb.7 = 1 : Down_key1 Alias Pinb.7
Config Portb.5 = Input : Portb.5 = 1 : Up_key2 Alias Pinb.5
Config Portb.4 = Input : Portb.4 = 1 : Down_key2 Alias Pinb.4

Config Portc.6 = Output : Portc.6 = 0 : Heaters Alias Portc.6
Config Portc.7 = Output : Portc.7 = 0 : Fan Alias Portc.7

Dim W As Word , Temp As Single
Dim Input_mv As Single

Dim Maximum_temperature As Single
Dim Maximum_temperature_eeprom As Eram Single
Dim Maximum_temperature_high As Single
Dim Maximum_temperature_low As Single

Dim Minimum_temperature As Single
Dim Minimum_temperature_eeprom As Eram Single
Dim Minimum_temperature_high As Single
Dim Minimum_temperature_low As Single

Dim T As Word : T = 300

'Gosub Eeprom_default
Gosub Eeprom_load
Gosub Display_start_text

'--------------------------------------------

Do
   If Up_key1 = 0 Then
      Gosub Up_maximum_temperature
      Gosub Eeprom_save
   End If
   If Down_key1 = 0 Then
      Gosub Down_maximum_temperature
      Gosub Eeprom_save
   End If
   If Up_key2 = 0 Then
      Gosub Up_minimum_temperature
      Gosub Eeprom_save
   End If
   If Down_key2 = 0 Then
      Gosub Down_minimum_temperature
      Gosub Eeprom_save
   End If
   Gosub Red_temp
   Gosub Setting_hiter
   Gosub Setting_fan
   Gosub Show_temp
   Waitms T
Loop

End

'--------------------------------------------

Display_start_text:
   Cls :
   Locate 1 , 1 : Lcd "Thermostat"
   Locate 2 , 1 : Lcd "-----------------"
   Wait 2 : Cls
Return

''''''''''''''''''''''''''''

Eeprom_default:
   Maximum_temperature = 30.0
   Minimum_temperature = 20.0
   Maximum_temperature_eeprom = Maximum_temperature
   Minimum_temperature_eeprom = Minimum_temperature
Return

''''''''''''''''''''''''''''

Eeprom_save:
   Maximum_temperature_eeprom = Maximum_temperature
   Minimum_temperature_eeprom = Minimum_temperature
Return

''''''''''''''''''''''''''''

Eeprom_load:
   Maximum_temperature = Maximum_temperature_eeprom
   Minimum_temperature = Minimum_temperature_eeprom
Return

'''''''''''''''''''''''''''

Up_maximum_temperature:
   Maximum_temperature = Maximum_temperature + 0.5
   If Maximum_temperature < 0 Or Maximum_temperature > 99 Then Maximum_temperature = 0
Return

''''''''''''''''''''''''''''

Down_maximum_temperature:
   Maximum_temperature = Maximum_temperature - 0.5
   If Maximum_temperature < 0 Or Maximum_temperature > 99 Then Maximum_temperature = 99
Return

'''''''''''''''''''''''''''

Up_minimum_temperature:
   Minimum_temperature = Minimum_temperature + 0.5
   If Minimum_temperature < 0 Or Minimum_temperature > 99 Then Minimum_temperature = 0
Return

'''''''''''''''''''''''''''

Down_minimum_temperature:
   Minimum_temperature = Minimum_temperature - 0.5
   If Minimum_temperature < 0 Or Minimum_temperature > 99 Then Minimum_temperature = 99
Return

'''''''''''''''''''''''''''

Red_temp:
   W = Getadc(7)
   Input_mv = W * 4.8828125
   Temp = Input_mv / 10
Return

'''''''''''''''''''''''''''

Show_temp:
   Locate 1 , 1 : Lcd "Temp Controler: "
   Locate 2 , 1 : Lcd Fusing(minimum_temperature , "#.#")
   Locate 2 , 5 : Lcd "<"
   Locate 2 , 6 : Lcd Fusing(temp , "#.#")
   Locate 2 , 10 : Lcd "<"
   Locate 2 , 11 : Lcd Fusing(maximum_temperature , "#.#")
Return

'''''''''''''''''''''''''''

Setting_fan:
   Maximum_temperature_high = Maximum_temperature
   Maximum_temperature_low = Maximum_temperature - 1
   If Temp > Maximum_temperature_high Then
      Set Fan
   Elseif Temp < Maximum_temperature_low Then
      Reset Fan
   End If
Return

'''''''''''''''''''''''''''

Setting_hiter:
   Minimum_temperature_high = Minimum_temperature + 1
   Minimum_temperature_low = Minimum_temperature
   If Temp < Minimum_temperature_low Then
      Set Heaters
   Elseif Temp > Minimum_temperature_high Then
      Reset Heaters
   End If
Return

'---------------------------------------------------------