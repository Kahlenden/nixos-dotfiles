{...}:{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  # avahi for local dns, autodiscovery printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
