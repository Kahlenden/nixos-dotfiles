{...}:{
  networking = {
    hostName = "Windows_11"; # Define your hostname.
    nameservers = [ "127.0.0.1" "::1" ];

    networkmanager = {
      dhcp = "internal";
      dns = "none";
      enable = true;

      ethernet.macAddress = "random";

      wifi = {
        scanRandMacAddress = true;
        macAddress = "random";
      };

      connectionConfig = {
        "ipv4.dhcp-send-hostname" = 0;
        "ipv6.dhcp-send-hostname" = 0;
      };
    };
  };
}
