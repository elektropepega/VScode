from machine import Pin, SPI
import ssd1306
import utime
import framebuf
import time
import image_lib



piezo = Pin(9, Pin.OUT)

button_0 = Pin(0, Pin.IN, Pin.PULL_DOWN)
button_1 = Pin(1, Pin.IN, Pin.PULL_DOWN)
button_2 = Pin(2, Pin.IN, Pin.PULL_DOWN)
button_3 = Pin(3, Pin.IN, Pin.PULL_DOWN)
button_4 = Pin(4, Pin.IN, Pin.PULL_DOWN)
button_5 = Pin(5, Pin.IN, Pin.PULL_DOWN)

button_up = button_0
button_down = button_1
button_left = button_2
button_right = button_3
button_back = button_4
button_action = button_5

#display init
spi = SPI(1, 80_000_000, sck=Pin(10), mosi=Pin(11))
display = ssd1306.SSD1306_SPI(128, 64, spi, dc=Pin(8), res=Pin(7), cs=Pin(9))


draha_1_x = 43
draha_1_y = 1
draha_2_x = 86
draha_2_y = 1
speed = 10
display.pixel(draha_1_x, draha_1_y, 1)
display.pixel(draha_2_x, draha_2_y, 1)
display.show()

while True:
    display.fill(0)
    if draha_1_y == 64:
        draha_1_y = 1
    draha_1_y = draha_1_y + 1
    if draha_2_y == 64:
        draha_2_y = 1
    draha_2_y = draha_2_y + 1
    display.pixel(draha_1_x, draha_1_y, 1)
    display.pixel(draha_2_x, draha_2_y, 1)
    display.show()
    utime.sleep_ms(speed)
