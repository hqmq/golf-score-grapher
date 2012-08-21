include ruby::prerequisites
include ruby

group { 'puppet': ensure => 'present' }

exec{"bundle":
  command => "bundle install",
  cwd => "/vagrant",
  require => Class[Ruby],
}
exec{"start rails":
  command => "rails server",
  cwd => "/vagrant",
  require => Exec[bundle]
}