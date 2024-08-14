{ pkgs, ... }:
{

  home.packages = with pkgs; [
    vscode
    nixpkgs-fmt
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      oderwat.indent-rainbow
    ];
  };
}
