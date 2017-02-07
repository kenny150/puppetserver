class cookbook::stage {

stage { 'primeiro':
before => Stage['main'],
}

stage { 'ultimo':
require => Stage['main'],
}

class eu_primeiro {
notify { 'Eu primeiro': }
}

class eu_depois {
notify {'Eu por ultimo': }
}

class { 'eu_primeiro':
stage => 'primeiro',
}

class { 'eu_depois':
stage => 'ultimo',
}

}
