import machine
import utime

class Encoder:
    def __init__(self, pin_clk, pin_dt, pin_sw):
        self.pin_clk = machine.Pin(pin_clk, machine.Pin.IN, machine.Pin.PULL_UP)
        self.pin_dt = machine.Pin(pin_dt, machine.Pin.IN, machine.Pin.PULL_UP)
        self.pin_sw = machine.Pin(pin_sw, machine.Pin.IN, machine.Pin.PULL_UP)
        self.value = 0
        self.prev_clk_state = self.pin_clk.value()
        self.hold_start_time = 0

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

    def held(self, duration):
        if self.pin_sw.value() == 0:
            current_time = utime.ticks_ms()
            if self.hold_start_time == 0:
                self.hold_start_time = current_time
            elif current_time - self.hold_start_time >= duration:
                return True
        else:
            self.hold_start_time = 0
        return False