{...}:{
  imports = [
    #./amd-egpu.nix
    #./egpu-passthrough.nix
    ./audio.nix
    ./biometrics.nix
    ./bluetooth.nix
    ./cpu.nix
    ./gpu.nix
    ./hardware-configuration.nix
    ./logind.nix
    ./network.nix
    ./xserver.nix
  ];
}
