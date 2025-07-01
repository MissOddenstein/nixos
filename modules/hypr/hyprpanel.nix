{ inputs, pkgs, config, ... }:
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
          icon = "";
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
            left = ["dashboard" "workspaces" "ram" "windowtitle"];
            middle = ["clock"];
            right = ["systray" "media" "volume" "notifications" "power"];
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
          opacity = 95;
          buttons.opacity = 100;
          menus.opacity = 95;
        };
        name = "catppuccin_macchiato";
        font = {
          name = "Ubuntu Nerd Font";
          size = "1.3rem";
        };
      };
    };
  };
}