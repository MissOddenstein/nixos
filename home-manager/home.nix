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
    packages = with pkgs; [
      gnome-calendar
      xfce.thunar
      pavucontrol
      hyprshot
      nerdfonts
      fastfetch
      gzip
      unzip
      killall
      gamescope
      wine
      winetricks
      wlogout
      mesa
      libva1
      ventoy
      usbutils
    ];
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "catppuccin-mocha-dark-cursors";
      size = 24;
    };
  };

  programs = {
    kitty = {
      enable = true;
      settings = {
        shell = "fish";
      };
    };
    firefox.enable = true;
    fuzzel.enable = true;
    btop.enable = true;
  };

  imports = [
    ../modules/programs/codium.nix
    ../modules/programs/hyprland.nix
    ../modules/programs/nixcord.nix
    ../modules/programs/waybar.nix
    ../modules/services/hyprpaper.nix
    ../modules/services/gtk.nix
  ];

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  home.stateVersion = "24.11";
}
