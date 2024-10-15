{ inputs, pkgs, ... }: {

  imports = [
    ./desktop
    ./hardware
    ./packages
    ./programs
    ./security

    ./locale.nix
    ./mimetypes.nix
    ./virtualisation.nix
  ];

  system.stateVersion = "24.05";

  # Don’t suspend when close lid and plugged in or docked
  services.logind.extraConfig = ''
    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=ignore
    HandleLidSwitchDocked=ignore
  '';

  # nixpkgs overlays
  nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  /*
    services.ollama = {
    enable = true;
    #acceleration = "rocm";
    };
  */

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
