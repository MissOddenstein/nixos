{
  inputs,
  config,
  pkgs,
  services,
  programs,
  ...
}: {
  imports = [

  ];
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
    ];
  };

  programs = {
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