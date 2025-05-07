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
    username = "yuria";
    homeDirectory = "/home/yuria";
    packages = with pkgs; [
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