{
  inputs,
  programs,
  config,
  ...
}:

{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar.css;
    settings = {
      mainBar = {
        position = "top";
        width = 1920;

        modules-left = [
          "custom/nix"
          "temperature"
          "cpu"
          "memory"
          "hyprland/workspaces"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "tray"
          "pulseaudio"
          "clock"
          "clock#calendar"
          "custom/power"
        ];

        "custom/nix" = {
          format = "󱄅  NixOS";
          tooltip-format = "NixOS Menu";
          on-click = "fuzzel || killall fuzzel";
        };
        "temperature" = {
          hwmon-path = "/sys/class/hwmon/hwmon1/temp1_input";
          format = "  {temperatureC} °C";
        };
        "cpu" = {
          format = "   {usage}%";
        };
        "memory" = {
          format = "   {}%";
        };
        "hyprland/workspaces" = {
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            active = " ";
            visible = " ";
            default = " ";
          };
        };
        "pulseaudio" = {
          scroll-step = 5;
          format = " {volume}%  {icon} ";
          format-muted = "{volume}%   ";
          format-icons = {
            default = [
              ""
              ""
              ""
            ];
          };
        };
        "clock" = {
          format = " {:%I:%M  } ";
          timezone = "Australia/Perth";
          tooltip = true;
          tooltip-format = "{:%A, %B %d, %Y}";
        };
        "clock#calendar" = {
          format = " {:%B %d  } ";
          timezone = "Australia/Perth";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#f2cdcd'><b>{}</b></span>";
              days = "<span color='#f5e0dc'><b>{}</b></span>";
              weeks = "<span color='#fab387'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#cba6f7'><b><u>{}</u></b></span>";
            };
          };
        };
        "custom/power" = {
          format = " I/O   ";
          tooltip-format = "
          Power Menu
          Left click to Power off
          Right click to Restart";
          on-click = "shutdown";
          on-click-right = "reboot";
        };
      };
    };
  };
}
