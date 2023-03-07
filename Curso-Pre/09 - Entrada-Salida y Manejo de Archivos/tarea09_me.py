#1.-Crear un script con el nombre "clase09_ej1.py" que reciba 3 parametros a elección, 
#verificando que sean exactamente esa cantidad, y muestre como salida los parámetros recibidos

import sys

if(len(sys.argv)==4):
    print(sys.argv[1])
    print(sys.argv[2])
    print(sys.argv[3])
else:
    print(len(sys.argv))
    print("introducir 03 parametros")