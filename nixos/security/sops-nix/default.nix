{inputs, config, ...}:{

  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = "/etc/nixos/nixos/security/sops-nix/kerry/secrets.yaml";
    validateSopsFiles = false;

    age = {
      # this is expected to exist in the system
      keyFile = "/var/lib/sops-nix/keys.txt";
      # if not, then it will convert ssh private key to sops private key and store it in /var/lib/sops-nix/keys.txt
      #sshKeyPaths = [ "/etc/ssh/id_ed25519" ];
      #generateKey = true;
    };
  };
}
