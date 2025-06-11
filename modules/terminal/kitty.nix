{pkgs, ...}:
{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Macchiato";
    settings = {
      shell = "fish";
    };
  };
}