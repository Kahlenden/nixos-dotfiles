{pkgs, ...}:{

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    qemu
    libvirt
    ebtables
    dnsmasq
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    virtiofsd
  ];

  # Enable virt manager, the gui for libvirtd
  programs.virt-manager.enable = true;

  # Manage the virtualisation services
  virtualisation = {
    spiceUSBRedirection.enable = true;

    # libvritd configuration
    libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };

      allowedBridges = [ "virbr0" ];
    };
  };

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
}
