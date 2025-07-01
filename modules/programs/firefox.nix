{pkgs, inputs, config, ...}:
{
  programs.firefox = {
    enable = true;

    profiles.yuria = {
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        firefox-color
        stylus
      ];
      settings = {
        "extensions.autoDisableScopes" = 0;
      };
    };
  };
}