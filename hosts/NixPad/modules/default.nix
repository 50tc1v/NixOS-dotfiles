{ config, pkgs, ... }: {
  imports = [
    ./fonts.nix
    ./pipewire.nix
    ./power-saving.nix
    ./ssh.nix
    ./xfce.nix
    ./zsh.nix
  ];
}
