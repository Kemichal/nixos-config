{ pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  home = {
    packages = with pkgs; [
      _1password-gui
      discord
      firefox
      htop
      ktorrent
      lazygit
      libreoffice-qt
      nixpkgs-fmt
      obsidian
      okular
      remmina
      slack
      spotify
      synthesia
      #teams
      vlc
      vscode
      # missing programs
      # pianoteq
      # proton-up
    ];

    sessionVariables = {
      EDITOR = "vim";
    };

    shellAliases = {
      lg = "lazygit";
    };

    stateVersion = "24.05";
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      oderwat.indent-rainbow
    ];
  };

  programs.bash.enable = true;
}
