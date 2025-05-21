{ inputs, pkgs, config, ... }:
{
  home.packages = with pkgs; [
    wireplumber
    libgtop
    bluez
    bluez-tools
    networkmanager
    dart-sass
    wl-clipboard
    upower
    gvfs
  ];

  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    overwrite.enable = true;

    # bar theme
    settings = {
      bar = {
        clock = {
          format = "%A, %I:%M %p, %B %d";
          icon = "";
        };
        customModules.weather.unit = "metric";
        launcher.autoDetectIcon = true;
        workspaces = {
          showAllActive = false;
          show_icons = false;
          monitorSpecific = false;
        };
      };
      menus = {
        clock.weather = {
          key = "11c0ad3d6c9f7e7f1f066c8dd2c6db32";
          location = "Perth";
          unit = "metric";
        };
        dashboard.powermenu.avatar.image = "/home/yuria/nixos/modules/face.png";
      };

      theme = {
        bar = {
          transparent = false;
        };
        name = "rose_pine_moon";
        font = {
          size = "14px";
        };
      };
      layout = {
        "bar.layouts" = {
        };
      };
    };
  };
}