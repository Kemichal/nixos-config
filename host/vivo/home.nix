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
    ];

    stateVersion = "24.05";
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
