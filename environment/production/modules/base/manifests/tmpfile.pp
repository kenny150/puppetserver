define base::tmpfile ( $file ) {
include base

file { "/tmp/$file":
  ensure  => present,
  content => "Olá",
}
}
