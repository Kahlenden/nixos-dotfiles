{...}:
{
    #set some shit up
  dconf.settings = {
    # ...
    "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "caffeine@patapon.info"
        "dash-to-dock@micxgx.gmail.com"
#        "openweather-extension@jenslody.de"
#        "Hide_Activities@shay.shayel.org"
#        "tiling-assistant@leleat-on-github"
        "Vitals@CoreCoding.com"
#        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "hibernate-status@dromi"
        "fullscreen-avoider@noobsai.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "pop-shell@system76.com"
        "clipboard-indicator@tudmotu.com"
        "hanabi-extension@jeffshee.github.io"
#	"logomenu@aryan_k"
      ];
      favorite-apps = [
        "org.gnome.Settings.desktop"
        "org.gnome.Nautilus.desktop"
        "org.qbittorrent.qBittorrent.desktop"
        "signal-desktop.desktop"
        "discord.desktop"
        "virt-manager.desktop"
        "virtualbox.desktop"
        "librewolf.desktop"
        "mullvadbrowser.desktop"
        "freetube.desktop"
        "io.bassi.Amberol.desktop"
        "net.lutris.Lutris.desktop"
        "org.prismlauncher.PrismLauncher.desktop"
        "mullvad-vpn.desktop"
      ];
    };

    "org/gtk/Settings/Debug" = {
      enable-inspector-keybinding = true;
    };

    #configuring extensions uses dconf dump "/below"
    "org/gnome/shell/etensions/appindicator" = {
        tray-pos = "left";
    };
#    "org/gnome/shell/etensions/Logo-menu" = {
#      hide-forcequit = false;
#      hide-icon-shadow = false;
#      menu-button-icon-image = 23;
#      menu-button-icon-size = 26;
#      show-activities-button = false;
#      show-power-options = false;
#      symbolic-icon = true;
#    };
    "org/gnome/shell/etensions/blur-my-shell" = {
      brightness = 1.0;
      sigma = 3;
    };
    "org/gnome/shell/etensions/blur-my-shell/applications" = {
      blacklist = ["Plank"
                   "Mullvad Browser"
		  "librewolf"
		  "FreeTube"
		  "Virt-manager"
		  ];
      blur = true;
      blur-on-overview = true;
      enable-all = true;
      opacity = 195;
    };
    "org/gnome/shell/etensions/blur-my-shell/panel" = {
      blur = false;
      customize = false;
      static-blur = false;
    };
    "org/gnome/shell/etensions/caffeine" = {
      duration-timer = 4;
      indicator-position-max = 1;
      toggle-state = false;
    };
    "org/gnome/shell/etensions/dash-to-dock" = {
      apply-custom-theme = false;
      background-opacity = 0.0;
      custom-background-color = false;
      custom-theme-shrink = true;
      dash-max-icon-size = 43;
      dock-fixed = true;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      multi-monitor = true;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "eDP-1";
      show-mounts = false;
      show-mounts-only-mounted = true;
      show-trash = false;
      transparency-mode = "FIXED";
    };
#    "org/gnome/shell/etensions/openweather" = {
#      city = "51.0456064,-114.057541>Calgary, Alberta, Canada>0";
#      position-in-panel = "left";
#      pressure-unit = "psi";
#    };
#    "org/gnome/shell/etensions/tiling-assistant" = {
#      active-window-hint-color = "rgb(0,255,255)";
#    };
    "org/gnome/shell/etensions/vitals" = {
      fixed-widths = false;
      hide-icons = false;
      hide-zeros = false;
      hot-sensors = [
        "_temperature_acpi_thermal zone_"
        "_memory_allocated_"
        "_processor_usage_"
        "_storage_used_"
        "_network-rx_wlo1_rx_"
        "_network-tx_wlo1_tx_"
      ];
      include-static-info = true;
      show-battery = false;
      show-fan = false;
      show-storage = true;
      show-system = false;
      show-voltage = false;
      update-time = 1;
      use-higher-precision = false;
    };
    "org/gnome/shell/extensions/pop-shell" = {
      active-hint = true;
      active-hint-border-radius = 13;#uint32 13;
      hint-color-rgba = "rgba(166,209,137,1)";
      gap-inner = 1;# uint32 4;
      gap-outer = 1;# uint32 2;
      show-title = true;
      smart-gaps = true;
      snap-to-grid = true;
      tile-by-default = true;

     # Shortcuts
     tile-enter = [""];

     focus-left = [""];
     focus-right = [""];
     focus-up = [""];
     focus-down = [""];

     tile-move-left = [""];
     tile-move-right = [""];
     tile-move-up = [""];
     tile-move-down = [""];

     tile-swap-left = [""];
     tile-swap-right = [""];
     tile-swap-up = [""];
     tile-swap-down = [""];

     tile-resize-left = [""];
     tile-resize-right = [""];
     tile-resize-up = [""];
     tile-resize-down = [""];
    };
    "io/github/jeffshee/hanabi-extension" = {
      content-fit = 1;
      debug-mode = false;
      enable-nvsl = false;
      enable-va = true;
      force-gtk4paintablesink = false;
      force-mediafile = false;
      mute = true;
      show-panel-menu = true;
      startup-delay = 1000;
      video-path = "/etc/nixos/gnome/hanabi/background.mp4";
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "myCustomTheme";
    };
    "org/gnome/shell/extensions/clipboard-indicator" = {
      enable-keybindings = false;
      history-size = 20;
      notify-on-copy = false;
    };

    # Shortcuts customs
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
      home = ["<Super>e"];
      #screensaver = ["<Control><Alt>l"];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Control><Alt>t";
      command = "kitty";
      name = "terminal";
    };

    # Disable touchpad when plug mouse in
    "org/gnome/desktop/peripherals/touchpad" = {
      send-events = "disabled-on-external-mouse";
      two-finger-scrolling-enabled = true;
    };
  };
}
