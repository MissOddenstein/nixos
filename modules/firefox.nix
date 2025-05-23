{pkgs, ...}:
{
  programs.firefox = {
    enable = true;

    profiles.yuria {
      extensions = with pkgs.firefox-addons [
        ublock-origin
      ];
    };
  };
}