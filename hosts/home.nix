{ inputs, config, pkgs, services, programs, ... }:

{

  home = {
    username = "yuria";
    homeDirectory = "/home/yuria";
    packages = with pkgs; [
      fastfetch
      kdePackages.ark
      gzip
      unzip
      kdePackages.dolphin
      vscodium
      killall
    ];
  };

  programs = {
    nixcord = {
      enable = true;
      discord.enable = false;
      vesktop.enable = true;
      vesktopConfig = {
        themeLinks = [
          "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
        ];
      };
    };
    git = {
      enable = true;
      userName = "MissOddenstein";
      userEmail = "yuria@londor.dev"
    }

    waybar.enable = true;
    btop.enable = true;
    fuzzel.enable = true;
    kitty.enable = true;
    home-manager.enable = true;
    firefox.enable = true;
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  wayland.windowManager.hyprland = {
    xwayland.enable = true;
    enable = true;
    settings = {

      exec-once = "waybar & hyprpaper";

      # preload = "../yohoho.jpeg";
      # wallpaper = "../yohoho.jpeg";

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

      monitor = [
        "DP-1, 1920x1080@120, 0x0, 1"
        "DP-2, 1920x1080@120, 1920x0, 1"
        "DP-3, 1920x1080@120, -1920x0, 1"
      ];

      "$mod" = "SUPER";

      bind = [
        # system binds
        "$mod, space, exec, fuzzel || killall fuzzel"
        "$mod, Q, killactive"
        "$mod, F, fullscreen, 0"

        # program binds
        "$mod, E, exec, dolphin"
        "$mod, W, exec, firefox"
        "$mod, C, exec, codium"
        "$mod, T, exec, kitty"

      ];

      bindm = [

        # mouse binds
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  programs.waybar = {
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        width = 1920;

        modules-left = [ "custom/nix" "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "tray" ];

        "custom/nix" = {
          format = "󱄅";
          on-click = "fuzzel || killall fuzzel";
        };

    style = ../modules/waybar.css;
      };
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "../yohoho.jpg";
      wallpaper = ", ../yohoho.jpg";
    };
  };

  home.stateVersion = "25.05";
}
