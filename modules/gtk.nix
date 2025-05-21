{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine-moon";
    };
    font = {
      name = "JetBrainsMono Nerd Fonts";
      size = 11;
    };
  };
}
