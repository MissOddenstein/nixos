{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixcord.url = "github:kaylorben/nixcord";
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      catppuccin,
      ...
    }:
    rec {
      system = "x86_64-linux";
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
      nixosConfigurations.vanth = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/config.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              sharedModules = [
                inputs.nixcord.homeModules.nixcord
              ];
              users.yuria.imports = [
                ./modules/programs/codium.nix
                ./modules/programs/hyprland.nix
                ./modules/programs/nixcord.nix
                ./modules/programs/waybar.nix

                ./home-manager/home.nix
                ./home-manager/yuria.nix
                ./modules/services/hyprpaper.nix
                ./modules/services/gtk.nix
                catppuccin.homeModules.catppuccin
              ];
              useUserPackages = true;
              useGlobalPkgs = true;
              backupFileExtension = "back";
            };
          }
        ];
      };
    };
}
