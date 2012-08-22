include ruby

group { 'puppet': ensure => 'present' }

exec{"bundle":
  command => "/usr/local/bin/bundle install",
  cwd => "/vagrant",
  require => Class[Ruby],
}

Group[puppet] -> Class[ruby] -> Exec[bundle]