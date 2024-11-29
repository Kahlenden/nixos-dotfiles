{...}:{
# Kitty terminal
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    shellIntegration.enableFishIntegration = true;
    themeFile = "Catppuccin-Macchiato";

    settings = {
      background_opacity = "1";
    };
  };
}
