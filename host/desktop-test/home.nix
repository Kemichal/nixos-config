{ self, pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../home/common.nix
    ../../home/desktop.nix
    ../../home/game.nix
    ../../home/vscode.nix
    ../../home/work.nix
  ];

  home = {
    packages = with pkgs; [
      discord
      ktorrent
      lazygit
      libreoffice-qt
      remmina
      synthesia
      # missing programs
      # pianoteq
      # proton-up
    ];

    stateVersion = "24.05";
  };
}
