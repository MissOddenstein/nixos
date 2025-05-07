{
  inputs,
  config,
  services,
  ...
}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "/home/yuria/nixos/modules/services/yohoho.jpg";
      wallpaper = ", /home/yuria/nixos/modules/services/yohoho.jpg";
    };
  };
}