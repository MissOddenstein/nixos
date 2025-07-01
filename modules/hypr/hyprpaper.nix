{
  inputs,
  config,
  services,
  pkgs,
  ...
}:

{
  home.packages = [ pkgs.hyprpaper ];
  services.hyprpaper = {
    enable = true;
    settings = {
      # photography by Soham Banerjee
      # https://unsplash.com/photos/purple-sunset-sky-with-tree-silhouettes-P9Ck7cogn4c
      preload = "~/nixos/assets/background.jpg";
      wallpaper = ", ~/nixos/assets/background.jpg";
    };
  };
}