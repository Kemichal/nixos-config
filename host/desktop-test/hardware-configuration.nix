{ inputs, disko, config, lib, pkgs, modulesPath, ... }: {

  imports = [
    #inputs.disko.nixosModules.disko
    #(modulesPath + "/profiles/qemu-guest.nix")
    (import ./disks.nix)
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ohci_pci" "ehci_pci" "virtio_pci" "ahci" "usbhid" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/home/ra/nixos-config" = {
    device = "Public-ra";
    fsType = "9p";
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  #nixpkgs.hostPlatform = "x86_64-linux";
}
