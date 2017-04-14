# Instalando os pacotes básicos e configurações
class base {


# Verificando se trata-se de um servidor puppetserver
if tagged('puppetserver') {
notify { 'Contém a tag puppetserver': }
include base::puppetmaster
}


#Verificando se é redhat/centos
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

# Criando repositório no Centos

$get_version = "${::operatingsystemmajrelease}"
$versao = "${get_version}"

file { '/etc/yum.repos.d/puppetl.repo':
   ensure  => present,
   content => template('base/puppetl.repo.erb'),
#   before  => [Package['puppet'],Service['puppet']],
}

}


#Verificando se o sistema é debian
if $::operatingsystem in ['Ubuntu']{
notify { 'Detectando Sistema operacional': }
notify { "Sistema operacional é ${::operatingsystem}": }
package { ['openssh-client', 'htop', 'vim',]:
  ensure => present,
}
}
else { notify { '...': } }
include myfw
}
