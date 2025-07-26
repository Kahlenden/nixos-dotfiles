{pkgs, ...}:{
  #################################################################################
  # This config is used for an external gpu.                                      #
  # Specifically, Radeon RX 5700 XT, in Razer Chroma X                            #
  # For now, the desktop environment (Gnome) is rendered by intergrated gpu       #
  # And for games on Steam, this is the only way i found working:                 #
  #   Go to Library -> choose the game -> Settings -> General -> Launch Options   #
  #   And use this: MESA_VK_DEVICE_SELECT=1002:731f! mangohud %command%           #
  #################################################################################

  # Load amdgpu kernel module
  boot = {
    # Ensure module for external graphics is loaded
    initrd.kernelModules = [ "amdgpu" ];
    kernelParams = [
      "amdgpu.pcie_gen_cap=0x40000"
    ];
  };

  # Need Bolt service for egpu (enable Thunderbolt port)
  services.hardware.bolt.enable = true;

  # Install GPU driver packages. Mesa for graphics, ROCM for computational
  hardware.graphics = {
    enable = true;
    package = pkgs.mesa;
    # if you also want 32-bit support (e.g for Steam)
    enable32Bit = true;
    package32 = pkgs.pkgsi686Linux.mesa;

    extraPackages = with pkgs; [
        amdvlk
        rocmPackages.clr.icd
        vpl-gpu-rt
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  # ROCM for computation. See more https://discourse.nixos.org/t/ollama-isnt-using-gpu-amd-rx-7900-xtx/59596
  hardware.amdgpu.opencl.enable = true;
  nixpkgs.config.rocmSupport = true;
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

/*
  # Set default graphics card for mutter
  # This doesn't work so well with an egpu, since the delay makes it looks glitchy.
  services.udev.extraRules = ''
    SUBSYSTEM=="drm", ENV{DEVTYPE}=="drm_minor", ENV{DEVNAME}=="/dev/dri/card[0-9]", SUBSYSTEMS=="pci", ATTRS{vendor}=="0x1002", ATTRS{device}=="0x731f", TAG+="mutter-device-preferred-primary"
  '';
*/
}
