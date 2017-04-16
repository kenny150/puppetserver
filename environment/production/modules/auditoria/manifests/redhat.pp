# Iniciando a classe 
class auditoria::redhat {


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
  source => 'puppet:///modules/auditoria/rsyslog.conf.file.redhat',
  require => Package['rsyslog'],
  notify => Service['rsyslog'],
}

notify {'Aplicando a classe auditoria::reddhat' :}

}
