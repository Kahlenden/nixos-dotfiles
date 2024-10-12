{ pkgs, ... }:{

  imports = [
    ./sops-nix

    ./lanzaboote.nix
    ./mullvad.nix
    ./network.nix
    ./polkit.nix
    ./ssh.nix
    ./wireshark.nix
  ];

  security = {
    sudo = {
      execWheelOnly = true;
      extraConfig = ''
        Defaults timestamp_timeout=30 # asks for password every 30 minutes
      '';
    };

    # Needed for gns3 to work, the wrapped executable will be located at
    # /run/wrappers/bin/ubridge
    wrappers.ubridge = {
      source = "${pkgs.ubridge}/bin/ubridge";
      capabilities = "cap_net_admin,cap_net_raw=ep";
      owner = "kahlenden";
      group = "users";
      permissions = "u+rx,g+x";
    };
  };

  nix.settings = {
    allowed-users = [ "@wheel" ];
    experimental-features = [ "nix-command" "flakes" ];
    sandbox = true;
  };

  services.rsyslogd.enable = true;

}
