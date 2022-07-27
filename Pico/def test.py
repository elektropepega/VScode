import machine
import utime

buttonON = machine.Pin(0, machine.Pin.IN, machine.Pin.PULL_DOWN)
buttonOFF = machine.Pin(1, machine.Pin.IN, machine.Pin.PULL_DOWN)
led = machine.Pin(19, machine.Pin.OUT)
led2 = machine.Pin(18, machine.Pin.OUT)


def start():
    while True: 
        led.value(1)
        utime.sleep(0.5)
        led.value(0)
        utime.sleep(0.5)

        if buttonOFF.value() == 1:
            
            break

       

while True: 
    if buttonON.value() == 1: 
        start()