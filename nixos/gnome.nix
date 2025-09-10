{pkgs, lib, ...}:{

  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  services.gnome.core-os-services.enable = true;
  services.gnome.gcr-ssh-agent.enable = lib.mkForce false;

  services.displayManager = {
    defaultSession = "gnome";
  };

  environment.systemPackages = with pkgs.gnomeExtensions; [
    dash-to-dock
    vitals
    blur-my-shell
    appindicator
    screen-rotate
  ];

  services = {
    power-profiles-daemon.enable = true;
  };

  # Enable dconf
  programs.dconf.enable = true;

  environment.gnome.excludePackages = with pkgs;[
    baobab
    epiphany
    gnome-text-editor
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-console
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-system-monitor
    gnome-weather
    gnome-connections
    simple-scan
    snapshot
    totem
    yelp
  ];
}
