{config, pkgs, ...}:{

  # Decrypt password to /run/secrets-for-users so it can be used to create the user
  sops.secrets."user-password/kahlenden".neededForUsers = true;
  # Required for sops to set password during system activation
  users.mutableUsers = false;

  users = {
    users = {
      kahlenden = {
        isNormalUser = true;

        # Set default shell for user
        shell = pkgs.fish;
        # Set password here using sops
        hashedPasswordFile = config.sops.secrets."user-password/kahlenden".path;

        description = "Kahlenden";
        extraGroups = [ "networkmanager" "wheel" "video" "audio" "libvirtd" "openrazer" "wireshark" "syncthing" "docker"];
      };

    };
  };

}
