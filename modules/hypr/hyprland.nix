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
      
      source = "~/nixos/assets/macchiato.conf";
      exec-once = "hyprpaper & hyprpanel & hyprpolkitagent";

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      monitor = [
        "DP-1, 1920x1080@120, auto, 1"
        "DP-2, 1920x1080@120, auto, 1"
        "DP-3, 1920x1080@120, auto, 1"
      ];

      general = {
        "col.active_border" = "$pink";
        "col.inactive_border" = "$crust";

        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;
      };

      decoration = {
        rounding = "10";
      };

      windowrule = [
        "opacity 0.97, fullscreen:0"
        "float, class:kitty"
      ];

      "$mod" = "SUPER";
      "$modShift" = "SUPERSHIFT";

      bind = [
        # system binds
        "$mod, space, exec, fuzzel"
        "$mod, Q, killactive"
        "$mod, F, fullscreen, 1"
        "$modShift, F, fullscreen, 0"
        "$mod, V, togglefloating"

        # program binds
        "$mod, D, exec, vesktop"
        "$mod, E, exec, dolphin"
        "$mod, W, exec, firefox"
        "$mod, C, exec, codium"
        "$mod, T, exec, kitty"

        # workspace binds
        "$mod, mouse_up, workspace, e+1"
        "$mod, mouse_down, workspace, e-1"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"

        "$modShift, mouse_up, movetoworkspacesilent, e+1"
        "$modShift, mouse_down, movetoworkspacesilent, e-1"

        "$modShift, 1, movetoworkspacesilent, 1"
        "$modShift, 2, movetoworkspacesilent, 2"
        "$modShift, 3, movetoworkspacesilent, 3"
        "$modShift, 4, movetoworkspacesilent, 4"
        "$modShift, 5, movetoworkspacesilent, 5"
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
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
    };
  };
}
