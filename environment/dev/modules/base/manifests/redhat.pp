class base::redhat{
notify { 'Aplicando classe redhat': }
# Instalando os pacotes básicos

package { ['openssh', 'iptables-services', 'yum-utils', 'net-tools', 'bind-utils', 'telnet', 'firewalld','vim-enhanced','gcc','epel-release']:
   ensure  => installed,
}

service { 'sshd':
   ensure  => running,
   require => Package["openssh"],
   enable  => true
}
file { '/etc/ssh/sshd_config':
   ensure  => present,
   source  => 'puppet:///modules/base/sshd_config_file',
   notify  => Service['sshd'],
   mode    => 0755,
   owner   => 'sshd',
   group   => 'sshd',
}
service { 'firewalld':
   ensure  => running,
   require => Package['firewalld'],
   enable  => true,
}
service { ['iptables','ip6tables']:
   ensure  => stopped,
}
}# final da classe
