{...}:{
  imports = [
    #./amd-egpu.nix
    #./egpu-passthrough.nix
    ./audio.nix
    ./bluetooth.nix
    ./cpu.nix
    ./graphics.nix
    ./hardware-configuration.nix
    ./network.nix
    ./openrazer.nix
    ./printing.nix
    ./xserver.nix
  ];
}
