let
  hasIPv6Internet = true;
  StateDirectory = "dnscrypt-proxy";
in
{
  systemd.services.dnscrypt-proxy2.serviceConfig.StateDirectory = StateDirectory;

  services.dnscrypt-proxy2 = {
    enable = true;
    # See https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml
    settings = {
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        cache_file = "/var/lib/${StateDirectory}/public-resolvers.md";
      };

      ipv6_servers = hasIPv6Internet;
      block_ipv6 = ! (hasIPv6Internet);

      require_dnssec = true;
      require_nolog = false;
      require_nofilter = true;

      server_names = [ "quad9-dnscrypt-ip4-nofilter-pri" "quad9-dnscrypt-ip6-nofilter-pri" "mullvad-doh" "libredns" ];
    };
  };
}
