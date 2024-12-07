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
      update = "sudo bash -c 'nix flake update --flake git+file:///etc/nixos && nixos-rebuild switch'";
      rebuild = "sudo nixos-rebuild switch";
      clear-trash = "sudo nix-collect-garbage -d";
      xmrig = "sudo xmrig -c ~/config.json";
      ssh = "export TERM=xterm; ssh -t";
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
