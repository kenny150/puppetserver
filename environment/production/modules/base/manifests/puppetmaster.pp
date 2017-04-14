# Declarando a classe para instalação e configuração do puppetmaster
class base::puppetmaster ($ambiente='producao'){

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

}
