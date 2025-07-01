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
      size = 24;
    };
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    nix-ld
    docker
    mame
    dotnetCorePackages.dotnet_8.sdk
    obs-studio
    instawow
    wineWowPackages.stable
    winetricks
    cmake
    vlc
    qbittorrent
    packwiz
    kdePackages.ark
    kdePackages.dolphin
    kdePackages.gwenview
    kdePackages.okular
    aseprite
    blockbench
    pulseaudio
    prismlauncher
    steam
    unzip
    btop
    pavucontrol
    krita
    gparted
    hyprpolkitagent
    hyprsunset
    tmux
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
  ];

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
    ./modules/hypr/hyprlock.nix

    ./modules/programs/nixcord.nix
    ./modules/programs/codium.nix
    ./modules/programs/fuzzel.nix
    ./modules/programs/spicetify.nix
    ./modules/programs/firefox.nix

    ./modules/style/gtk.nix
    ./modules/style/qt.nix

    ./modules/terminal/kitty.nix
    ./modules/terminal/fastfetch.nix
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
