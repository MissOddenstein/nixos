{
  inputs,
  config,
  pkgs,
  services,
  programs,
  ...
}: {
  imports = [

  ];
  home = {
    username = "yuria";
    homeDirectory = "/home/yuria";
    packages = with pkgs; [
      hyprshot
      nerdfonts
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
      userSettings = {
        explorer.confirmDelete = false;
        catppuccin.accentColor = "mauve";
        workbench.colorTheme = "Catppuccin Mocha";
        editor.fontFamily = "RobotoMono Nerd Font";
        files.exclude = "";
        git.enableSmartCommit = true;
      };
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons

        jnoortheen.nix-ide
        jeff-hykin.better-nix-syntax
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
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
    };
  };

  programs.waybar = {
    style = builtins.readFile ../modules/waybar.css;
    settings = {
      mainBar = {
        position = "top";
        width = 1920;

        modules-left = ["custom/nix" "temperature" "cpu" "memory" "hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = ["tray"];

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
      };
    };
  };

  home.stateVersion = "24.11";
}