import machine
import utime
from machine import Pin, ADC, PWM, I2C, SoftSPI, SPI, Timer
import ssd1306
from encoder import Encoder
import uos
import _thread
# Inicializace Display
spi = SPI(1, sck=Pin(10), mosi=Pin(11)) 
dc = Pin(8)  
rst = Pin(7)  
cs = Pin(9)  
display = ssd1306.SSD1306_SPI(128, 64, spi, dc, rst, cs)
# Inicializace PWM signálu
pwm_pin = Pin(17)
pwm_freq = 1000  # Výchozí frekvence PWM signálu
# Inicializace potenciometru
pot_pin = machine.ADC(26)
# Inicializace tlačítek
button_encoder = Pin(13, machine.Pin.IN, machine.Pin.PULL_UP)
button_up = Pin(12, machine.Pin.IN, machine.Pin.PULL_DOWN)
button_down = Pin(16, machine.Pin.IN, machine.Pin.PULL_DOWN)
# Inicializace pinu

# Proměnné menu
menu_items = ["Max PWM", "PWM Freq", "Max Speed", "Exit"]
menu_item_index = 0
menu_item_selected = False
menu_item_max_pwm = 1000
menu_item_pwm_freq = pwm_freq
menu_item_max_speed = 20  

# Proměnná pro uložení stavu tlačítka pro potvrzení "Exit"
confirm_button_state = False
confirm_button_previous_state = False
confirm_button_pressed = False


# Proměnná pro uložení času posledního stisku tlačítka button_encoder
button_encoder_last = 0
vstupni_pin = Pin(18, Pin.IN)
# Nastavení maximální hodnoty PWM signálu
max_pwm = 1023
# Název konfiguračního souboru
config_file = "config.txt"

#counter_pin = machine.Pin(18, machine.Pin.IN)
# Načtení nastavení z konfiguračního souboru
def load_config():
    global menu_item_max_pwm, menu_item_pwm_freq, menu_item_max_speed
    try:
        with open(config_file, "r") as file:
            config = {}
            exec(file.read(), config)
            if "max_pwm" in config:
                menu_item_max_pwm = int(config["max_pwm"])
            if "pwm_freq" in config:
                menu_item_pwm_freq = int(config["pwm_freq"])
            if "max_speed" in config:
                menu_item_max_speed = int(config["max_speed"])             

    except OSError:
        # Pokud soubor neexistuje, nastavení zůstane nezměněno
        pass

# Uložení nastavení do konfiguračního souboru
def save_config():
    
    with open(config_file, "w") as file:
        file.write(f"max_pwm = {menu_item_max_pwm}\n")
        file.write(f"pwm_freq = {menu_item_pwm_freq}\n")
        file.write(f"max_speed = {menu_item_max_speed}\n")


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
        show_text("PWM Freq: {} Hz".format(menu_item_pwm_freq), 3)
        show_text("{}".format(pocet_pulsu), 4)
        show_text("Speed: {}".format(scooterspeed), 5)
    else:
        # Menu
        show_text("Menu:", 0)
        for i, item in enumerate(menu_items):
            if i == menu_item_index:
                item = "> " + item
            show_text(item, i + 1)

# Načtení konfigurace při spuštění
load_config()
scooterspeed = 0
pocet_pulsu = 0
predchozi_stav = 0
# Inicializace PWM signálu s výchozí frekvencí
pwm = PWM(pwm_pin)
pwm.freq(menu_item_pwm_freq)
pwm.duty_u16(0)

def counter_1():
    global pocet_pulsu, predchozi_stav
    while True:
        aktualni_stav = vstupni_pin.value()
        if aktualni_stav != predchozi_stav:
            pocet_pulsu += 1
            predchozi_stav = aktualni_stav
        utime.sleep_ms(1)

_thread.start_new_thread(counter_1, ())

# update_menu()
# display.fill(0)
# # show_text("    SCOOTER", 3)
# utime.sleep_ms(2000)
# display.fill(0)
load_config()
pulsace_zasobnik = 0
cas_zasobnik = utime.ticks_ms()
while True:
    now = utime.ticks_ms()
    if utime.ticks_diff(now, cas_zasobnik) >= 1000:
        pulsace_zasobnik = pocet_pulsu
       
        scooterspeed = (pocet_pulsu / 433.2) * 20
    
        pocet_pulsu = 0
        
        cas_zasobnik = now
    # Ovládání menu pomocí tlačítek
    if not menu_item_selected:
        if button_encoder.value() == 0:
            menu_item_selected = True
            utime.sleep_ms(200)
    else:
        if button_up.value() == 1:
            menu_item_index = (menu_item_index - 1) % len(menu_items)
            utime.sleep_ms(200)
        if button_down.value() == 1:
            menu_item_index = (menu_item_index + 1) % len(menu_items)
            utime.sleep_ms(200)
        if button_encoder.value() == 0:
            if menu_item_index == 0:
                # Nastavení "Max PWM"
                load_config()
                while True:
                    display.fill(0)
                    show_text("Max PWM: {}".format(menu_item_max_pwm), 0)
                    if button_up.value() == 1:
                        menu_item_max_pwm += 50
                        utime.sleep_ms(100)
                    if button_down.value() == 1:
                        menu_item_max_pwm -= 50
                        utime.sleep_ms(100)
                    utime.sleep_ms(150)
                    if button_encoder.value() == 0:
                        break

                # Uložení hodnoty do konfiguračního souboru
                save_config()

            elif menu_item_index == 1:
                # Nastavení "PWM Freq"
                load_config()
                while True:
                    display.fill(0)
                    show_text("PWM Freq: {} Hz".format(menu_item_pwm_freq), 0)
                    if button_up.value() == 1:
                        menu_item_pwm_freq += 1000
                        pwm.freq(menu_item_pwm_freq)
                        utime.sleep_ms(100)
                    if button_down.value() == 1:
                        menu_item_pwm_freq -= 1000
                        pwm.freq(menu_item_pwm_freq)
                        utime.sleep_ms(100)
                    utime.sleep_ms(150)
                    if button_encoder.value() == 0:
                        break
            elif menu_item_index == 2:
                # Nastavení "Max speed"
                load_config()
                while True:
                    display.fill(0)
                    show_text("Max speed: {} km/h".format(menu_item_max_speed), 0)
                    if button_up.value() == 1:
                        menu_item_max_speed += 10                        
                        utime.sleep_ms(100)
                    if button_down.value() == 1:
                        menu_item_max_speed -= 10
                        utime.sleep_ms(100)
                    utime.sleep_ms(150)
                    if button_encoder.value() == 0:                    
                        break
                    save_config()
                # Uložení hodnoty do konfiguračního souboru
                save_config()

            elif menu_item_index == 3:
                # Potvrzení "Exit"
                save_config()
                menu_item_selected = False
                utime.sleep_ms(200)
            utime.sleep_ms(200)

        # Aktualizace hodnoty potenciometru
        # Aktualizace hodnoty potenciometru
    pot_value = pot_pin.read_u16()
    max_speed = menu_item_max_speed

    # Omezení PWM signálu na základě maximální rychlosti
    if scooterspeed > max_speed:
        max_duty = int(max_speed * max_pwm / 20)
        duty = max_duty
    else:
        duty = int(pot_value * max_pwm / 1023)

    pwm.duty_u16(duty)

    # Aktualizace menu na displeji
    update_menu()

    utime.sleep_ms(10)
