## Importando arquivo nodes.pp
#import 'nodes.pp'

# Definindo ambiente através do IP

#if $::ipaddress =~ /192.168.*/ {
#notify { 'Ambiente de Produção': }
#}
#elsif $::ipaddress =~ /172.16.*/ {
#notify { 'Ambiente de Stage': }
#}
#else {  notify { 'Não de Dev': }
#}

# Definindo um estagio para execução
stage { 'exec_primeiro':
before => Stage['main'],
}
# Criando a classe que executará o primeiro passo da receita antes dos outros

class inicial {

# Coletando o ambiente baseado no nome
if $::hostname =~ /prd-*/ {
   $ambiente = 'production'
}
elsif $::hostname =~ /stg-*/ {
   $ambiente = 'stagging'
}
elsif $::hostanme =~ /dev-*/ {
   $ambiente = 'dev'
}
else { notify { 'Ambiente não definido, aplicando o padrão': }
   $ambiente = 'dev'
}

#include base
base::puppetconf {'unset':
   ambiente => "$ambiente",
}

}

# Declarando a classe criada e dizendo que ela será executada antes das demais

class { 'inicial':
stage => 'exec_primeiro',
}

# Incluindo a receita base

#include base

# Aplicando mensagem via hiera

$message = hiera('message')
notify { "Mensagem é $message": }
