{...}:{

  programs.librewolf = {
    enable = true;

    # https://librewolf.net/docs/settings/
    settings = {
      # enable google safe browsing (locally-ish)
      "browser.safebrowsing.malware.enabled" = true;
      "browser.safebrowsing.phishing.enabled" = true;
      "browser.safebrowsing.blockedURIs.enabled" = true;

      "browser.safebrowsing.provider.google4.gethashURL" = "https://safebrowsing.googleapis.com/v4/fullHashes:find?$ct=application/x-protobuf&key=%GOOGLE_SAFEBROWSING_API_KEY%&$httpMethod=POST";

      "browser.safebrowsing.provider.google4.updateURL" =
  "https://safebrowsing.googleapis.com/v4/threatListUpdates:fetch?$ct=application/x-protobuf&key=%GOOGLE_SAFEBROWSING_API_KEY%&$httpMethod=POST";

      "browser.safebrowsing.provider.google.gethashURL" =
  "https://safebrowsing.google.com/safebrowsing/gethash?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&pver=2.2";

      "browser.safebrowsing.provider.google.updateURL" =
  "https://safebrowsing.google.com/safebrowsing/downloads?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&pver=2.2&key=%GOOGLE_SAFEBROWSING_API_KEY%";

      "browser.safebrowsing.downloads.enabled" = true;

      # expanding or shrinking the inner window size in fixed increments, letting you blend in with a larger number of users
      "privacy.resistFingerprinting.letterboxing" = true;

      # Preserve browsing and download history
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.downloads" = true;
    };
  };

}
