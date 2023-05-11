{ config, pkgs, ... }: {

  home = {
    username = "victor";
    homeDirectory = "/home/victor";
    packages = with pkgs; [
      ani-cli
      bat
      exa
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

  xdg = {
    enable = true;
    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/Área\ de\ trabalho";
      documents = "${config.home.homeDirectory}/Documentos";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Músicas";
      pictures = "${config.home.homeDirectory}/Imagens";
      publicShare = "${config.home.homeDirectory}/Público";
      templates = "${config.home.homeDirectory}/Modelos";
      videos = "${config.home.homeDirectory}/Vídeos";
    };
  };

  programs.git = {
    enable = true;
    userName = "50tc1v";
    userEmail = "50tc1v@proton.me";
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      set number
      set relativenumber
      set noswapfile
    '';
    plugins = with pkgs.vimPlugins; [ vim-nix ];
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    dotDir = ".config/zsh";
    history = {
      path = "$ZDOTDIR/.zsh_history";
      size = 10000;
      save = 10000;
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "sudo" ];
      theme = "gentoo";
    };
    defaultKeymap = "viins"; # vi mode.
    shellAliases = {
      # Changing "ls" to "exa" with some tweaks.
      la = "exa -a --color=always --group-directories-first";      # All files and directories.
      ll = "exa -l --color=always --group-directories-first";      # Long format.
      ls = "exa -alh --color=always --group-directories-first";    # My preferred listing.
      lt = "exa -aTF --color=always --group-directories-first";    # Tree listing.
      # Verbosity and settings that you pretty much just always are going to want.
      cp = "cp -iv";
      mkdir = "mkdir -pv";
      mv = "mv -iv";
      rm = "rm -Iv";
      diff = "diff --color=always";
      grep = "grep --color=always";
      bat = "bat -p";
      ip = "ip -color=always";
      # Some useful aliases for git.
      gs = "git status";
      gc = "git commit";
      gpll = "git pull";
      gpsh = "git push origin $(current_branch)";
      # YT-DLP.
      yta-best = "yt-dlp --extract-audio --audio-format best";
      ytv-best = "yt-dlp -f bestvideo+bestaudio";
    };
  };

}
