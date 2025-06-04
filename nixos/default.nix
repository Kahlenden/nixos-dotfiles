{ inputs, pkgs, ... }: {

  imports = [
    ./hardware
    ./packages
    ./security

    ./codium.nix
    ./gnome.nix
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

  services.syncthing = {
    enable = true;
    user = "kahlenden";
    group = "users";
    dataDir = "/home/kahlenden/Sync";
  };

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
