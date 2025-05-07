{ config, lib, pkgs, inputs, pkgsUnstable, ... }:

{
  imports = [ ./hardware-config.nix];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;


  # User/Host profile
    networking.hostName = "vanth";
    time.timeZone = "Australia/Perth";

  users.users.yuria = {
    isNormalUser = true;
    extraGroups = [ "sudo" "networkmanager" "wheel" ];
    };

  # packages and programs

  environment.systemPackages = with pkgs; [
    pkgsUnstable.bolt-launcher
  ];

  _module.args.pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
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

  programs = {
    hyprland.enable = true;
    fish.enable = true;
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