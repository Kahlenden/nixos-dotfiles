{...}:{

  programs.librewolf = {
    enable = true;

    # https://librewolf.net/docs/settings/
    settings = {
      # expanding or shrinking the inner window size in fixed increments, letting you blend in with a larger number of users
      "privacy.resistFingerprinting.letterboxing" = true;

      # Do not preserve anything on shutdown
      "privacy.clearOnShutdown.history"     = true;
      "privacy.clearOnShutdown.downloads"   = true;
      "privacy.clearOnShutdown.cache"       = true;
      "privacy.clearOnShutdown.cookies"     = true;
      "privacy.clearOnShutdown.formdata"    = true;
      "privacy.clearOnShutdown.offlineApps" = true;
      "privacy.clearOnShutdown.sessions"    = true;

      # Blank start page. 0 = blank; 1 = home; 2 = last visited page; 3 = resume previous session;
      "browser.startup.page" = 0;

      # Disable os's geolocation services
      "geo.provider.use_gpsd"     = false;
      "geo.provider.use_geoclue"  = false;

      # Disable search suggestion
      "browser.search.suggest.enabled"  = false;
      "browser.urlbar.suggest.engines"  = false;
      "browser.urlbar.suggest.openpage" = false;
      "browser.urlbar.suggest.topsites" = false;
      "browser.urlbar.suggest.searches" = false;

      # Disable bookmarks on toolbar
      "browser.toolbars.bookmarks.visibility" = "never";
    };
  };

}
