# COnfigurando pacots default para nodes indefinidos

node default {
notify { 'Aplicando configurações básicas...': }
include base
}

node puppet {
#Instalando os pacotes básicos para o PuppetServer
include base
}
# Coletando dados do hiera e apresentando
#$message = hiera('message')
#notify { "$message":}
# Chamando um definition type
base::tmpfile { 'unset':
  file => [ '1', '2', '3'],
}
# Definindo uma tag para o node
tag('tmpfile','puppetserver')
# Validando se contém a tag tmpfile
#if tagged('puppetserver') {
#notify { 'Contém as tags tmpfile e puppetserver': }
#}
# Se houver alteração em algum arquivo que contém a classe tmpfile então reinicie o serviço especificado
#File <| tag == 'tmpfile' |> ~> Service['tmpfile-service']
# Adicionando um exemplo de ordenação usando stage
include cookbook::stage
# Usando a função generate (função que executa um determinado script e colhe sua saida
$mensagem = generate('/usr/local/bin/ola.rb')
notify { "$mensagem": }
