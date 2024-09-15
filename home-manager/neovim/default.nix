{pkgs, ...}:{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile = {
    "nvim/" = {
      source = (pkgs.callPackage ./nvchad.nix{}).nvchad;
    };
  };

}
