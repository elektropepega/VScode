import machine
import utime
from machine import Pin, SoftSPI
import ssd1306

from machine import SPI
spi = SPI(1, sck=Pin(10), mosi=Pin(11))

ledB = machine.Pin(19 , machine.Pin.OUT)
ledG = machine.Pin(18 , machine.Pin.OUT)
ledY = machine.Pin(17 , machine.Pin.OUT)
ledR = machine.Pin(16 , machine.Pin.OUT)
buzzer = machine.Pin(6, machine.Pin.OUT)
buttonUP = machine.Pin(0, machine.Pin.IN, machine.Pin.PULL_DOWN)
buttonDWN = machine.Pin(1, machine.Pin.IN, machine.Pin.PULL_DOWN)
buttonL = machine.Pin(2, machine.Pin.IN, machine.Pin.PULL_DOWN)
buttonR = machine.Pin(3, machine.Pin.IN, machine.Pin.PULL_DOWN)
buttonBCK = machine.Pin(4, machine.Pin.IN, machine.Pin.PULL_DOWN)
buttonACT = machine.Pin(5, machine.Pin.IN, machine.Pin.PULL_DOWN)


dc = Pin(8)   # data/command
rst = Pin(7)  # reset
cs = Pin(9)  # chip select, some modules do not have a pin for this
display = ssd1306.SSD1306_SPI(128, 64, spi, dc, rst, cs)

display.text('Elektro!', 0, 0, 1)
display.show()

while True:
    if buttonUP.value() == 1:

         ledB.value(1)
         utime.sleep(0.1)
         ledB.value(0)
         
    if buttonDWN.value() == 1:

         ledG.value(1)
         utime.sleep(0.1)
         ledG.value(0)
    
    if buttonL.value() == 1:

         ledR.value(1)
         utime.sleep(0.1)
         ledR.value(0)
         
    if buttonR.value() == 1:

         ledY.value(1)
         utime.sleep(0.1)
         ledY.value(0)        
         
    if buttonBCK.value() == 1:

         buzzer.value(1)
         utime.sleep(0.001)
         buzzer.value(0)
         utime.sleep(0.001)


    if buttonACT.value() == 1:
         
         buzzer.value(1)
         utime.sleep(0.003)
         buzzer.value(0)
         utime.sleep(0.003)
        

       
         
         
    
