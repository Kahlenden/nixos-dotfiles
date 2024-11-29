{config, ...}:{

  networking = {
    # tcpcrypt causes some issues for me when using outlook, so i stopped using it
    # specifically, it slows down connection considerably, which is a huge downside of tcpcrypt
    #tcpcrypt.enable = true;

    # host file to block fakenews, gambling and porn sites
    # list of (one of ["fakenews", "gambling", "porn", "social"] )
    stevenblack = {
      enable = true;
      block = ["fakenews" "gambling" "porn"];
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };

  };

  sops.secrets."wifi/Xanadu" = {};
  environment.etc."NetworkManager/system-connections/Xanadu.nmconnection".source = "${config.sops.secrets."wifi/Xanadu".path}";

}
