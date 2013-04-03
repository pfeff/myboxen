class eclim {
  include eclipse
  include java
  include vim

  $eclimUrl = "http://downloads.sourceforge.net/project/eclim/eclim/2.2.5/eclim_2.2.5.jar"
  $wgetEclim = "/usr/bin/wget $eclimUrl -P /tmp"
  $installEclim = "/usr/bin/java -Dvim.files=$vim::vim -Declipse.home=$eclipse::home -jar /tmp/eclim_2.2.5.jar install"

  exec { "$wgetEclim":
    unless => "/bin/ls /tmp/eclim_2.2.5.jar"
  }

  exec { "$installEclim":
    require => File["$eclipse::home"],
    creates => "$eclipse::home/eclim"
  }


}

