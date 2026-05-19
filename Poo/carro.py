# A palavra "class" é usada para criar uma classe.
# Uma classe funciona como um molde para criar objetos.
class Carro:


#método Construtor

    #"def" definir uma função ou método
    # "__init__" é um método especial chamado de construtor de classe.
    # Ele é executado automaticamente quando um objeto é criado


    # "self" representa o proprio objeto.


    # "marca", "modelo", "ano" e "velocidade" são parâmetros recebidos pela classe.
    def __init__(self, marca, modelo, ano, velocidade=0):
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
        self.velocidade = velocidade

  #Métodos 
  # Métodos acelerar
    def acelerar ( self, aumento):
        #self.velocidade= self.velocidade+aumento 
        self.velocidade+= aumento 

        print(f" O carro acelerou para  { self.velocidade} km/h")

        # Criando um objeto Classe Carro 



# A partir daqui, NENHUM espaço no começo da linha (totalmente à esquerda):


# Criando um objeto da classe Carro
#"carro1" é uma variável que recebe um objeto
carro1 = Carro("chevrolet", "toro", 2020, 0)


# Exibe informações do carro 1
print(f"Marca: {carro1.marca}")
print(f"Modelo: {carro1.modelo}")
print(f"Ano: {carro1.ano}")


carro1.acelerar(180)

## " carro2" é uma variável que recebe um objeto
# carro2= Carro ("lamborghini")


carro2= Carro (" lamborghini", "toro",2025,0)

print(f"Marca: {carro2.marca}")
print(f"Modelo: {carro2.modelo}")
print(f"Ano: {carro2.ano}")
print(f"Velocidade:{carro2.velocidade} km/h")

