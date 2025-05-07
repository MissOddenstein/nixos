{
  inputs,
  config,
  pkgs,
  services,
  programs,
  ...
}: {
  home = {
    username = "yuria";
    homeDirectory = "/home/yuria";
    packages = with pkgs; [
      fastfetch
      gzip
      unzip
      kdePackages.dolphin
      killall
    ];
  };

  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons

        jnoortheen.nix-ide
        jeff-hykin.better-nix-syntax
        kamadorueda.alejandra
      ];
    };
    nixcord = {
      enable = true;
      discord.enable = false;
      vesktop.enable = true;
      vesktopConfig = {
        plugins = {
          fakeNitro.enable = true;
          youtubeAdblock.enable = true;
          spotifyCrack.enable = true;

          readAllNotificationsButton.enable = true;
          typingTweaks.enable = true;
          userMessagesPronouns.enable = true;

          webKeybinds.enable = true;
          webScreenShareFixes.enable = true;
        };
        themeLinks = [
          "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
        ];
      };
    };
    git = {
      enable = true;
      userName = "MissOddenstein";
      userEmail = "yuria@londor.dev";
      aliases = {
        ci = "commit";
        co = "checkout";
        s = "status";
      };
    };

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

        modules-left = ["custom/nix" "hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = ["tray"];

        "custom/nix" = {
          format = "󱄅";
          on-click = "fuzzel || killall fuzzel";
        };

        style = "/home/yuria/nixos/modules/waybar.css";
      };
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "/home/yuria/nixos/modules/yohoho.jpg";
      wallpaper = ", /home/yuria/nixos/modules/yohoho.jpg";
    };
  };

  home.stateVersion = "24.11";
}
