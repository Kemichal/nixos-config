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

  # Setup keyfile TODO
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "vivo";
  networking.networkmanager.enable = true; # TODO

  fonts.packages = with pkgs; [
    font-awesome # needed by waybar default config
  ];

  time.timeZone = "Europe/Stockholm";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  services.xserver.xkb.layout = "se";
  console.keyMap = "sv-latin1";

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  users.users.ra = {
    isNormalUser = true;
    initialPassword = "test";
    extraGroups = [
      "networkmanager" # TODO
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlK2Z+ccyaAZxTUFuY9sNm3V1T/CU9A5mdjvavH7WG4OemivCYbKYXwRB1MWIhh6QKHirC7lPI12zmQjpKJsj386M4iGeBQC3/l1l6ZTBMbzhMoc80sppExeSccssAT2nOjBdQlISaWqX37RR+ifwxw7DxbqoGd23TtOyNOY3kL2DnO5kEz2ZsLFBcorefL3L6/rre0cc5TRqtbHti8PnxYybEkr6w4IFM3YBZttQV5XiJR+6Gq2sc27J5i0p9bo2AYazM2kFaAa5DySUamLj/2yqlsYeYVRACTG2o1QndO73j2LT5EqLlxnaQLi1go4ZGph4yuWSKznxJ1OOSGj5Smw/tOkWUQDLTrfy3BZRAzxxhlbFJ7Q1+Qr20WSkMaUsNlXtcvE5yz34h68aXcJA0ue0r+uz6A7JPLZid/PwOT8EItFW3wSSr6wod35XXOA2dh3mOIlJMYSfaWXgfig9Ra0Z3PyAczaZgtoZ7RasAcOdg8A9Gque1BT5n7K6askU="
    ];
  };

  services.openssh.enable = true;
  services.tailscale.enable = true;

  programs.hyprland.enable = true;
  # Fixes electron in hyprland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.starship.enable = true;

  # plasma old
  #services.xserver.enable = true;
  #services.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;

  # plasma new
  services = {
    desktopManager.plasma6 = {
      enable = true;
    };
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  environment.systemPackages = with pkgs;
    [
      git
      htop
      vim
    ];

  programs.steam.enable = true;

  system.stateVersion = "23.05";
}
