
node default {
notify { 'Aplicando configurações básicas...': }
include base
$message = hiera('message')
notify { "$message":}
include apache
}

node puppet {
#Instalando os pacotes básicos para o PuppetServer
include tmpfile
package { 'puppetdb':
  ensure => present,
}
service { 'puppetdb':
  ensure  => running,
  require => Package['puppetdb'],
  enable  => true,
}
$message = hiera('top_secret','dejavu')
#$message = hiera('message')
notify { "$message":}
}
