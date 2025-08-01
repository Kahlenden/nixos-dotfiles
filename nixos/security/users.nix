{config, pkgs, ...}:{

  # Decrypt password to /run/secrets-for-users so it can be used to create the user
  sops.secrets."password" = {
    format = "yaml";
    sopsFile = "/etc/nixos/nixos/security/sops-nix/kerry/secrets.yaml";
    neededForUsers = true;
  };
  # Required for sops to set password during system activation
  users.mutableUsers = false;

  users = {
    groups = {
      kerry = {
        gid = 1000;
      };
    };
    users = {
      kerry = {
        uid = 1000;
        group = config.users.groups.kerry.name;
        isNormalUser = true;
        extraGroups = ["networkmanager" "wheel" "video" "audio" "libvirtd" "openrazer" "wireshark" "syncthing" "docker"];

        # Set default shell for user
        shell = pkgs.fish;
        # Set password here using sops
        hashedPasswordFile = config.sops.secrets."password".path;
      };
    };
  };
}
