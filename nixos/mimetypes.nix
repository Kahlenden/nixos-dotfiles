{config, ...}:{
  # set default apps
  xdg.mime = {
    enable = true;
    removedAssociations = {
      "inode/directory" = "codium.desktop";
      "image/jpeg" = "brave-browser.desktop";
      "image/png" = "brave-browser.desktop";
      "image/webp" = "brave-browser.desktop";
      "image/gif" = "brave-browser.desktop";
    };

    defaultApplications = {
      "text/html" = "mullvad-browser.desktop";
      "x-scheme-handler/http" = "mullvad-browser.desktop";
      "x-scheme-handler/https" = "mullvad-browser.desktop";
      "x-scheme-handler/about" = "mullvad-browser.desktop";
      "x-scheme-handler/unknown" = "mullvad-browser.desktop";
      "inode/directory" = "org.gnome.Nautilus.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
      "application/msword" = "writer.desktop";
      "application/pdf" = "brave-browser.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "image/gif" = "org.gnome.Loupe.desktop";
    };
/*
    addedAssociations = {
      "text/html" = "mullvad-browser.desktop";
      "x-scheme-handler/http" = "mullvad-browser.desktop";
      "x-scheme-handler/https" = "mullvad-browser.desktop";
      "x-scheme-handler/about" = "mullvad-browser.desktop";
      "x-scheme-handler/unknown" = "mullvad-browser.desktop";
      "inode/directory" = "org.gnome.Nautilus.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
      "application/msword" = "writer.desktop";
      "application/pdf" = "brave-browser.desktop";
      "video/*" = "vlc.desktop";
      "image/*" = "org.gnome.Loupe.desktop";
    };
*/
  };

}