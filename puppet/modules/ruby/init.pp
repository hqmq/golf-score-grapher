class ruby {
  exec{ "download_yaml"
    command => "wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz",
    cwd => "/usr/src",
    path => $path,
    creates => "/usr/src/yaml-0.1.4.tar.gz",
    requires => Class[Ruby::Prerequisites]
  }
  
  exec{ "unpack_yaml" 
    command => "tar zxf yaml-0.1.4.tar.gz",
    cwd => "/usr/src",
    path => $path,
    creates => "/usr/src/yaml-0.1.4",
    requires => Exec["download_yaml"],
  }
  
  exec{ "make_yaml"
    command => "./configure --prefix=/usr/local && make && make install",
    cwd => "/usr/src/yaml-0.1.4",
    path => $path,
    creates => "/usr/local/lib/libyaml.so",
    requires => Exec["unpack_yaml"]
  }
  
  exec{ "download_ruby"
    command => "wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz",
    cwd => "/usr/src",
    path => $path,
    creates => "/usr/src/ruby-1.9.3-p194.tar.gz",
    requires => Exec["make_yaml"]
  }
  
  exec{ "unpack_ruby" 
    command => "tar -xzf ruby-1.9.3-p194.tar.gz",
    cwd => "/usr/src",
    path => $path,
    creates => "/usr/src/ruby-1.9.3-p194",
    requires => Exec["download_ruby"],
  }
  
  exec{ "make_ruby"
    command => "/configure --prefix=/usr/local --disable-install-doc --with-opt-dir=/usr/local/lib && make && make install",
    cwd => "/usr/src/ruby-1.9.3-p194",
    path => $path,
    creates => "/usr/local/bin/ruby",
    requires => Exec["unpack_ruby"]
  }
}