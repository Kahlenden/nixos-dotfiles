{pkgs, ...}:{

  hardware.graphics = {
    enable = true;

    package = pkgs.mesa;
    # if you also want 32-bit support (e.g for Steam)
    enable32Bit = true;
    package32 = pkgs.pkgsi686Linux.mesa;
    extraPackages = with pkgs; [vpl-gpu-rt];
  };
}
