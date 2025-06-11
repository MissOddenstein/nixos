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

    # bar settings
    settings = {
      bar = {
        launcher = {
          icon = "";
        };
        workspaces = {
          monitorSpecific = false;
          showAllActive = false;
        };
        clock = {
          format = "%I:%M %p • %a. %B %d";
          icon = "";
        };
        customModules = {
          ram = {
            labelType = "used/total";
            round = true;
          };
          weather.unit = "metric";
        };
      };
      menus = {
        clock.weather = {
          key = "11c0ad3d6c9f7e7f1f066c8dd2c6db32";
          location = "Perth";
          unit = "metric";
        };
        dashboard.powermenu.avatar.image = "/home/yuria/nixos/assets/face.png";
      };

      theme = {
        bar = {
          #TODO: add panel scaling
        };
        name = "catppuccin_macchiato";
        font = {
          size = "16px";
        };
      };
      layout = {
        "bar.layouts" = {
          "*" = {
            left = ["dashboard" "workspaces" "ram" "windowtitle"];
            middle = ["clock"];
            right = ["systray" "media" "volume" "notifications" "power"];
          };
        };
      };
    };
  };
}