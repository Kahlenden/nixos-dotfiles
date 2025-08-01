{...}:{

  programs.git = {
    enable = true;
    userName  = "kerry";
    userEmail = "nhatkhanh2k5@gmail.com";

    extraConfig = {
      core.editor = "nvim";
      safe.directory = "/etc/nixos";
    };
  };
}
