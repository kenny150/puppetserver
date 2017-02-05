class apache {

File {
owner => 'apache',
group => 'apache',
mode  => 0644,
}

file { '/var/www/html/index.html':
content => "<html><body><p>teste</p></body></html>\n"
}
file { '/var/www/html':
ensure  => directory,
recurse => true,
}
file { '/var/www/':
ensure  => directory,
recurse => true,
}
package { 'httpd':
ensure => present,
}
service { 'httpd':
ensure => running,
}
}
