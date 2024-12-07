{pkgs, ...}:{

  #services.xserver = {
  #  videoDrivers = ["modesetting"];
  #};

  # If you start experiencing lag and FPS drops in games or programs like Blender on stable NixOS when using the Hyprland flake, it most likely is a mesa version mismatch between your system and Hyprland.
  # You can fix this issue by using mesa from Hyprland’s nixpkgs input:
  # https://wiki.hyprland.org/Nix/Hyprland-on-NixOS/
  hardware.graphics = {
    enable = true;

    package = pkgs.mesa.drivers;
    # if you also want 32-bit support (e.g for Steam)
    enable32Bit = true;
    package32 = pkgs.pkgsi686Linux.mesa.drivers;
    extraPackages = with pkgs; [vpl-gpu-rt];
  };

}
