{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixcord.url = "github:kaylorben/nixcord";
    catppuccin.url = "github:catppuccin/nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    hyprpanel.url = "github:MissOddenstein/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, catppuccin, hyprpanel, spicetify-nix, home-manager, self, ... } @ inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
                sharedModules = [
                  inputs.hyprpanel.homeManagerModules.hyprpanel
                  inputs.nixcord.homeModules.nixcord
                  inputs.spicetify-nix.homeManagerModules.default
                  inputs.catppuccin.homeModules.catppuccin
                ];
                extraSpecialArgs = { inherit inputs; };
            useUserPackages = true;
            users.yuria = import ./home.nix;
            backupFileExtension = "back";
            };
          }
        ];
      };
    };
  };
}
