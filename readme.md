# [Nixos](https://nixos.org/)
+ Nix took a unique approach to package management and system configuration.
+ With Nixos, you can create systems that are:
  * Reproducible: Create multiple systems from a config
  * Declarative: Yes
  * Reliable: Every systems created is the same every time
## Great links to start your nixos journey:
  + Nixos package search: https://search.nixos.org/packages
  + Nixos options search: https://search.nixos.org/options
  + Nixos flake tutorial: https://wiki.nixos.org/wiki/Flakes
  + Nixos home-manager tutorial: https://wiki.nixos.org/wiki/Home_Manager
  + Home manager configuration options: https://nix-community.github.io/home-manager/options.xhtml
## How to install nixos and use my configuration?
### 1. Burn a Nixos Linux ISO into a usb and boot into it
  + Nixos ISO download: https://nixos.org/download/
  + Recommended tool to create a bootable usb: [Ventoy](https://github.com/ventoy/Ventoy)
  + I **DO NOT** recommend balenaEtcher, read more [here](https://github.com/balena-io/etcher/issues/2977)
  + Boot into the bootable usb. This step dpends on your computer's firmware. Refer to your own BIOS's setting.
### 2. Know the disk you want to install nixos on
  + Open a terminal and type:
    ```shell
    # List all block devices on machine
      lsblk
    ```
  + If your disk is a sata hdd/ssd, find the disk with the name that starts with `sd`, eg. `sda`
  + If it is a nvme ssd, look for `nvmeXnX`, eg. `nvme0n1`
  + **I will assume that your disk is a nvme ssd drive, with the name `nvme0n1` in the whole tutorial. Replace it with your actual disk name**
### 3. Partitioning the drive
  ```shell
  cgdisk /dev/nvme0n1
  ```
  + Press D to delete. You need to delete all patitions on the disk.
  + Choose New to create new partition. This is our boot partition
    * First sector: just press enter to accept the default
    * Size: 512MiB
    * Type: ef00
  + Choose New to create another partition. This is our root partition.
  + We are going to encrypt this whole partition. This encrypted partition also have your swap partition, so that you can have encrypted swap when hibernating.
    * First sector: just press enter to accept the default
    * Size: press enter to accept the default (the rest of the disk)
    * Type: press enter to accept default (8300)
  + Choose Write to write to disk. This is irreversible, so make sure that your patition looks right. It should look like this:
    * 1000 KiB Free space (this is the default behavior when partitioning. There is some padding at the start and end of the drive)
    * 512.0 MiB EFI system partition boot
    * \<the rest of your disk\> Linux filesystem  root
    * 1000 KiB Free space
### 4. Set up full disk encryption
  + `lsblk` to confirm your disk again
  + If you followed the guide, your root partition should be `nvme0n1p2`
    #### Setup the encrypted LUKS partition and open it:
    ```shell
    # Format nvme0n1p2 to LUKS partition
    cryptsetup luksFormat /dev/nvme0n1p2
    # Open the LUKS partition, with the name "enc-pv"
    cryptsetup luksOpen /dev/nvme0n1p2 enc-pv
    ```
    #### Create two logical volumes, swap parition and the rest will be root filesystem
    * I recommend setting swap partition space the same as your memory if you use hibernation. I have 32 GB of memory, so my swap is 32G.
    ```shell
    # Create physical volume
    pvcreate /dev/mapper/enc-pv
    # Create volume group "vg"
    vgcreate vg /dev/mapper/enc-pv
    # Create logical volume "swap" from volume group "vg"
    # Change -L 32G to your actual memory. I have 32 GB of memory, so my swap is 32G
    lvcreate -L 32G -n swap vg
    # Create logical volume "root" with the remaining space from volume group "vg"
    lvcreate -l '100%FREE' -n root vg
    ```
    #### Format partitions
      ```shell
      # Format our boot partition to fat
      mkfs.fat /dev/nvme0n1p1
      # Root partition is ext4
      mkfs.ext4 -L root /dev/vg/root
      # Swap partition is swap (thanks captain obvious)
      mkswap -L swap /dev/vg/swap
      ```
### 5. Installing Nixos
  + Mount the partitions we just created under `/mnt` so we can install NixOS on them
    ```shell
    # Mount root
    mount /dev/vg/root /mnt
    # Mount boot to /mnt/boot
    mkdir /mnt/boot
    mount /dev/nvme0n1p1 /mnt/boot -o umask=0777
    # Swap on
    swapon /dev/vg/swap
    ```
  + Generate a nixos config
    ```shell
    nixos-generate-config --root /mnt
    ```
  + Config initrd to open our LUKS encrypted partition
    * Copy your block UUID (you will need it later)
      ```shell
      sudo blkid /dev/nvme0n1p2
      /dev/nvme0n1p2: UUID="3ce22a48-a4a3-4a61-950d-56d2a8df2f18" TYPE="crypto_LUKS" PARTLABEL="root" PARTUUID="8c7cae8d-a9e8-4c98-afd8-c079cdc033a5"
      ```
    * Edit your `hardware-configuration.nix`
      ```shell
      vi /mnt/etc/nixos/hardware-configuration.nix
      ```
    * Add this to your `hardware-configuration.nix`. Replace after `/by-uuid/` with your actual root block UUID
      ```nix
      boot.initrd.luks.devices.root = {
        device = "/dev/disk/by-uuid/3ce22a48-a4a3-4a61-950d-56d2a8df2f18";
        preLVM = true;
        allowDiscards = true;
      };
      ```
    * Check your boot partition in the same configuration file. Make sure you have `umask=0777`. See more [here](https://discourse.nixos.org/t/nixos-install-with-custom-flake-results-in-boot-being-world-accessible/34555)
      ```nix
      fileSystems."/boot" = {
        #...
        options = ["umask=0777"];
      };
      ```
    * Install Nixos:
      ```shell
      nixos-install
      ```
### 6. Optional: Use my configuration (don't, just don't)
  + Get the configuration:
    ```shell
    # Clone my repo
    git clone https://github.com/Kahlenden/nixos-dotfiles.git
    # Move all into your nixos config(because your /mnt/etc/nixos is not empty, can't git clone directly into it)
    cd nixos-dotfile
    mv ./* /mnt/etc/nixos/
    # Use your generated hardware-configuration.nix
    cd /mnt/etc/nixos/
    mv ./hardware-configuration.nix ./nixos/hardware/hardware-configuration.nix
    ```
  + Misc: you might want to set the password manually, temporarily. I use sops-nix to store my secrets. Unless you have my private key, which is questionable, all user's password is empty and you can't log in.
    ```nix
    # /etc/nixos/nixos/users.nix
    {config, ...}:{

      # Decrypt password to /run/secrets-for-users so it can be used to create the user
      sops.secrets."user-password/kahlenden".neededForUsers = true;

      users.mutableUsers = true; # Set this to true so nix won't care if you change password manually


      # Define a user account. Don't forget to set a password with ‘passwd’.
      users = {
        #groups.tcpcryptd = {};
        users = {
          #tcpcryptd.group = "tcpcryptd";
          kahlenden = {
            isNormalUser = true;

            # Set default shell for user
            shell = pkgs.fish;
            # Set password
            # This is NOT secure at all.
            passwd = "your-password-here-in-clear-text";

            description = "Kahlenden";
            extraGroups = [ "networkmanager" "wheel" "video" "audio" "libvirtd" "openrazer" ];
          };

        };
      };

    }
    ```
  + Install Nixos
    ```shell
    # Install nixos
    nixos-install --flake .#Windows11
    ```
## Credits

  + [Aylur](https://github.com/Aylur): I [stole](https://github.com/Kahlenden/nixos-dotfiles/blob/master/home-manager/ags/default.nix) his [ags configuration](https://github.com/Aylur/dotfiles/tree/main/ags)
  + [Nixos](https://github.com/NixOS)
  + [Lanzaboote](https://github.com/nix-community/lanzaboote): secure boot for Nixos
  + [Sops-nix](https://github.com/Mic92/sops-nix): Secret storing based on Sops
