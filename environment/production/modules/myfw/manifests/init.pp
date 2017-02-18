class myfw {
 include firewall
 # regras
 include myfw::post
 include myfw::pre
 # limpa todas as regras
 resources { "firewall":
 purge => true
 }
 # ordem de execução
 Firewall {
 before => Class['myfw::post'],
 require => Class['myfw::pre'],
 }
}
