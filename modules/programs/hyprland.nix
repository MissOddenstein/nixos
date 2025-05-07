{
  inputs,
  programs,
  config,
  ...
}:
{
    wayland.windowManager.hyprland = {
    xwayland.enable = true;
    enable = true;
    settings = {
      exec-once = "waybar & hyprpaper";

      general = {
        "col.active_border" = "rgb(cba6f7)";
        "col.inactive_border" = "rgb(181825)";

        gaps_in = 5;
        gaps_out = 15;
        border_size = 2;
      };

      decoration = {
        rounding = "10";
      };

      "$mod" = "SUPER";

      bind = [
        # system binds
        "$mod, space, exec, fuzzel || killall fuzzel"
        "$mod, Q, killactive"
        "$mod, F, fullscreen, 0"
        "$mod, P, exec, hyprshot -m region"

        # program binds
        "$mod, E, exec, dolphin"
        "$mod, W, exec, firefox"
        "$mod, C, exec, codium"
        "$mod, T, exec, kitty -e fish"
      ];

      bindm = [
        # mouse binds
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindl = [
        # system audio
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
    };
  };
}