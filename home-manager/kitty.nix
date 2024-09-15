{...}:{
# Kitty terminalllll
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    shellIntegration.enableFishIntegration = true;
    theme = "Catppuccin-Macchiato";

    settings = {
      background_opacity = "0.3";
      hide_window_decorations = "yes";
    };
    
  };
}