{ config, lib, pkgs, ...}:

{
  imports = [
  #./gdm_bg
  ];
  # Import home manager module
  home-manager.users.kahlenden = import ./gnome-dot.nix;
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

   #Debloat gnome
  environment.gnome.excludePackages = (with pkgs; [
#    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
#    gnome-terminal
#    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
#    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    yelp #helps
    gnome-maps #map
    gnome-weather #weather
    gnome-terminal #terminal
  ]);

  environment.systemPackages = with pkgs; [
  #(callPackage ./hanabi{}).hanabi
  #(callPackage ./gnome-theme/myCustomTheme.nix{}).myCustomTheme
#  gnomeExtensions.logo-menu
#  gnome.gnome-software
  #catppuccin-cursors.latteYellow
  gnomeExtensions.dash-to-dock
#  gnome-extension-manager
  gnome.gnome-tweaks
  gnomeExtensions.appindicator
#  gnomeExtensions.impatience
  gnomeExtensions.vitals
#  gnomeExtensions.openweather
#  gnomeExtensions.tiling-assistant
  gnomeExtensions.blur-my-shell
#  gnomeExtensions.hibernate-status-button
  gnomeExtensions.caffeine
  gnomeExtensions.pop-shell
  gnomeExtensions.custom-hot-corners-extended
#  gnomeExtensions.just-perfection
  gnomeExtensions.clipboard-indicator
#  gnomeExtensions.media-controls
#  gnomeExtensions.removable-drive-menu
#  gnomeExtensions.hide-activities-button
  gnomeExtensions.fullscreen-avoider
  ];
}

