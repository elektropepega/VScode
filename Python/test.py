#Python hádej číslo
from random import randint

promnena = randint(1, 10)
print("ahoj zahrajeme si hru hádej číslo")
odpoved = int(input("jaké číslo si myslím?"))

while odpoved != promnena:
    
    if odpoved < promnena:
        odpoved = int(input("číslo je větší"))
                    
    if odpoved > promnena:
        odpoved = int(input("číslo je menší"))
                 
if odpoved == promnena:
    print("hotovo správně")
        