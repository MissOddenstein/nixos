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
      preload = "./yohoho.jpg";
      wallpaper = ", ./yohoho.jpg";
    };
  };
}