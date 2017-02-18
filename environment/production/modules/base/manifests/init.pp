# Instalando os pacotes básicos e configurações
class base {
# Verificando se trata-se de um servidor puppetserver
if tagged('puppetserver') {
notify { 'Contém a tag puppetserver': }
include base::puppetmaster
}

if $::operatingsystem in ['CentOS']{
notify { 'Detectando sistema operacional': }
notify { "Sistema operacional é ${::operatingsystem}": }
package { ['epel-release','yum-utils','openssh','bind-utils','htop','vim-enhanced','net-tools','telnet',]:
  ensure => present,
}
service { 'sshd':
  ensure  => running,
  require => Package['openssh'],
}
file { '/etc/ssh/sshd_config.conf':
  ensure  => present,
  source  => 'puppet:///modules/base/sshd_config_file',
  require => Package['openssh'],
  owner   => 'root',
  group   => 'root',
  mode    => '0755',
}

} else { notify { '...': } }
include myfw
}

