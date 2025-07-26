{inputs, lib, ...}: {

  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  # Lanzaboote currently replaces the systemd-boot module.
  boot = {
    # Bootloader.
    loader = {
      systemd-boot.enable = lib.mkForce false; # doesnt really matter since we use lanzaboote, but whatever
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };

    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    # Set swappiness
    kernel.sysctl = { "vm.swappiness" = 60; };
    # Enable NTFS (windows filesystem)
    supportedFilesystems = [ "ntfs" ];
  };
}


# https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md

# sudo sbctl create-keys
