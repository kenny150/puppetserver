# Configurando um servidor de auditoria
class auditoria { 

case $::osfamily {
  'RedHat' : { include auditoria::redhat }
  'Debian' : { include auditoria::debian }
  default : { notify {'Erro !': } 
      }
   }
}
