
node default {
notify { 'Aplicando configurações básicas...': }
include base
$message = hiera('message')
notify { "$message":}

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
$message = hiera('message')
notify { "$message":} 
}
