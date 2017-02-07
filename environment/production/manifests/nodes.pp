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

}
