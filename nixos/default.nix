{inputs, ...}:{

  imports = [
    ./hardware
    ./packages
    ./security
    ./services

    ./gnome.nix
    ./locale.nix
    ./mimetypes.nix
    ./shell.nix
  ];

  system.stateVersion = "24.05";

  # nixpkgs overlays
  nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
