{...}:{
  imports = [
    #./amd-egpu.nix
    #./egpu-passthrough.nix
    ./hardware-configuration.nix
    ./openrazer.nix
    ./graphics.nix
    ./bluetooth.nix
    ./audio.nix
  ];
}
