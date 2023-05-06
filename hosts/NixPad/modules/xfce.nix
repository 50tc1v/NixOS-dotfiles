{ config, pkgs, ... }: {

  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.gtk = {
      enable = true;
      iconTheme.name = "Papirus-Dark";
      theme.name = "Arc-Dark";
      indicators = [ "~host" "~spacer" "~clock" "~spacer" "~session" "~power" ];
      clock-format = "%A, %d/%m/%Y - %H:%M";
    }; 
  };
  
  services.xserver.desktopManager.xfce.enable = true;

  services.xserver = {
    layout = "br";
    xkbVariant = "abnt2";
  };

  services.xserver.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
      scrollMethod = "edge";
      tapping = true;
    };
  };

  services.xserver.videoDrivers = [ "modesetting" ];

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };

  environment.systemPackages = ( with pkgs; [
    arc-theme
    gnome.file-roller
    gparted
    papirus-icon-theme
  ]) ++ (with pkgs.xfce; [
    xfce4-pulseaudio-plugin
    xfce4-weather-plugin
    xfce4-whiskermenu-plugin
  ]);
}
