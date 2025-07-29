{config, pkgs, ...}:{

  # Decrypt password to /run/secrets-for-users so it can be used to create the user
  sops.secrets."password" = {
    format = "yaml";
    sopsFile = "/etc/nixos/nixos/security/sops-nix/kahlenden/secrets.yaml";
    neededForUsers = true;
  };
  # Required for sops to set password during system activation
  users.mutableUsers = false;

  users = {
    users = {
      kahlenden = {
        isNormalUser = true;

        # Set default shell for user
        shell = pkgs.fish;
        # Set password here using sops
        hashedPasswordFile = config.sops.secrets."password".path;

        description = "Kahlenden";
        extraGroups = [ "networkmanager" "wheel" "video" "audio" "libvirtd" "openrazer" "wireshark" "syncthing" "docker"];
      };

    };
  };

}
