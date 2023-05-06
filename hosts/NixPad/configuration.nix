{ config, pkgs, lib, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    kernelParams = [ "quiet" "acpi_backlight=video" ];
  };

  fileSystems."/".options = [ "noatime" "nodiratime" ];

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/e65b8a2e-f10d-40c2-a9c8-e0d8dd4c2b4a";
      preLVM = true;
      allowDiscards = true;
    };
  };

  networking = {
    hostName = "NixPad";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Sao_Paulo";

  i18n = {
    defaultLocale = "pt_BR.UTF-8";
    extraLocaleSettings = {
      LC_ADRESS = "pt_BR.UTF-8";
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };

  console = {
    font = "lat2-16";
    keyMap = "br-abnt2";
  };

  services.fstrim.enable = true;

  services.flatpak.enable = true;  
  
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
  
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [ intel-media-driver ];
  };

  programs.zsh.enable = true;

  programs.neovim = {
    enable = true;
    vimAlias = true;
    configure = {
      customRC = ''
        set number
        set relativenumber
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ vim-nix ];
      };
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users."victor" = {
      isNormalUser = true;
      group = "users";
      extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    };
  };

  nixpkgs.config.allowUnfree = true;  

  environment = {
    defaultPackages = lib.mkForce [];
    systemPackages = with pkgs; [
      bat
      curl
      exa
      neovim
      wget
    ];
    shells = with pkgs; [ zsh ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system = {
    autoUpgrade = {
      enable = false;
      channel = https://nixos.org/channels/nixos-unstable;
    };
    stateVersion = "23.05";
  };

}
