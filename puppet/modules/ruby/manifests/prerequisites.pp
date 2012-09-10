class ruby::prerequisites {
  package { "make":
		ensure => present,
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
	package { "libcurl-devel":
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
	package { "sqlite-devel":
		ensure => present,
	}
	package { "mysql-devel":
		ensure => present,
	}
	package{ "libxml2-devel.x86_64":
	  ensure => present
	}
  package{ "libxslt-devel.x86_64":
    ensure => present
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