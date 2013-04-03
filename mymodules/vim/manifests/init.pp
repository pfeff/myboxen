class vim {

  include dotfiles

  $vimrc = "/home/${id}/.vimrc"
  $vim = "/home/${id}/.vim"
  $pathogen = "${vim}/autoload/pathogen.vim"
  $bundle = "${vim}/bundle"

  package {"vim":
    ensure => present,
  }

  file {"${vimrc}":
    ensure => link,
    target => "$dotfiles::dotfiles/vimrc"
  }

  file { "${vim}/autoload":
    ensure => directory
  }

  file {"${pathogen}":
    source => "puppet:///modules/vim/pathogen.vim",
    require => File["${vim}/autoload"]
  }

  vcsrepo {"/home/${id}/.vim/bundle/vim-surround":
    ensure => present,
    provider => git,
    source => "https://github.com/tpope/vim-surround.git",
  }

  vcsrepo {"${bundle}/puppet":
    ensure => present,
    provider => git,
    source => "git://github.com/rodjek/vim-puppet.git"
  }

  vcsrepo {"${bundle}/ctrlp.vim":
    ensure => present,
    provider => git,
    source => "https://github.com/kien/ctrlp.vim.git"
  }

}
