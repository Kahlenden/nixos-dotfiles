{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable"; #3212a3719697ca78734510103c8aa10bb12584e3"; #nixos-unstable"; #nixos-24.05";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master"; #release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions"; #/b3c49142939ba6072cb8bdd6109e36d1b70a055a";
  };

  outputs = {
    self
  , sops-nix
  , lanzaboote
  , home-manager
  , nixpkgs
  , nix-vscode-extensions
  , ...
  }@inputs:

  let
    username = "kahlenden";
    hostname = "Windows11";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [nix-vscode-extensions.overlays.default];
      config.allowUnfree = true;
    };
in
  {
    nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };

      modules = [

        ./nixos

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = {
            imports = [ ./home-manager ];
          };
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };
        }
      ];
    };

  };
}
