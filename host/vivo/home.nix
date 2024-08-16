{ pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../home/common.nix
    ../../home/desktop.nix
    ../../home/vscode.nix
  ];

  home = {
    packages = with pkgs; [
      lazygit
      obsidian
      okular
      remmina
      spotify
      synthesia
      waybar
      kitty
      rofi-wayland
      networkmanagerapplet
    ];

    stateVersion = "24.05";
  };

  xdg.configFile."kitty/kitty.conf".source = ./files/kitty.conf;
  xdg.configFile."hypr/hyprland.conf".source = ./files/hyprland.conf;

  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        search = {
          default = "Kagi";
          engines = {
            "Kagi" = {
              urls = [{ template = "https://kagi.com/search?q={searchTerms}"; }];
              iconUpdateURL = "https://assets.kagi.com/v1/favicon-16x16.png";
            };
          };
        };
      };
    };
  };

}
