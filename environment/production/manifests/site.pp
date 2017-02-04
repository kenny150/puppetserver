## Importando arquivo nodes.pp
#import 'nodes.pp'

# Definindo ambiente através do IP

if $::ipaddress =~ /192.168.*/ {
notify { 'Ambiente de Produção': }
}
elsif $::ipaddress =~ /172.16.*/ {
notify { 'Ambiente de Stage': }
}
else {  notify { 'Não de Dev': }
}

# Coletando sistema operacional

if $::operatingsystem in ['CentOS'] {
notify { 'Sistema operacional da familia RedHat': }
}
else { notify { 'Sistema operacional da familia Debian': }
}

#$message = hiera('message')
#notify { "Mensagem é $message": }

