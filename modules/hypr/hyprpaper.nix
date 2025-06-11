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
      # photography by Zeng Yili;
      # I've reframed and graded it to taste,
      # original can be found here:
      # https://unsplash.com/photos/a-group-of-people-walking-down-a-street-at-night-NL6yz9uSUIU
      preload = "/home/yuria/nixos/assets/zeng.jpg";
      wallpaper = ", /home/yuria/nixos/assets/zeng.jpg";
    };
  };
}