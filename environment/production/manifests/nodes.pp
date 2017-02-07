node default {

notify { 'Aplicando configurações básicas...': }

include base

include apache

}

node puppet {

#Instalando os pacotes básicos para o PuppetServer

package { 'puppetdb':
  ensure => present,
}

service { 'puppetdb':
  ensure  => running,
  require => Package['puppetdb'],
  enable  => true,
}

# Coletando dados do hiera e apresentando
$message = hiera('message')
notify { "$message":}

# Chamando um definition type

base::tmpfile { 'unset':

  file => [ '1', '2', '3'],

}

# Definindo uma tag para o node

tag('tmpfile')

# Validando se contém a tag tmpfile

if tagged('tmpfile') {

notify { 'Contém a tag tmpfile': }

}

# Se houver alteração em algum arquivo que contém a classe tmpfile então reinicie o serviço especificado

#File <| tag == 'tmpfile' |> ~> Service['tmpfile-service']

}
