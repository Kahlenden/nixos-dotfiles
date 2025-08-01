{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable"; #nixos-24.05";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master"; # master #release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions/46eb9c16d8ccfedf8bc648be03f9b2993fe3c994";
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
    username = "kerry";
    hostname = "Windows11";
    system = "x86_64-linux";
    pkgs = import <nixpkgs> {
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
