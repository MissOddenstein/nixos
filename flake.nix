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

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    ...
  }: {
    nixosConfigurations.vanth = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
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
              ./hosts/home.nix
              catppuccin.homeModules.catppuccin
            ];
            useUserPackages = true;
            useGlobalPkgs = true;
            backupFileExtension = "back;";
          };
        }
      ];
    };
  };
}
