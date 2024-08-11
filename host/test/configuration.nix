{ pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "test";
  time.timeZone = "Europe/Stockholm";

  users.users.ra = {
    isNormalUser = true;
    initialPassword = "test";
    extraGroups = [
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlK2Z+ccyaAZxTUFuY9sNm3V1T/CU9A5mdjvavH7WG4OemivCYbKYXwRB1MWIhh6QKHirC7lPI12zmQjpKJsj386M4iGeBQC3/l1l6ZTBMbzhMoc80sppExeSccssAT2nOjBdQlISaWqX37RR+ifwxw7DxbqoGd23TtOyNOY3kL2DnO5kEz2ZsLFBcorefL3L6/rre0cc5TRqtbHti8PnxYybEkr6w4IFM3YBZttQV5XiJR+6Gq2sc27J5i0p9bo2AYazM2kFaAa5DySUamLj/2yqlsYeYVRACTG2o1QndO73j2LT5EqLlxnaQLi1go4ZGph4yuWSKznxJ1OOSGj5Smw/tOkWUQDLTrfy3BZRAzxxhlbFJ7Q1+Qr20WSkMaUsNlXtcvE5yz34h68aXcJA0ue0r+uz6A7JPLZid/PwOT8EItFW3wSSr6wod35XXOA2dh3mOIlJMYSfaWXgfig9Ra0Z3PyAczaZgtoZ7RasAcOdg8A9Gque1BT5n7K6askU="
    ];
  };

  services.openssh.enable = true;
  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    htop
  ];

  system.stateVersion = "24.05";
}
