# Configurando o puppet no servidor

define base::puppetconf ( $ambiente ) {
include base

# Coletando a vrsão do Sistema operacional

$get_version = "${::operatingsystemmajrelease}"
$versao = "${get_version}"

file { '/etc/puppet/puppet.conf.teste':
  ensure  => present,
  content => template('base/puppet.conf.erb'),
  notify  => Service['puppet'],
  mode    => '0664',
  owner   => 'puppet',
  group   => 'puppet',
}

# Criando repositório

file { '/etc/yum.repos.d/puppetl.repo':
   ensure  => present,
   content => template('base/puppetl.repo.erb'),
   before  => [Package['puppet'],Service['puppet'],File['/etc/puppet/puppet.conf.teste']],
}

# Istalando e configurando o puppet agent

package { 'puppet':
   ensure => installed,
   before => File['/etc/puppet/puppet.conf.teste'],
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
