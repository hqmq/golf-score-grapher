class ruby::prerequisites {
  package { "make":
		ensure => present,
		require => Class[remi]
	}
	package { "gcc":
		ensure => present,
	}
	package { "openssl-devel":
		ensure => present,
	}
	package { "zlib-devel":
		ensure => present,
	}
	package { "gcc-c++":
		ensure => present,
	}
	package { "autoconf":
		ensure => present,
	}
	package { "readline-devel":
		ensure => present,
	}
	package { "curl-devel":
		ensure => present,
	}
	package { "expat-devel":
		ensure => present,
	}
	package { "gettext-devel":
		ensure => present,
	}
	package { "ncurses-devel":
		ensure => present,
	}
	package { "sqlite3-devel":
		ensure => present,
	}
	package { "mysql-devel":
		ensure => present,
	}
	package { "wget":
		ensure => present,
	}
	package { "httpd-devel":
		ensure => present,
	}
	package { "which":
		ensure => present,
	}
}