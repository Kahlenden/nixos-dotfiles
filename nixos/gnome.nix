{inputs, pkgs, config, lib, ...}:{

  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.gnome.core-os-services.enable = true;

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
