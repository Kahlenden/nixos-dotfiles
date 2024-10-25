{config, pkgs, ...}: {

  sops.secrets."monero-wallet" = {
    owner = config.users.users.kahlenden.name;
    inherit (config.users.users.kahlenden) group;
  };

  # Set fish to be default shell for every user
  users.defaultUserShell = pkgs.fish;

  # Aliases
  programs.fish = {
    enable = true;

    shellAliases = {
      pkgs = "sudoedit /etc/nixos/nixos/packages/default.nix";
      update = "sudo bash -c 'nix flake update --flake git+file:///etc/nixos && nixos-rebuild switch && cp /etc/nixos/flake.lock /etc/nixos/flake.lock.bak.d/$(date +'%b%d-%H:%M')-flake.lock'";
      rebuild = "sudo nixos-rebuild switch";
      flake-backup = "sudo cp /etc/nixos/flake.lock /etc/nixos/flake.lock.bak.d/$(date +'%b%d-%H:%M')-flake.lock";
      clear-trash = "sudo nix-collect-garbage -d";
      monerods = "monerod --zmq-pub tcp://127.0.0.1:18083 --out-peers 64 --in-peers 32 --add-priority-node=p2pmd.xmrvsbeast.com:18080 --add-priority-node=nodes.hashvault.pro:18080 --disable-dns-checkpoints --enable-dns-blocklist --prune-blockchain";
      p2ps = "p2pool --host 127.0.0.1 --wallet $(cat ${config.sops.secrets."monero-wallet".path}) --mini";
      xmrig = "sudo xmrig -c ~/config.json";
    };
  };

  # fish plugins
  environment.systemPackages = with pkgs; [
    fishPlugins.done
    fishPlugins.fzf-fish fzf
    fishPlugins.forgit
    fishPlugins.hydro
    fishPlugins.grc grc
    fishPlugins.autopair
  ];

}
