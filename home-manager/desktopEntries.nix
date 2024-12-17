{pkgs, ...}: {
  # Custom desktop entry for brave to use mullvad split tunneling
  xdg.desktopEntries = {
    brave-browser = {
      name = "Brave Web Browser";
      genericName = "Web Browser";
      comment = "Access the Internet";

      exec = "/run/wrappers/bin/mullvad-exclude ${pkgs.brave}/bin/brave %U";
      startupNotify = true;
      terminal = false;

      icon = "brave-browser";
      type = "Application";
      categories = [ "Network" "WebBrowser" ];
      mimeType = [ "application/pdf" "application/rdf+xml" "application/rss+xml" "application/xhtml+xml" "application/xhtml_xml" "application/xml" "image/gif" "image/jpeg" "image/png" "image/webp" "text/html" "text/xml" "x-scheme-handler/http" "x-scheme-handler/https" ];

      actions = {
        "new-window" = {
          name = "New Window";
          exec = "/run/wrappers/bin/mullvad-exclude ${pkgs.brave}/bin/brave";
        };
        "new-private-window" = {
          name = "New Incognito Window";
          exec = "/run/wrappers/bin/mullvad-exclude ${pkgs.brave}/bin/brave --incognito";
        };
      };
    };
  };
}