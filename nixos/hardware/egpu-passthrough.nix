  ##############
  # NOT IN USE #
  ##############
# Adapted from https://astrid.tech/2022/09/22/0/nixos-gpu-vfio/
let
  # Run lspci -nn | grep -ie 'nvidia\|amd' to get the PCI ID
  gpuIDs = [
    "1002:731f" # Graphics
    "1002:731f" # Audio
  ];
in
{lib, ...}:{
  specialisation."VFIO".configuration = {
    system.nixos.tags = [ "with-vfio" ];
    boot = {
      initrd.kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
      ];

      kernelParams = [
        # enable IOMMU
        "intel_iommu=on"
        ("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs)
      ];
    };
  };
}
