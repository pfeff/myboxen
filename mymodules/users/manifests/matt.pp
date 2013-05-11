class users::matt {
  user {"matt":
    ensure => present
  }

  $home = "/home/matt"
}

