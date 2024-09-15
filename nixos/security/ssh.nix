{config, ...}:{

  # Decrypt ssh keys from sops and put it to ~/.ssh
  sops.secrets = {
    "private-ssh/kahlenden" = {
      mode = "0400";
      path = "/home/kahlenden/.ssh/id_ed25519";
      owner = config.users.users.kahlenden.name;
      inherit (config.users.users.kahlenden) group;
    };

    "public-ssh/kahlenden" = {
      mode = "0444";
      path = "/home/kahlenden/.ssh/id_ed25519.pub";
      owner = config.users.users.kahlenden.name;
      inherit (config.users.users.kahlenden) group;
    };
  };

}
