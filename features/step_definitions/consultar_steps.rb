Quando('consulto o CEP válido "01001000"') do 
  @ConsultaCepValido = HTTParty.get("https://viacep.com.br/ws/01001000/json/")
end

Então('serviço retorna status de sucesso {string}') do |sucesso|
  expect(@ConsultaCepValido.code).to eq(200)
end

Então('vejo o código IBGE do endereço consultado') do
  puts "IBGE:" + (@ConsultaCepValido["ibge"])
end

Quando('consulto o CEP inválido {string}') do |erro|
  @ConsultaCepInvalido = HTTParty.get("https://viacep.com.br/ws/00000000/json/")
end

Então('serviço retorna status de erro "400"') do 
  expect(@ConsultaCepInvalido["erro"]).to be true
end