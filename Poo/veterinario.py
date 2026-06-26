# ==========================================
# SISTEMA DE CLÍNICA VETERINÁRIA
# ==========================================

class Profissional:
    def __init__(self, codigo, nome, contato, celular, credencial):
        self.codigo = codigo
        self.nome = nome
        self.contato = contato
        self.celular = celular
        self.credencial = credencial


class Tutor:
    def __init__(self, codigo, nome, documento, telefone, email,
                 endereco, municipio, uf, registro):
        self.codigo = codigo
        self.nome = nome
        self.documento = documento
        self.telefone = telefone
        self.email = email
        self.endereco = endereco
        self.municipio = municipio
        self.uf = uf
        self.registro = registro


class Atendente:
    def __init__(self, codigo, nome, email, acesso):
        self.codigo = codigo
        self.nome = nome
        self.email = email
        self.acesso = acesso


class Pet:
    def __init__(self, codigo, nome, especie, raca, idade,
                 tutor_codigo, consulta_codigo, profissional_codigo):
        self.codigo = codigo
        self.nome = nome
        self.especie = especie
        self.raca = raca
        self.idade = idade
        self.tutor_codigo = tutor_codigo
        self.consulta_codigo = consulta_codigo
        self.profissional_codigo = profissional_codigo


class Consulta:
    def __init__(self, numero, procedimento, custo,
                 dia, horario, tutor, profissional, pet):

        self.numero = numero
        self.procedimento = procedimento
        self.custo = custo
        self.dia = dia
        self.horario = horario
        self.tutor = tutor
        self.profissional = profissional
        self.pet = pet

    def mostrar_ficha(self):
        print("\n" + "=" * 35)
        print("        FICHA DA CONSULTA")
        print("=" * 35)

        informacoes = {
            "Código": self.numero,
            "Procedimento": self.procedimento,
            "Valor": f"R$ {self.custo:.2f}",
            "Data": self.dia,
            "Horário": self.horario,
            "Tutor": self.tutor.nome,
            "Paciente": self.pet.nome,
            "Veterinário": self.profissional.nome
        }

        for chave, valor in informacoes.items():
            print(f"{chave}: {valor}")

        print("=" * 35)


# ==========================================
# REGISTROS DE TESTE
# ==========================================

medico = Profissional(
    101,
    "Marina Alves",
    "marina@exemplo.com",
    "(63) 98888-0000",
    "token_medico"
)


pessoa = Tutor(
    201,
    "Carlos Silva",
    "000.000.000-00",
    "(63) 97777-1111",
    "carlos@email.com",
    "Rua Central",
    "Palmas",
    "TO",
    "77000-000"
)


funcionario = Atendente(
    301,
    "Ana Souza",
    "ana@clinica.com",
    "acesso01"
)


animal = Pet(
    401,
    "Thor",
    "Cachorro",
    "Golden Retriever",
    "3 anos",
    pessoa.codigo,
    501,
    medico.codigo
)


consulta = Consulta(
    501,
    "Avaliação geral",
    120.00,
    "25/06/2026",
    "14:30",
    pessoa,
    medico,
    animal
)


consulta.mostrar_ficha()