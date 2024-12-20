{pkgs, ...}:{
  programs.vscode = {
    package = pkgs.vscodium;
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
  };
}
