{pkgs, ...}:{
  # Set fish to be default shell for every user
  users.defaultUserShell = pkgs.fish;

  # Aliases
  programs.fish = {
    enable = true;

    shellAliases = {
      update = "sudo sh -c 'nix flake update --flake git+file:///etc/nixos && nixos-rebuild switch'";
      rebuild = "sudo nixos-rebuild switch";
      clear-trash = "sudo nix-collect-garbage -d";
      xmrig = "sudo xmrig -c ~/config.json";
      ssh = "kitten ssh -t";
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
