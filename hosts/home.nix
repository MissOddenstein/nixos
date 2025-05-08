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
    username = "yuria";
    homeDirectory = "/home/yuria";
    packages = with pkgs; [
      xfce.thunar
      hyprshot
      nerdfonts
      fastfetch
      gzip
      unzip
      killall
      krita
      nh
    ];
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
