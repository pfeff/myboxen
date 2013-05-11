class dotfiles($home) {
  
  $dotfiles = "${home}/src/pfeff/dotfiles"

  vcsrepo {"${dotfiles}":
    ensure => present,
    provider => git,
    source => "git://github.com/pfeff/dotfiles.git"
  }

}

