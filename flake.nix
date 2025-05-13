{
  description = "The big flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        T495BBK = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./system/configuration.nix ];
        };
      };

      homeConfigurations = {
        bas = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./user/home.nix ];
        };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
