{config, inputs, pkgs, ...}:

let
  # background images
  bg = ./backgrounds/bg1.jpg;

  startUpScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ags -b hypr &
    swww clear-cache
    swww-daemon &
    swww img -t center --transition-fps 60 --transition-duration 1 ${bg} &
    mullvad-vpn &
  '';
  startOnSpecialWorkspace = pkgs.pkgs.writeShellScriptBin "start" ''
    youtube-music &
  '';
  lockscreen = pkgs.pkgs.writeShellScriptBin "lockscreen" ''
    swaylock --screenshots --indicator --clock \
    --inside-wrong-color f38ba8  \
    --ring-wrong-color 11111b  \
    --inside-clear-color a6e3a1 \
    --ring-clear-color 11111b \
    --inside-ver-color 89b4fa \
    --ring-ver-color 11111b \
    --text-color  f5c2e7 \
    --indicator-radius 80 \
    --indicator-thickness 5 \
    --effect-blur 10x7 \
    --effect-vignette 0.2:0.2 \
    --ring-color 11111b \
    --key-hl-color f5c2e7 \
    --line-color 313244 \
    --inside-color 0011111b \
    --separator-color 00000000 \
    --fade-in 0.1 &
  '';

  playerctl = "${pkgs.playerctl}/bin/playerctl";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  pactl = "${pkgs.pulseaudio}/bin/pactl";
in
{
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    plugins = [
      inputs.hyprgrass.packages.${pkgs.system}.default
      inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];

    settings = {
      exec-once = ''${startUpScript}/bin/start'';
      exec = "pkill swayidle; swayidle -w timeout 600 '${lockscreen}/bin/lockscreen' timeout 601 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep '${lockscreen}/bin/lockscreen'";

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        gaps_in = 5;
        gaps_out = 14;
        border_size = 0;
        "col.active_border" = "rgba(#426ede)";
        "col.inactive_border" = "rgba(#282828)";
        layout = "dwindle";
        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        rounding = 0;
        drop_shadow = "yes";
        shadow_range = 1;
        shadow_render_power = 1;
        shadow_offset = "5 5";
        "col.shadow" = "rgba(1a1a1aee)";

        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          new_optimizations = "on";
          noise = 0.05;
          contrast = 0.9;
          brightness = 0.8;
        };
      };

      animations = {
        enabled = "yes";
        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "in-out,.65,-0.01,0,.95"
        ];
        animation = [
          #"windows, 1, 7, myBezier"
          #"windowsOut, 1, 7, default, popin 80%"
          "windows, 1, 5, in-out, slide"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      windowrule = [
        "float,title:^(Amberol)$"
        "size 420 720,title:^(Amberol)$"
        "move center center,title:^(Amberol)$"
        "pin, title:^(Picture in picture)$"
        "float, title:^(.*)(Oracle VM VirtualBox)(.*)$"
      ];

      windowrulev2 = [
        "opacity 0.0 override, class:^(xwaylandvideobridge)$"
        "noanim, class:^(xwaylandvideobridge)$"
        "noinitialfocus, class:^(xwaylandvideobridge)$"
        "maxsize 1 1, class:^(xwaylandvideobridge)$"
        "noblur, class:^(xwaylandvideobridge)$"
      ];
      
      workspace = [
        "special:magic, on-created-empty: ${startOnSpecialWorkspace}/bin/start"
      ]; 

      master = {
        no_gaps_when_only = "yes";
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "yes"; # you probably want this
        no_gaps_when_only = "yes";
      }; 

      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = "yes";
        workspace_swipe_fingers = 3;
        workspace_swipe_cancel_ratio = 0.15;
      };

      misc = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        force_default_wallpaper = -1; # Set to 0 to disable the anime mascot wallpapers
      };

    # Example per-device config
    # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
