{...}:{
  imports = [
    #./amd-egpu.nix
    #./egpu-passthrough.nix
    ./audio.nix
    ./bluetooth.nix
    ./graphics.nix
    ./hardware-configuration.nix
    ./network.nix
    ./openrazer.nix
    ./xserver.nix
    ./cpu.nix
  ];
}
