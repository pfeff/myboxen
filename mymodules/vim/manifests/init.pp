class vim {

  include dotfiles

  $vimrc = "/home/${id}/.vimrc"

  package {"vim":
    ensure => present,
  }

  file {"${vimrc}":
    ensure => link,
    target => "$dotfiles::dotfiles/vimrc"
  }

  vcsrepo {"/home/${id}/.vim/bundle/vim-surround":
    ensure => present,
    provider => git,
    source => "https://github.com/tpope/vim-surround.git",
  }

}
