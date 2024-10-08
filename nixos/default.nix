{ inputs, pkgs, ... }: {

  imports = [
    ./hardware
    ./hyprland
    ./packages
    ./sddm
    ./security

    ./codium.nix
    ./locale.nix
    ./mimetypes.nix
    ./shell.nix
    ./users.nix
    ./virtualisation.nix
  ];

  system.stateVersion = "24.05";

  # Don’t suspend when close lid and plugged in or docked
  services.logind.extraConfig = ''
    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=ignore
    HandleLidSwitchDocked=ignore
  '';

  nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

  #boot.kernelParams = [ "i915.force_probe=46a6" ];
  boot = {
    # Set swappiness
    kernel.sysctl = { "vm.swappiness" = 2; };
    # Enable NTFS (windows disk partition)
    supportedFilesystems = [ "ntfs" ];

    # Bootloader.
    loader = {
      systemd-boot.enable = true; # doesnt really matter since we use lanzaboote, but whatever
      efi.canTouchEfiVariables = true;
    };
  };

  networking.hostName = "Windows_11"; # Define your hostname.

  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  # NetworkManager
  programs.nm-applet = {
    enable = true;
    indicator = true;
  };

  # Xserver config
  services = {
    xserver = {
      enable = true;
      logFile = "/var/log/xorg.log";
    };
    libinput.touchpad = {
      #enable = true;
      tapping = true;
      naturalScrolling = true;
      clickMethod = "clickfinger";
      disableWhileTyping = true;
      tappingDragLock = true;
      tappingButtonMap = "lrm";
      sendEventsMode = "disabled-on-external-mouse";
      scrollMethod = "twofinger";
    };
  };

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

  # Auto system update
  system.autoUpgrade = {
    enable = true;
  };

  #fonts packages
  fonts.packages = with pkgs; [ nerdfonts font-awesome ucs-fonts freefont_ttf ];

  /*
    # Static ip address
    networking.interfaces.eth0.ipv4.addresses = [ {
    address = "10.0.0.37";
    prefixLength = 24;
    } ];
  */

}
