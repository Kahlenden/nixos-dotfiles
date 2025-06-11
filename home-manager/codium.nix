{pkgs, ...}:{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = {
        "workbench.colorTheme" = "Bluloco Dark";
        "workbench.iconTheme" = "vscode-icons";
        # Using the light mode
        "indentRainbow.indicatorStyle" = "light";

        # we use a simple 1 pixel wide line
        "indentRainbow.lightIndicatorStyleLineWidth" = 1;

        # the same colors as above but more visible
        "indentRainbow.colors" = [
          "rgba(255,255,64,0.3)"
          "rgba(127,255,127,0.3)"
          "rgba(255,127,255,0.3)"
          "rgba(79,236,236,0.3)"
        ];
      };
      extensions = with pkgs.nix-vscode-extensions.open-vsx; [
        # Languages
        jnoortheen.nix-ide
        ms-python.python
        mads-hartmann.bash-ide-vscode

        # Necessities
        adpyke.codesnap
        yzhang.markdown-all-in-one

        # Theming
        editorconfig.editorconfig
        uloco.theme-bluloco-dark
        oderwat.indent-rainbow
        vscode-icons-team.vscode-icons
      ];
    };
  };
}
