{pkgs, ...}:{

  services.flatpak.enable = false;

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      #"electron-19.1.9"
    ];
  };

  #fonts packages
  fonts.packages = with pkgs; [
    #nerdfonts #
    nerd-fonts.jetbrains-mono
    font-awesome
    ucs-fonts
    freefont_ttf
  ];

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    # Coding
    python3
    nixpkgs-fmt
    texliveFull # Latex...

    # Terminal utils
    coreutils findutils pciutils inetutils usbutils glxinfo
    htop neofetch # desktop info
    curl wget
    neovim # text editor
    jq crudini
    nmap dig
    unar gzip
    tree
    ascii
    imagemagick
    git
    john hashcat wordlists # Hash crack
    waypipe
    xmrig # monero miner

    # boot stuffs
    gptfdisk
    cryptsetup
    efibootmgr
    sbctl

    # Necessities
    libreoffice # Office Suite
    keepassxc # Password manager
    czkawka # file duplication romover
    polkit_gnome # Graphical sudo
    sops # handing secrets
    yt-dlp
    obsidian # markdown editor
    openvpn
    yubioath-flutter
    calibre # E-book reader
    remmina # rdp client
    piper
    protontricks
    mangohud

    # Browsers
    brave ungoogled-chromium
    librewolf

    # Apps
    prismlauncher
    vesktop
    signal-desktop
    teams-for-linux

    # Useful gnome apps
    gnome-calculator
    gnome-bluetooth
    gnome-disk-utility
    gnome-decoder
    gnome-calendar
    gnome-tweaks
    nautilus

    # Music
    youtube-music

    # Media related
    loupe gimp
    vlc obs-studio shotcut
  ];
}
