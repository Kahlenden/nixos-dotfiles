{pkgs, ...}:{

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.open-vsx; [
      # Languages
      jnoortheen.nix-ide
      llvm-vs-code-extensions.vscode-clangd
      maziac.asm-code-lens
      ms-python.python
      mads-hartmann.bash-ide-vscode
      ms-vscode.vscode-typescript-next

      # Necessities
      ritwickdey.liveserver
      jeanp413.open-remote-ssh
      formulahendry.code-runner
      adpyke.codesnap
      yzhang.markdown-all-in-one
      
      # Theming
      esbenp.prettier-vscode
      sainnhe.everforest
      oderwat.indent-rainbow
      vscode-icons-team.vscode-icons
    ];
  };

}
