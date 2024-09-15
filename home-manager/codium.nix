{nix-vscode-extensions, pkgs, ...}:{

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.open-vsx; [
      # Languages
      jnoortheen.nix-ide
      llvm-vs-code-extensions.vscode-clangd
      maziac.asm-code-lens
      ms-python.python

      # Necessities
      ritwickdey.liveserver
      
      # Theming
      esbenp.prettier-vscode
      sainnhe.everforest
    ];
  };

}
