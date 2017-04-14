# Configurando o puppet no servidor
define base::puppetconf ( $ambiente ) {

#include base

# Coletando a versão do Sistema operacional para configurar o template de repositório
file { '/etc/puppet/puppet.conf':
  ensure  => present,
  content => template('base/puppet.conf.erb'),
  notify  => Service['puppet'],
  mode    => '0664',
  owner   => 'puppet',
  group   => 'puppet',
}

# Istalando e configurando o puppet agent
package { 'puppet':
   ensure => installed,
#   before => File['/etc/puppet/puppet.conf.teste'],
}
service { 'puppet':
   ensure  => running,
   require => Package['puppet'],
}


# Verificando se trata-se de um servidor puppetserver
if tagged('puppetserver') {
notify { 'Contém a tag puppetserver': }
include base::puppetmaster
}
}
