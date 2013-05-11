class users::matt {
  user {"matt":
    ensure => present
  }

  $home = "/home/matt"

  class {'dotfiles':
    home => $home
  }
  class {'vim':
    home => $home
  }
}

