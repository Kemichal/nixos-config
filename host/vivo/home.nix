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
  xdg.configFile."hypr/hyprland.conf".source = pkgs.substituteAll {
    src = ./files/hyprland.conf;
    pam_kwallet_init = "${pkgs.kdePackages.kwallet-pam}/libexec/pam_kwallet_init";
  };
  xdg.configFile."rofi/config.rasi".source = pkgs.substituteAll {
    src = ./files/rofi/config.rasi;
    kittyPath = "${pkgs.kitty}/bin/kitty";
    themesPath = "${pkgs.rofi-wayland}/share/rofi/themes";
  };

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
