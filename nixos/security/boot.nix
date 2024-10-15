{inputs, pkgs, lib, ...}: {

  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  # Lanzaboote currently replaces the systemd-boot module.
  boot = {
    # Bootloader.
    loader = {
      systemd-boot.enable = lib.mkForce false; # doesnt really matter since we use lanzaboote, but whatever
      efi.canTouchEfiVariables = true;
    };

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    # Set swappiness
    kernel.sysctl = { "vm.swappiness" = 2; };
    # Enable NTFS (windows filesystem)
    supportedFilesystems = [ "ntfs" ];
  };
}


# https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md

# sudo sbctl create-keys
