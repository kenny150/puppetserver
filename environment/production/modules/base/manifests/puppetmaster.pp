# Declarando a classe para instalação e configuração do puppetmaster
class base::puppetmaster {

case $::operatingsystem {
'CentOS': { notify { "aplicando a receita do puppetmaster no servidor ${::operatingsystem}": }

package { 'puppetserver':
  ensure => present,
  before => Package['puppetdb'],
}
package { 'puppetdb':
  ensure => present,
  before => Package['hiera'],
  require => Package['puppetserver'],
}
package { 'hiera':
  ensure   => present,
  require  => [Package['puppetserver','puppetdb']],
  provider => 'gem',
}

}
'Debian': { notify{'É um Debian': }}
default: { notify{'So desconhecido': }}
}

}
