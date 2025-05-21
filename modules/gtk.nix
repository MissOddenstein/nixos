{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "mocha";
      };
      name = "catppuccin-mocha-blue-standard";
    };
    font = {
      name = "JetBrainsMono Nerd Fonts";
      size = 11;
    };
  };
}
