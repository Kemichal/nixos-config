{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, disko, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {

      test = nixpkgs.lib.nixosSystem {
        modules = [
          ./host/test/configuration.nix
          disko.nixosModules.disko
        ];
      };

      desktop-test = nixpkgs.lib.nixosSystem {
        modules = [
          ./host/desktop-test/configuration.nix
          { system.configurationRevision = if self ? rev then self.rev else "dirty"; }
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users.ra = import ./host/desktop-test/home.nix;
          }
        ];
      };

    };
  };
}
