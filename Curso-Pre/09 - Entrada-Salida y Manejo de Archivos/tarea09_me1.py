#Crear un script con el nombre "clase09_ej2.py2" que reciba como un valor de temperatura 
#en grados centígrados, un valor de humedad y por último si llovio (Con True o False). 
#Y que cada vez que sea invocado, cargue en el archivo provisto "clase09_ej2.csv" una marca de tiempo y esa información.

import sys
import datetime
import os
'''
if(len(sys.argv)>3):
    grado=float(sys.argv[1])
    humedad=float(sys.argv[2])
    llovio=bool(sys.argv[3])

x = datetime.datetime.now()
print("Ahora =",x)

archivo=open('tarea09.csv','a')
archivo.write(str(x)+'\n')
archivo.close()
'''
#2.-Crear un archivo a partir de los datos presentes en el diccionario provisto. El cual debe contener 
# en la primera fila el nombre de las claves y luego cada línea los elementos i-ésimos de las listas 
# de valores contiguos y separados por coma ','. Este archivo debe llamarse clase09_ej3.csv

'''
montañas = {'nombre':[  'Everest','K2','Kanchenjunga','Lhotse','Makalu',
                        'Cho Oyu','Dhaulagiri','Manaslu','Nanga Parbat','Annapurna I'],
            'orden':[1,2,3,4,5,6,7,8,9,10],
            'cordillera':['Himalaya','Karakórum','Himalaya','Himalaya','Himalaya'
                        ,'Himalaya','Himalaya','Himalaya','Karakórum','Himalaya'],
            'pais': ['Nepal','Pakistán','Nepal','Nepal','Nepal','Nepal','Nepal','Nepal',
                    'Pakistán','Nepal'],
            'altura':[8849,8611,8586,8516,8485,8188,8167,8163,8125,8091]}

print(montañas.keys())
doc=open('tarea09_1.csv','a')

for i in montañas.keys():
    doc.write(i+" ")
doc.write('\n')
for nombre,orden,cordillera,pais,altura in zip(*montañas.values()):
    print(nombre,orden,cordillera,pais,altura)
    doc.write(nombre+','+str(orden)+','+cordillera+','+pais+','+str(altura))
    doc.write('\n')

    
doc.close()'''
#4.-Mostrar el tamaño en MB del archivo generado en el punto 3
'''tambytes=os.path.getsize('tarea09_1.csv')
print(tambytes)
tammbytes= tambytes* 9.537*(10**(-7))
print(tammbytes)'''

#5.-Crear una carpeta llamada clase09_montañas_altas
#os.makedirs("clase09_montañas_altas1")

#6.-Copiar el archivo clase09_ej3.scv en la carpeta clase09_montañas_altas usando la sentencia os.system

#os.system('cp clase09_ej2.csv clase09_montañas_altas1')

#7.-Listar el contenido de la carpeta clase09_montañas_altas

print(os.listdir('./clase09_montañas_altas1'))



