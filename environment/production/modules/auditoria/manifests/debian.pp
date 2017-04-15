# Iniciando a classe 
class auditoria::debian {


package { 'rsyslog': 
  ensure => present,
}


service { 'rsyslog':
  ensure => running,
  require => Package['rsyslog'],
}

file { '/etc/rsyslog.d':
  ensure => directory,
  require => Package['rsyslog'],
}


file { '/etc/rsyslog.conf':
  source => 'puppet:///modules/auditoria/rsyslog.conf.file.debian',
  require => Package['rsyslog'],
  notify => Service['rsyslog'],
  mode => 0644,
  owner => 'root',
  group => 'root',
}

notify {'Aplicando a classe auditoria::debian' :}

}
