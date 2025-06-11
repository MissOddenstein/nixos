{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord.url = "github:kaylorben/nixcord";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
  };

  outputs = { nixpkgs, hyprpanel, spicetify-nix, home-manager, self, ... } @ inputs: {
    nixosConfigurations = {
      io = nixpkgs.lib.nixosSystem {
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
