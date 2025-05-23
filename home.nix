{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home = {
    username = "yuria";
    homeDirectory = "/home/yuria";
    enableNixpkgsReleaseCheck = false;
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "catppuccin-mocha-dark-cursors";
      size = 24;
    };
  };

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    steam
    unzip
    fuzzel
    btop
    xfce.thunar
    nautilus
    hyprshot
    hyprpaper
    hyprpanel
    pavucontrol
    krita
    gparted
    hyprpolkitagent
    tmux
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "MissOddenstein";
    userEmail = "yuria@londor.dev";
  };

  programs.wofi = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
    settings = {
      shell = "fish";
    };
  };

  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty-direct";
        source = "/home/yuria/nixos/modules/nixos.png";
        recache = true;
      };
      modules = [
        "os"
        "kernel"

        "terminal"
        "shell"

        "cpu"
        "gpu"
      ];
    };
  };

  imports = [
    ./modules/gtk.nix
    ./modules/nixcord.nix
    ./modules/codium.nix
    ./modules/hyprland.nix
    ./modules/hyprpaper.nix
    ./modules/hyprpanel.nix
    ./modules/spicetify.nix
    ./modules/firefox.nix
  ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
