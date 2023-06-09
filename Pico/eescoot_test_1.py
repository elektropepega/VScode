import utime
import machine
from machine import Pin, ADC, PWM, I2C, SoftSPI, SPI
import ssd1306
from encoder import Encoder



spi = SPI(1, sck=Pin(10), mosi=Pin(11)) 
dc = Pin(8)   # data/command
rst = Pin(7)  # reset
cs = Pin(9)  # chip select, some modules do not have a pin for this
display = ssd1306.SSD1306_SPI(128, 64, spi, dc, rst, cs)




# Inicializace PWM signálu
pwm_pin = Pin(17)
pwm = PWM(pwm_pin)

# Inicializace potenciometruP
pot_pin = machine.ADC(26)

# Inicializace tlačítek
button_encoder = Pin(13, machine.Pin.IN, machine.Pin.PULL_UP)
button_up = Pin(12, machine.Pin.IN, machine.Pin.PULL_DOWN)
button_down = Pin(16, machine.Pin.IN, machine.Pin.PULL_DOWN)


# Proměnné menu
menu_items = ["Max PWM", "Exit"]
menu_item_index = 0
menu_item_selected = False
menu_item_max_pwm = 1000

# Proměnné pro ovládání tlačítka
confirm_button_pressed = False

# Funkce pro zobrazení textu na displeji
def show_text(text, line):
    display.text(text, 0, line * 10)
    display.show()

# Funkce pro aktualizaci menu
def update_menu():
    display.fill(0)

    if not menu_item_selected:
        # Hlavní obrazovka
        show_text("PWM: {}".format(pwm.duty_u16()), 0)
        show_text("Pot Value: {}".format(pot_pin.read_u16()), 1)
        show_text("Max PWM: {}".format(menu_item_max_pwm), 2)
    else:
        # Menu
        show_text("Menu:", 0)
        for i, item in enumerate(menu_items):
            if i == menu_item_index:
                item = "> " + item
            show_text(item, i + 1)

# Přerušení pro stisknutí potvrzovacího tlačítka (encoder)
def confirm_button_interrupt(pin):
    global confirm_button_pressed
    confirm_button_pressed = True

# Přerušení pro stisknutí tlačítka nahoru
def up_button_interrupt(pin):
    global menu_item_index
    menu_item_index = (menu_item_index - 1) % len(menu_items)

# Přerušení pro stisknutí tlačítka dolů
def down_button_interrupt(pin):
    global menu_item_index
    menu_item_index = (menu_item_index + 1) % len(menu_items)

# Nastavení přerušení pro tlačítka
button_encoder.irq(confirm_button_interrupt, machine.Pin.IRQ_FALLING)
button_up.irq(up_button_interrupt, machine.Pin.IRQ_FALLING)
button_down.irq(down_button_interrupt, machine.Pin.IRQ_FALLING)

# Hlavní smyčka
while True:
    if confirm_button_pressed:
        # Zpracování stisknutí potvrzovacího tlačítka
        confirm_button_pressed = False

        if not menu_item_selected:
            # Přechod do menu
            menu_item_selected = True
        elif menu_item_index == 0:
            # Nastavení maximální hodnoty PWM
            menu_item_max_pwm += 100
        elif menu_item_index == 1:
            # Exit z menu
            menu_item_selected = False

    if not menu_item_selected:
        # Zobrazení hlavní obrazovky
        update_menu()
    else:
        # Zobrazení menu
        update_menu()

    # Aktualizace PWM signálu
    pot_value = pot_pin.read_u16()
    max_pwm = menu_item_max_pwm
    duty = int(pot_value * max_pwm / 65535)
    pwm.duty_u16(duty)
    
    utime.sleep_ms(10)
