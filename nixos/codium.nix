{pkgs, ...}:{

  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with pkgs.open-vsx; [
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
          #esbenp.prettier-vscode
          editorconfig.editorconfig
          #sainnhe.everforest
          uloco.theme-bluloco-dark
          oderwat.indent-rainbow
          vscode-icons-team.vscode-icons
      ];
    })
  ];
}
