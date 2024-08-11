{
  description = "NixOS configuration";
  inputs = {
    nixpkg.url = "github:nixos/nixpkgs/nixos-24.05";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
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
