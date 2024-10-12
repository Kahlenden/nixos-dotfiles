{config, pkgs, ...}: {

  imports = [
    ./hyprland
    ./neovim
    ./ags

    ./codium.nix
    ./foot.nix
    ./git.nix
    ./theme.nix
    ./htop.nix
    ./kitty.nix
    ./librewolf.nix
    ./neofetch.nix
    ./prismlauncher.nix
    ./shell.nix
    ./starship.nix
    ./virt-manager.nix
  ];

  /* The home.stateVersion option does not have a default and must be set */
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  # Bluetooth media controls
  /*
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 28;
  };

*/

}
