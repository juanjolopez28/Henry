import sys
import os
###Input
#color= input('¿Cual es tu color favorito?')
#print(color)
##Libreria Sys
'''print('Se ejecuto el archivo', sys.argv[0])
print('Primer parametro', sys.argv[1])
print('Segundo parametro',sys.argv[2])

print('El tipo de dato del segundo es', type(sys.argv[2]))

'''
###archivos
'''archivo=open('datos.txt','r')
for linea in archivo:
    print (linea)
archivo.close()

print(os.getcwd())'''

from bs4 import BeautifulSoup
import urllib.request

response= urllib.request.urlopen('https://es.wikipedia.org/wiki/Python')
html=response.read()
soup=BeautifulSoup(html,'html.parser')
text=soup.get_text()
print(text)