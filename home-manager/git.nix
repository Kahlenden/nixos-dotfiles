{...}:{

  programs.git = {
    enable = true;
    userName  = "kahlenden";
    userEmail = "nhatkhanh2k5@gmail.com";
    
    extraConfig = {
      core.editor = "nvim";
      safe.directory = "/etc/nixos";
    };
  };

}