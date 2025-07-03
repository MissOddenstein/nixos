{
  inputs,
  config,
  programs,
  pkgs,
  ...
}:
{
  home.packages = [ pkgs.hyprshot ];
  wayland.windowManager.hyprland = {
    extraConfig = ''
      bind = $mod, S, exec, hyprshot -m region
      bind = $modShift, S, exec, hyprshot -m active -m output
      env = HYPRSHOT_DIR,Pictures/Screenshots
    '';
  };
}
