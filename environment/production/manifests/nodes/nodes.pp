# Configurando pacots default para nodes indefinidos
node default {
notify { 'Aplicando configurações básicas...': }
include base
}


# Verificando se trata-se de um servidor puppetserver
node puppet {


#Instalando os pacotes básicos para o PuppetServer
include base


# Chamando um definition type
base::tmpfile { 'unset':
  file => [ '1', '2', '3'],
}


# Definindo uma tag para o node
tag('puppetserver')


# Verificando se trata-se de um servidor puppetserver
if tagged('puppetserver') {
notify { 'Contém a tag puppetserver': }
include base::puppetmaster
}


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
}
