# Iniciando a classe base

class base {
notify {'Aplicando a classe base': }

case $osfamily {
'RedHat': { include base::redhat }
'Debian': { include base::debian }
default : { notify { 'Familia do SO não identificado': }
}
}
}
