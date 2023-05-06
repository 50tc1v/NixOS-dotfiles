pkgs: {
  enable = true;
  enableAutosuggestions = true;
  enableSyntaxHighlighting = true;
  dotDir = ".config/zsh";
  history = {
    path = "$ZDOTDIR/.zsh_history";
    size = 10000;
    save = 10000;
  };
  defaultKeymap = "viins"; # vi mode.
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "sudo" ];
    theme = "gentoo";
  };
  shellAliases = {
    # Changing "ls" to "exa".
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
    
    # yt-dlp.
    yta-best = "yt-dlp --extract-audio --audio-format best";
    ytv-best = "yt-dlp -f bestvideo+bestaudio";
  };
}
