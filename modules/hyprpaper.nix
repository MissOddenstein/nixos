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
      
      # wallpaper by Suizzy
      # https://bsky.app/profile/suizzyowl.com
      preload = "/home/yuria/nixos/modules/wall.png";
      wallpaper = ", /home/yuria/nixos/modules/wall.png";
    };
  };
}