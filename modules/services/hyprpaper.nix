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
      preload = "/home/yuria/nixos/modules/yohoho.jpg";
      wallpaper = ", /home/yuria/nixos/modules/yohoho.jpg";
    };
  };
}