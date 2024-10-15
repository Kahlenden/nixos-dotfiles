{inputs, pkgs, config, ...}:
{

  imports = [
    ./services.nix
  ];

  # Instead of requiring you to build Hyprland, they provide a Cachix cache that you can add to your Nix configuration.
  # https://wiki.hyprland.org/Nix/Cachix/
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  environment.sessionVariables = {
    # if cursor invisible
    WLR_NO_HARDWARE_CURSOR = "1";
    # hint electron to use wayland
    NIXOS_OZONE_WL = "1";
  };

  programs = {
    sway = {
      enable = true;
      extraPackages = with pkgs; [swaylock-effects swayidle];
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };

  /*  The below config configs the way apps interacting with each other:
  *   Screen Sharing, link opening, file opening, etc... */
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
