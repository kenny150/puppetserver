define tmp () {
file { "/tmp/$name":
  ensure  => present,
  content => "Olá",
}
}
tmp { ['1','2','3']: }
