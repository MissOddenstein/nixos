{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "maroon" ];
        variant = "macchiato";
      };
      name = "catppuccin-macchiato-maroon-standard";
    };
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    font = {
      name = "RobotoMono Nerd Fonts";
      size = 11;
    };
  };
}
