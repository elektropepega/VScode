import machine
import utime

class Encoder:
    def __init__(self, pin_clk, pin_dt, pin_sw):
        self.pin_clk = machine.Pin(pin_clk, machine.Pin.IN, machine.Pin.PULL_UP)
        self.pin_dt = machine.Pin(pin_dt, machine.Pin.IN, machine.Pin.PULL_UP)
        self.pin_sw = machine.Pin(pin_sw, machine.Pin.IN, machine.Pin.PULL_UP)
        self.value = 0
        self.prev_clk_state = self.pin_clk.value()

    def update(self):
        clk_state = self.pin_clk.value()
        dt_state = self.pin_dt.value()

        if clk_state != self.prev_clk_state:
            if dt_state != clk_state:
                self.value += 1
            else:
                self.value -= 1

        self.prev_clk_state = clk_state

    def switch_state(self):
        return self.pin_sw.value()

# Inicializace enkodéru s piny 13, 12, 16
encoder = Encoder(pin_clk=13, pin_dt=12, pin_sw=16)

# Hlavní smyčka
while True:
    # Aktualizace hodnoty enkodéru
    encoder.update()

    # Výpis hodnoty enkodéru
    print("Value: {}".format(encoder.value))

    # Kontrola stisku tlačítka enkodéru
    if encoder.switch_state() == 0:
        print("Button pressed")

    # Krátká pauza
    utime.sleep_ms(10)