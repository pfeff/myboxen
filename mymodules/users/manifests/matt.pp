class users::matt {
  user {"matt":
    ensure => present
  }

  $home = "/home/matt"

  rbenv::install { "matt": }
  rbenv::compile { "1.9.3-p327":
    user => "matt"
  }

  class {'dotfiles':
    home => $home
  }
  class {'vim':
    home => $home
  }
}

