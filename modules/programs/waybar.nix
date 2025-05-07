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

        modules-left = ["custom/nix" "temperature" "cpu" "memory" "hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = ["tray" "pulseaudio" "clock" "clock#calendar" "custom/power"];

        "custom/nix" = {
          format = "󱄅  NixOS";
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
          format = "{volume}%  {icon}";
          format-muted = "{volume}%   ";
          format-icons = {
            default = ["" "" ""];
          };
        };
        "clock" = {
          format = "{:%I:%M  } ";
          timezone = "Australia/Perth";
        };
        "clock#calendar" = {
          format = "{:%B %d   }";
          timezone = "Australia/Perth";
        };
        "custom/power" = {
          format = "I/O  ";
          on-click = "reboot";
        };
      };
    };
  };
}