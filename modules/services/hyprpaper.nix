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
      preload = "/home/yuria/nixos/modules/services/rune.jpg";
      wallpaper = ", /home/yuria/nixos/modules/services/rune.jpg";
    };
  };
}
