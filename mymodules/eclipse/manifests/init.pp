class eclipse {
  $downloadUrl = "http://ftp.osuosl.org/pub/eclipse//technology/epp/downloads/release/juno/SR2/eclipse-jee-juno-SR2-linux-gtk-x86_64.tar.gz"
  $downloadEclipse = "/usr/bin/wget '$downloadUrl' -P /tmp"
  $untar = "/bin/tar xvzf /tmp/eclipse-jee-juno-SR2-linux-gtk-x86_64.tar.gz -C $home"

  $home = "/home/${id}/opt/eclipse"
  $bin = "$home/eclipse"

  exec { "$downloadEclipse":
    creates => "/tmp/eclipse-jee-juno-SR2-linux-gtk-x86_64.tar.gz"
  }

  exec { "$untar":
    creates => $bin
  }

  file { "$home":
    ensure => directory,
    require => Exec["$untar"]
  }

}

