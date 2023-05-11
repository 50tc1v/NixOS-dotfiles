{ config, pkgs, ... }: {

  programs.bash = {
    promptInit = ''PS1="\[\e[01;31m\]\u\[\e[m\]\[\e[01;31m\]@\[\e[m\]\[\e[01;31m\]\h\[\e[m\] \[\e[01;34m\]\w\[\e[m\] \[\e[01;34m\]\\$\[\e[m\] "'';
    shellAliases = {
      ls = "ls -A --color=always";
      cp = "cp -iv";
      mkdir = "mkdir -pv";
      mv = "mv -iv";
      rm = "rm -Iv --preserve-root";
      diff = "diff --color=always";
      grep = "grep --color=always";
      ip = "ip -color=always";
    };
  };
  
  programs.neovim = {
    enable = true;
    vimAlias = true;
    configure = {
      customRC = ''
        set number
        set relativenumber
        set noswapfile
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ vim-nix ];
      };
    };
  };

}
