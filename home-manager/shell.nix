{pkgs, ...}: {
  # FISH shell
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      neofetch --ascii_colors 7 5
      set -U fish_greeting "What do you says,
      we net fish and chill?"
    '';
  };

}
