pkgs: {
  enable = true;
  vimAlias = true;
  vimdiffAlias = true;
  extraConfig = ''
    set number
    set relativenumber
    set noswapfile
  '';
  plugins = with pkgs.vimPlugins; [
    vim-css-color
    vim-nix
  ];
}
