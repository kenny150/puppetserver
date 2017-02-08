# Configurando o puppet.conf
define base::puppetconf ( $ambiente ) {
include base

file { '/etc/puppet/puppet.conf.teste':
  ensure  => present,
  content => template('base/puppet.conf.erb'),
  mode    => '0664',
  owner   => 'puppet',
  group   => 'puppet',
}
}
