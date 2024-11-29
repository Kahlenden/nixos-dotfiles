{pkgs, ...}:{
  hardware.cpu.x86.msr.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-compute-runtime
  ];
}
