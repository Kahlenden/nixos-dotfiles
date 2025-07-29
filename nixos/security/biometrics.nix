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

  # Decrypt fingerprint template from sops nix
  sops.secrets."7" = {
    format = "binary";
    sopsFile = "/etc/nixos/nixos/security/sops-nix/kahlenden/fingerprint.bin";
    neededForUsers = true;
    path = "/var/lib/fprint/kahlenden/elanmoc2/0/7";
    mode = "0744";
    owner = "root";
  };
}
