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
        layer = "top";
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
          interval = "3";
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
          on-click = "killall .pavucontrol-wr || kill all .gnome-clocks-wr || killall .gnome-calendar-wr || pavucontrol -t 1";
          on-click-right = "killall .pavucontrol-wr || kill all .gnome-clocks-wr || killall .gnome-calendar-wr || pavucontrol -t 5";
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
          on-click = "killall .pavucontrol-wr || kill all .gnome-clocks-wr || killall .gnome-calendar-wr || gnome-clocks";
          tooltip = true;
          tooltip-format = "{:%A, %B %d, %Y}";
        };
        "clock#calendar" = {
          format = " {:%B %d  } ";
          timezone = "Australia/Perth";
          on-click = "killall .pavucontrol-wr || kill all .gnome-clocks-wr || killall .gnome-calendar-wr || gnome-calendar";
          tooltip-format = "{:%A, %B %d, %Y}";
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
