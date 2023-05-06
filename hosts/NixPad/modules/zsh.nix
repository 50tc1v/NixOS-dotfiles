{ config, ... }: {

  programs.zsh = {
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "gentoo";
    };
    histSize = 1000;
    histFile = "$HOME/.zsh_history";
    shellAliases = {
      # Changing "ls" to "exa".
      la = "exa -a --color=always --group-directories-first";
      ll = "exa -l --color=always --group-directories-first";
      ls = "exa -alh --color=always --group-directories-first";
      lt = "exa -aTF --color=always --group-directories-first";

      # Verbosity and settings that you pretty much just always are going to want.
      cp = "cp -iv";
      mkdir = "mkdir -pv";
      mv = "mv -iv";
      rm = "rm -Iv --preserve-root";
      diff = "diff --color=always";
      grep = "grep --color=always";
      bat = "bat -p";
    };
  };

}
