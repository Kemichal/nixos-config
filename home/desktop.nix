{ self, pkgs, ... }: {

  home = {
    packages = with pkgs; [
      _1password-gui
      firefox
      obsidian
      okular
      spotify
      vlc
    ];
  };
}
