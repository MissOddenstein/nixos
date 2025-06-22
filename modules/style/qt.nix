{pkgs, programs, config, ...}:
let 
  variant = "macchiato";
  accent = "pink";
  kvantumTheme = pkgs.catppuccin-kvantum.override {
    inherit variant accent;
  };
in 
{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };
  xdg.configFile = {

    # generate kvantum theme
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-${variant}-${accent}
    '';

    # directory to search for theme
    "Kvantum/catppuccin-${variant}-${accent}".source = "${kvantumTheme}/share/Kvantum/catppuccin-${variant}-${accent}";
  };
}