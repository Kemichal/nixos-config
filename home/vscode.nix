{ pkgs, ... }:
{

  home.packages = with pkgs; [
    vscode
    nixpkgs-fmt
  ];

  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      oderwat.indent-rainbow
    ];
  };
}
