{...}:{

  imports = [
    ./sops-nix

    ./biometrics.nix
    ./boot.nix
    ./firewall.nix
    ./mullvad.nix
    ./polkit.nix
    ./ssh.nix
    ./sudo.nix
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
