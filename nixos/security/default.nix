{...}:{

  imports = [
    ./sops-nix

    ./biometrics.nix
    ./boot.nix
    ./mullvad.nix
    ./network.nix
    ./polkit.nix
    ./users.nix
    ./wireshark.nix
  ];

  nix.settings = {
    allowed-users = [ "@wheel" ];
    experimental-features = [ "nix-command" "flakes" ];
    sandbox = true;
  };

  services.rsyslogd.enable = true;

}
