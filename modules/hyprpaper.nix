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
      # preload = "/home/yuria/nixos/modules/wall.png";
      # wallpaper = ", /home/yuria/nixos/modules/wall.png";

      # photography by Yidai Song;
      # I've reframed and graded it to taste,
      # original can be found here:
      # https://unsplash.com/photos/pink-flowers-with-green-leaves-on-a-branch-YRzmpwQs3dw
      preload = "/home/yuria/nixos/modules/6.png";
      wallpaper = ", /home/yuria/nixos/modules/6.png";
    };
  };
}