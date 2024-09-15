{inputs, pkgs, lib, ...}: {

  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  # Lanzaboote currently replaces the systemd-boot module.
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };

}
# https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md

# sudo sbctl create-keys