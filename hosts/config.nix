{
  config,
  lib,
  pkgs,
  inputs,
  pkgsUnstable,
  ...
}:
{
  imports = [ ./hardware-config.nix ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  # User/Host profile
  networking.hostName = "vanth";
  time.timeZone = "Australia/Perth";
  i18n = {
    defaultLocale = "en_AU.UTF-8";
    extraLocaleSettings.LC_ALL = "en_AU.UTF-8";
  };

  users = {
    defaultUserShell = pkgs.fish;
    users.yuria = {
      isNormalUser = true;
      extraGroups = [
        "sudo"
        "networkmanager"
        "wheel"
      ];
    };
  };

  # packages and programs

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  # environment.systemPackages = [
  #   pkgsUnstable.bolt-launcher
  # ];

  # _module.args.pkgsUnstable = import inputs.nixpkgs-unstable {
  #   inherit (pkgs.stdenv.hostPlatform) system;
  #   inherit (config.nixpkgs) config;
  # };

  programs = {
    steam.enable = true;
    fish = {
      enable = true;
      interactiveShellInit = "fastfetch";
    };
    hyprland.enable = true;
  };

  # GRUB2 boot loader
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
    efi = {
      canTouchEfiVariables = true;
    };
  };

  # Audio & Display manager
  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = "yuria";
      };
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  system.stateVersion = "25.05";
}
