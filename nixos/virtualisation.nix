{ config, user, pkgs, ... }:{

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

  # enable virt manager, the gui for libvirtd
  programs.virt-manager.enable = true;

  # Manage the virtualisation services
  virtualisation = {

    # VMWare configuration
    vmware = {
      host.enable = true;
      guest.enable = true;
    };

    # libvritd configuration for virt manager
    libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };

      allowedBridges = [ "virbr0" ];
    };

    spiceUSBRedirection.enable = true;

    # Waydroid, to use android apps on Linux
    waydroid.enable = true;
  };

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
}
