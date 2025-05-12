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

      windowrule = [
        "tag +widget, title:Volume Control"
        "tag +widget, title:Calendar"

        "move 100%-w-15 50, title:Volume Control"
        "size 700 350, title:Volume Control"

        "move 100%-w-15 175, title:Calendar"
        "size 700px 350px, title:Calendar"

        # widgets
        "float, title:Volume Control"
        "animation slide top, title:Volume Control"
        "decorate off, title:Volume Control"
        "noinitialfocus, title:Volume Control"

        "float, title:Calendar"
        "animation slide top, title:Calendar"
        "decorate off, title:Calendar"
        "noinitialfocus, title:Calendar"
      ];

      monitor = [
        "DP-1, 1920x1080@120, auto, 1"
        "DP-2, 1920x1080@120, auto, 1"
        "DP-3, 1920x1080@120, auto, 1"
      ];

      general = {
        "col.active_border" = "rgb(cba6f7)";
        "col.inactive_border" = "rgb(11111b)";

        gaps_in = 5;
        gaps_out = 15;
        border_size = 2;
      };

      decoration = {
        rounding = "10";
      };

      "$mod" = "SUPER";
      "$modShift" = "SUPERSHIFT";

      bind = [
        # system binds
        "$mod, space, exec, fuzzel || killall fuzzel"
        "$mod, Q, killactive"
        "$mod, F, fullscreen, 1"
        "$modShift, F, fullscreen, 0"
        "$mod, P, exec, hyprshot -m region"
        "$modShift, P, exec, hyprshot -m active -m output"
        "$mod, V, togglefloating"

        # program binds
        "$mod, D, exec, vesktop"
        "$mod, E, exec, thunar"
        "$mod, W, exec, firefox"
        "$mod, C, exec, codium"
        "$mod, T, exec, kitty"
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