#      "device:epic-mouse-v1" = {
#        sensitivity = -0.5;
#      };

      input = {
        kb_layout = "us";
#        kb_variant =
#        kb_model =
#        kb_options =
#        kb_rules =
        follow_mouse = 1;
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = "no";
          disable_while_typing = true;
        };
      };

      "plugin:touch_gestures" = {
      # The default sensitivity is probably too low on tablet screens,
      # I recommend turning it up to 4.0
        sensitivity = 3.0;

      # must be >= 3
        #workspace_swipe_fingers = 3;

      # switching workspaces by swiping from an edge, this is separate from workspace_swipe_fingers
      # and can be used at the same time
      # possible values: l, r, u, or d
      # to disable it set it to anything else
        #workspace_swipe_edge = ["l" "r"];

      # in milliseconds
        long_press_delay = 400;
      };
      "plugin:split-monitor-workspaces" = {
        count = 5;
        enable_persistent_workspaces = 1;
      };

      monitor = "eDP-1, 1920x1080@60.16400, 0x0, 1";

      "$mod"            = "SUPER";
      "$mod2"           = "ControlAlt";

      "$menu"           = "ags -b hypr -t launcher";
      "$powermenu"      = "ags -b hypr -t powermenu";
      "$terminal"       = "kitty";
      "$screenShot"     = ''grim -g "$(slurp)" - | wl-copy && notify-send "Screenshot copied to clipboard" -a "ss"'';
      "$fileManager"    = "nautilus";
      "$code"           = "codium";
      "$browser"        = "mullvad-browser";

      binds = {
        allow_workspace_cycles = true;
      };

      bindle =  [
        ",XF86MonBrightnessUp,   exec, ${brightnessctl} set +5%"
        ",XF86MonBrightnessDown, exec, ${brightnessctl} set  5%-"
        ",XF86KbdBrightnessUp,   exec, ${brightnessctl} -d asus::kbd_backlight set +1"
        ",XF86KbdBrightnessDown, exec, ${brightnessctl} -d asus::kbd_backlight set  1-"
        ",XF86AudioRaiseVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioLowerVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
      ];

      bindl = [
        ",XF86AudioPlay,    exec, playerctl play-pause"
        ",XF86AudioPrev,    exec, playerctl previous"
        ",XF86AudioNext,    exec, playerctl next"
        ",XF86AudioMicMute, exec, ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
        ", XF86AudioMute,   exec, ${pactl} set-sink-mute @DEFAULT_SINK@ toggle"
        ", XF86PowerOff,    exec, $powermenu"
        #",switch:off:Lid Switch,exec,${lockscreen}/bin/lockscreen"
        #",switch:off:Lid Switch,exec,hyprctl dispatch dpms off"
        #",switch:on:Lid Switch,exec,hyprctl dispatch dpms on"
      ];

      bind = [
        "Alt, F4, killactive,"
        "$mod, F, fullscreen"
        "Alt, P,  pin"
        "$mod, P, pseudo," # dwindle
        "$mod, J, togglesplit," # dwindle
        "$mod, V,           togglefloating,"
        "Control Shift, Escape, exit"

        "$mod, E,           exec, $fileManager"
        "SUPER_L, SUPER_L,  exec, $menu"
        ",Print,            exec, $screenShot"
        "$mod2, T,          exec, $terminal"
        "$mod, C,           exec, $code"
        "$mod, B,           exec, $browser"
        "$mod, L,           exec, ${lockscreen}/bin/lockscreen"
        "Control Shift, R,  exec, ags -b hypr quit; ags -b hypr"  

        # change direction of monitor 
        "ALT, up, exec,    hyprctl --batch 'keyword monitor eDP-1,preferred,auto,1,transform,0 ; keyword input:touchdevice:transform 0'"
        "ALT, right, exec, hyprctl --batch 'keyword monitor eDP-1,preferred,auto,1,transform,3 ; keyword input:touchdevice:transform 3'"
        "ALT, down, exec,  hyprctl --batch 'keyword monitor eDP-1,preferred,auto,1,transform,2 ; keyword input:touchdevice:transform 2'"
        "ALT, left, exec,  hyprctl --batch 'keyword monitor eDP-1,preferred,auto,1,transform,1 ; keyword input:touchdevice:transform 1'"

        # Move focus with mod + arrow keys
        "SHIFT, left, movefocus, l"
        "SHIFT, right, movefocus, r"
        "SHIFT, up, movefocus, u"
        "SHIFT, down, movefocus, d"

        # Move active window to a workspace with mod + SHIFT + [0-9]
        "$mod2 , 1, split-movetoworkspace, 1"
        "$mod2 , 2, split-movetoworkspace, 2"
        "$mod2 , 3, split-movetoworkspace, 3"
        "$mod2 , 4, split-movetoworkspace, 4"
        "$mod2 , 5, split-movetoworkspace, 5"

        "$mod , 1, split-workspace, 1"
        "$mod , 2, split-workspace, 2"
        "$mod , 3, split-workspace, 3"
        "$mod , 4, split-workspace, 4"
        "$mod , 5, split-workspace, 5"

        # Example special workspace (scratchpad)
        "$mod, S,       togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"

        "$mod, right,   split-cycleworkspaces, +1"
        "$mod, left,    split-cycleworkspaces, -1"
        "$mod2, right,  movetoworkspace, +1"
        "$mod2, left,   movetoworkspace, -1"

        #touch_grass plugins config
        " , edge:d:u,   togglespecialworkspace, magic"
        " , swipe:3:u,  exec, wvkbd-mobintl &"
        " , swipe:3:d,  exec, pkill wvkbd-mobintl"
        " , swipe:4:d,  killactive"
      ];

      # Move/resize windows with mod + LMB/RMB and dragging
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"

        #touch_grass plugins config
        " , longpress:3, movewindow"
        " , longpress:2, resizewindow"
      ];
    };
  };
  
}
