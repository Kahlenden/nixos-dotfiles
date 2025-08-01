{...}:{
  # set default apps
  xdg.mime = {
    enable = true;
    removedAssociations = {
      "inode/directory" = "codium.desktop";
      "application/pdf" = "brave-browser.desktop";
      "image/jpeg" = "brave-browser.desktop";
      "image/png" = "brave-browser.desktop";
      "image/webp" = "brave-browser.desktop";
      "image/gif" = "brave-browser.desktop";
    };

    defaultApplications = {
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
      "inode/directory" = "org.gnome.Nautilus.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
      "application/msword" = "writer.desktop";
      "application/pdf" = "librewolf.desktop";

      # Images
      "image/png" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "image/gif" = "org.gnome.Loupe.desktop";

      # Videos
      "video/ogg" = "vlc.desktop";
      "video/x-ogm" = "vlc.desktop";
      "video/x-ogm+ogg" = "vlc.desktop";
      "video/x-theora+ogg" = "vlc.desktop";
      "video/x-theora" = "vlc.desktop";
      "video/x-ms-asf" = "vlc.desktop";
      "video/x-ms-asf-plugin" = "vlc.desktop";
      "video/x-ms-asx" = "vlc.desktop";
      "video/x-ms-wm" = "vlc.desktop";
      "video/x-ms-wmv" = "vlc.desktop";
      "video/x-ms-wmx" = "vlc.desktop";
      "video/x-ms-wvx" = "vlc.desktop";
      "video/x-msvideo" = "vlc.desktop";
      "video/divx" = "vlc.desktop";
      "video/msvideo" = "vlc.desktop";
      "video/vnd.divx" = "vlc.desktop";
      "video/avi" = "vlc.desktop";
      "video/x-avi" = "vlc.desktop";
      "video/vnd.rn-realvideo" = "vlc.desktop";
      "video/mp2t" = "vlc.desktop";
      "video/mpeg" = "vlc.desktop";
      "video/mpeg-system" = "vlc.desktop";
      "video/x-mpeg" = "vlc.desktop";
      "video/x-mpeg2" = "vlc.desktop";
      "video/x-mpeg-system" = "vlc.desktop";
      "video/mp4" = "vlc.desktop";
      "video/mp4v-es" = "vlc.desktop";
      "video/x-m4v" = "vlc.desktop";
      "video/quicktime" = "vlc.desktop";
      "video/x-matroska" = "vlc.desktop";
      "video/webm" = "vlc.desktop";
      "video/3gp" = "vlc.desktop";
      "video/3gpp" = "vlc.desktop";
      "video/3gpp2" = "vlc.desktop";
      "video/vnd.mpegurl" = "vlc.desktop";
      "video/dv" = "vlc.desktop";
      "video/x-anim" = "vlc.desktop";
      "video/x-nsv" = "vlc.desktop";
      "video/fli" = "vlc.desktop";
      "video/flv" = "vlc.desktop";
      "video/x-flc" = "vlc.desktop";
      "video/x-fli" = "vlc.desktop";
      "video/x-flv" = "vlc.desktop";
    };
  };

}
