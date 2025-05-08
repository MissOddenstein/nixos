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
      size = 24;
    };
    username = "yuria";
    homeDirectory = "/home/yuria";
    packages = with pkgs; [
      xfce.thunar
      hyprshot
      nerdfonts
      fastfetch
      gzip
      unzip
      kdePackages.dolphin
      killall
      krita
    ];
  };
  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "catppuccin-mocha-mauve-standard+default";
    };
  };

  programs = {
    git = {
      enable = true;
      userName = "MissOddenstein";
      userEmail = "yuria@londor.dev";
    };
    btop.enable = true;
    fuzzel.enable = true;
    kitty.enable = true;
    home-manager.enable = true;
    firefox.enable = true;
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  home.stateVersion = "24.11";
}