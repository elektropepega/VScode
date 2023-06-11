import _thread
import time

# Funkce pro první proces
def process1():
    while True:
        print("Proces 1")
        time.sleep(1)

# Funkce pro druhý proces
def process2():
    while True:
        print("Proces 2")
        time.sleep(2)

# Spustíme první proces v novém vlákně
_thread.start_new_thread(process1, ())

# Spustíme druhý proces v novém vlákně
_thread.start_new_thread(process2, ())

# Hlavní smyčka programu
while True:
    pass