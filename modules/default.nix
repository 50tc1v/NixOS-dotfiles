{ config, ... }: {
  imports = [
    ./fonts.nix
    ./services.nix
    ./programs.nix
    ./security.nix
    ./xserver-xfce4.nix
  ];
}
