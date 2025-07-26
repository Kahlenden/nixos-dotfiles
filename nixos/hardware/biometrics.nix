{pkgs, ...}:
let
  elanmoc2Merged = final: prev: {
    libfprint = prev.libfprint.overrideAttrs (old: {
      src = pkgs.fetchFromGitLab {
        domain = "gitlab.freedesktop.org";
        owner = "geodic";
        repo = "libfprint";
        rev = "bbf557229771c3393b0fe4260d2991ed66cd775d";
        sha256 = "sha256-ZHX6nw1MGgrwAqxhe4pvGJ7nU2OM32hubEFA1N7EMBE=";
      };
    });
    fprintd = prev.fprintd.overrideAttrs (old: {
      mesonCheckFlags = [
        "--no-suite" "fprintd:TestPamFprintd"
        "--no-suite" "fprintd:FPrintdManagerPreStartTests"
      ];
    });
  };
in {
  nixpkgs.overlays = [ elanmoc2Merged ];

  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };
  services.fprintd = {
    enable = true;
  };
}
