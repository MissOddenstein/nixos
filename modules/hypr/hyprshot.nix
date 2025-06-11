{inputs, config, programs, ...}:
{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      "$mod, S, exec, hyprshot -m region"
      "$modShift, S, exec, hyprshot -m active -m output"
    '';
  };
}