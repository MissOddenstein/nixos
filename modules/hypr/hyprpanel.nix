{
  inputs,
  pkgs,
  config,
  ...
}:
{
  programs.hyprpanel = {
    enable = true;

    # bar settings
    settings = {
      bar = {
        media.format = "{artist} • {title}";
        launcher.autoDetectIcon = true;
        workspaces = {
          monitorSpecific = false;
          showAllActive = false;
        };
        clock = {
          format = "%I:%M %p • %a. %B %d";
        };
        customModules = {
          ram = {
            labelType = "used/total";
            round = true;
          };
          weather.unit = "metric";
        };

        layouts = {
          "*" = {
            left = [
              "dashboard"
              "cputemp"
              "workspaces"
              "windowtitle"
            ];
            middle = [ "clock" ];
            right = [
              "systray"
              "volume"
              "bluetooth"
              "network"
              "battery"
              "notifications"
            ];
          };
        };

      };
      menus = {
        clock.weather = {
          enabled = false;
          key = "11c0ad3d6c9f7e7f1f066c8dd2c6db32";
          location = "Perth";
          unit = "metric";
        };
        dashboard = {
          powermenu = {
            avatar.image = "/home/yuria/nixos/assets/face.png";
            logout = "hyprlock";
          };
          shortcuts.enabled = false;
          stats.enabled = false;
        };
      };

      theme = {
        bar = {
          opacity = 70;
          buttons.opacity = 90;
          menus.opacity = 95;
        };
        name = "catppuccin_macchiato";
        font = {
          name = "Ubuntu Nerd Font";
          size = "1rem";
        };
      };
    };
  };
}
