{ config, pkgs, inputs, ... }:

{

  # TODO please change the username & home directory to your own
  home = {



    username = "yuria";
    homeDirectory = "/home/yuria";
    enableNixpkgsReleaseCheck = false;
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.catppuccin-cursors.macchiatoDark;
      name = "catppuccin-macchiato-dark-cursors";
      size = 16;
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

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    openjdk17
    obs-studio
    packwiz
    kdePackages.ark
    kdePackages.dolphin
    aseprite
    blockbench
    pulseaudio
    prismlauncher
    steam
    unzip
    fuzzel
    btop
    hyprshot
    hyprpaper
    hyprpanel
    pavucontrol
    krita
    gparted
    hyprpolkitagent
    lutris
    tmux
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "MissOddenstein";
    userEmail = "yuria@londor.dev";
  };


  imports = [
    ./modules/hypr/hyprland.nix
    ./modules/hypr/hyprpaper.nix
    ./modules/hypr/hyprpanel.nix
    ./modules/hypr/hyprshot.nix

    ./modules/programs/nixcord.nix
    ./modules/programs/codium.nix
    ./modules/programs/spicetify.nix
    ./modules/programs/firefox.nix

    ./modules/style/gtk.nix
    ./modules/style/qt.nix

    ./modules/terminal/kitty.nix
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
