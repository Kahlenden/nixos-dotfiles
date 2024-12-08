{pkgs, ...}:{

  networking = {
    wireguard.enable = true;
    iproute2.enable = true;
  };

  services = {
    resolved.enable = true;

    mullvad-vpn = {
      enable = true;
      # Set to true if need split tunneling
      enableExcludeWrapper = true;
      # use the gui
      package = pkgs.mullvad-vpn;
    };
  };

}
