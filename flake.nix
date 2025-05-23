{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixcord.url = "github:kaylorben/nixcord";
    nix-colors.url = "github:misterio77/nix-colors";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    hyprpanel.url = "github:MissOddenstein/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, hyprpanel, nix-colors, spicetify-nix, home-manager, self, ... } @ inputs: {
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
                  inputs.nix-colors.homeManagerModules.default
                ];
                extraSpecialArgs = { inherit inputs; };
            useUserPackages = true;
            users.yuria = import ./home.nix;
            backupFileExtension = "nix-backup";
            };
          }
        ];
      };
    };
  };
}
