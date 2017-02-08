# Importando as configurações para cada node

import 'nodes/nodes.pp'

# Detectando o ambiente
notify { 'Detectando o ambiente ...': }

if $::ipaddress =~ /192.168.*/ {
base::puppetconf { 'unset':
   ambiente => 'dev'
}

}

elsif $::ipaddress =~ /172.16.*/ {
base::puppetconf { 'unset':
   ambiente => 'production'
}

}

elsif $::ipaddress =~ /10.7.*/ {
base::puppetconf { 'unset':
   ambiente => 'stage'
}
}
elsif $::ipaddress == undef {
   notify { 'ERRO: SERVIDOR NÃO RECEBEU IP': }
}

else { notify {'ALGO DE ERRADO OCORREU !': } }
