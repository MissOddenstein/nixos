{ pkgs, ... }:
let 
  variant = "macchiato";
  accents = ["pink"];
  gtkTheme = pkgs.catppuccin-gtk.override {
    inherit variant accents;
  };
in 
{
  gtk = {
    enable = true;
    theme = {
      package = "${gtkTheme}";
      name = "catppuccin-${variant}-pink-standard";
    };
    font = {
      name = "JetBrainsMono Nerd Fonts";
      size = 11;
    };
  };
}
