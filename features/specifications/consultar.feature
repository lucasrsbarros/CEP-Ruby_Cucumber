#language: pt

@consultar_cep
Funcionalidade: Consulta CEP

Usuário de um sistema de consultas por CEP
Obtém maiores informações do endereço ao informar CEP válido

Contexto: Dado que tenho acesso a API ViaCep
    @cep_valido
    Cenário: CEP válido
        Quando consulto o CEP válido "01001000"
        Então serviço retorna status de sucesso "200"
        E vejo o código IBGE do endereço consultado

    @cep_invalido    
    Esquema do Cenário: CEP inválido
        Quando consulto o CEP inválido "0000000"
        Então serviço retorna status de erro "400"
    