{ config, pkgs, ... }:

let
  nvimCustom = import ./nvim.nix;
  zshCustom = import ./zsh.nix;
in {
  home = {
    username = "victor";
    homeDirectory = "/home/victor";
    packages = with pkgs; [
      ani-cli
      flameshot
      gimp
      htop
      keepassxc
      librewolf
      mpv
      pavucontrol
      pfetch
      qbittorrent
      yt-dlp
    ];
    stateVersion = "23.05";
    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  xdg.enable = true;

  programs.git = {
    enable = true;
    userName = "50tc1v";
    userEmail = "50tc1v@proton.me";
  };

  programs.neovim = nvimCustom pkgs;
  programs.zsh = zshCustom pkgs;

}
