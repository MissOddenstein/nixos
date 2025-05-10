{
  inputs,
  config,
  pkgs,
  services,
  programs,
  ...
}:

{
  home = {
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "catppuccin-mocha-dark-cursors";
      size = 16;
    };
    packages = with pkgs; [
      xfce.thunar
      hyprshot
      nerdfonts
      fastfetch
      gzip
      unzip
      killall
    ];
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  programs = {
    btop.enable = true;
    fuzzel.enable = true;
    kitty = {
      enable = true;
      settings = {
        shell = "fish";
      };
    };
    firefox.enable = true;
  };

  imports = [
    ./modules/programs/codium.nix
    ./modules/programs/hyprland.nix
    ./modules/programs/nixcord.nix
    ./modules/programs/waybar.nix
    ./modules/services/hyprpaper.nix
    ./modules/services/gtk.nix
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  home.stateVersion = "24.11";
}
