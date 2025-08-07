{...}:{
  dconf.settings = {
    # Static workspace
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
      workspaces-only-on-primary = false;
    };

    # Max 6 orkspaces
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 6;
    };

    # Allow app switch (alt tab) only in current workspace
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

    "org/gnome/desktop/interface" = {
      enable-hot-corners = false;
    };
  };
}
