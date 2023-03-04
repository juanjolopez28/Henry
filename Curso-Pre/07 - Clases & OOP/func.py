class funciones:
    def es_primo(self,numero):
        if(numero==0 or numero==1 or numero==2):
            return False
        else:
            #for i in range(2,numero):
            for i in range(2,int(numero/2)+1):
            #podemos solo tomar la mitad del numero que se usara
                if numero%i==0:
                    return False
            return True
    def factorial1(self,numero):
        if(type(numero) != int):
            return 'El numero debe ser un entero'
        if(numero < 0):
            return 'El numero debe ser pisitivo'
        if (numero > 1):
            numero*=self.factorial1(numero - 1)
        return numero
    
    def mas_repetido(self, lista):
        index_masRe=0
        mas_repe=0
        temp=0
        max_count=0
        for index,valor in enumerate(lista):
            temp=lista.count(valor)
            if(temp>=max_count):
                max_count=temp
                index_masRe=index
        print("El mas repetido es:",lista[index_masRe],"se repite",max_count)
        return(lista[index_masRe])
