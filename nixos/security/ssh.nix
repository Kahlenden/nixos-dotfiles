{config, ...}:{
  sops.secrets."sshKeys/hl_ed25519" = {
    format = "yaml";
    sopsFile = "/etc/nixos/nixos/security/sops-nix/kerry/secrets.yaml";
    owner = config.users.users.kerry.name;
    group = config.users.users.kerry.group;
    mode = "0600";
    path = "/home/${config.users.users.kerry.name}/.ssh/hl_ed25519";
  };

  sops.secrets."sshKeys/github_ed25519" = {
    format = "yaml";
    sopsFile = "/etc/nixos/nixos/security/sops-nix/kerry/secrets.yaml";
    owner = config.users.users.kerry.name;
    group = config.users.users.kerry.group;
    mode = "0600";
    path = "/home/${config.users.users.kerry.name}/.ssh/github_ed25519";
  };

  programs.ssh = {
    startAgent = true;
    extraConfig = ''
      Host hl-local
        Hostname 10.0.0.124
        Port 22
        User kahlenden
        ForwardAgent no
        IdentityFile ${config.sops.secrets."sshKeys/hl_ed25519".path}

      Host hl-remote
        Hostname comfybed.sytes.net
        Port 22
        User kahlenden
        ForwardAgent no
        IdentityFile ${config.sops.secrets."sshKeys/hl_ed25519".path}

      Host github.com
        Port 22
        User git
        ForwardAgent no
        IdentityFile ${config.sops.secrets."sshKeys/github_ed25519".path}
    '';
  };
}
