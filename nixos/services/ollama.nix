{...}:{
  # See ROCM (AMD GPU computation driver) config at /nixos/hardware/graphics.nix

  services = {
    ollama = {
      enable = true;

      # home = "/var/lib/ollama";
      loadModels = [
        "deepseek-coder-v2"
      ];

      acceleration = "rocm";

      # https://github.com/NixOS/nixpkgs/issues/308206
      # https://github.com/ollama/ollama/issues/2503
      # https://llvm.org/docs/AMDGPUUsage.html
      rocmOverrideGfx = "10.1.0"; # gfx1010

      host = "127.0.0.1";
      port = 11434;

      # Don't need to run service for external users
      #openFirewall = true;
    };

    nextjs-ollama-llm-ui = {
      enable = true;
      port = 8080;
      ollamaUrl = "http://127.0.0.1:11434";
    };
  };
}
