{...}:{
  dconf.settings = {
    # Background on desktop
    "org/gnome/desktop/background" = let
      bg = ./backgrounds/Exusiai.jpg; # nix will generate an absolute path to /nix/store/
    in {
      picture-uri = "file://${bg}";
      picture-uri-dark = "file://${bg}";
    };

    # Background on screensaver
    "org/gnome/desktop/screensaver" = let
      bg = ./backgrounds/Exusiai.jpg; # nix will generate an absolute path to /nix/store/
    in {
      picture-uri = "file://${bg}";
    };
  };
}
