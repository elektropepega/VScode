#Python kalkulačka neomezené výpočty
while True:
    cislo1 = int(input("zadej první číslo"))
    operace = input("zedej operaci")
    cislo2 = int(input("zadej druhé číslo"))


    if operace == "+":
        vysledek = cislo1 + cislo2
    if operace == "-":
        vysledek = cislo1 - cislo2
    if operace == "*":
        vysledek = cislo1 * cislo2        
    if operace == "/":
        vysledek = cislo1 / cislo2

    print(cislo1, operace, cislo2, "=", vysledek)
        
             
    
            
