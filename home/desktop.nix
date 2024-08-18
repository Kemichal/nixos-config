{ self, pkgs, ... }: {

  home = {
    packages = with pkgs; [
      _1password-gui
      firefox
      libnotify
      obsidian
      okular
      spotify
      vlc
    ];
  };
}
