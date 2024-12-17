{ inputs, pkgs, ... }: {

  imports = [
    ./desktop
    ./hardware
    ./packages
    ./programs
    ./security

    ./codium.nix
    ./locale.nix
    ./mimetypes.nix
    ./virtualisation.nix
    ./shell.nix
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

  # Use gnome
  gnome.enable = true;

  /*
    services.ollama = {
    enable = true;
    #acceleration = "rocm";
    };
  */

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
