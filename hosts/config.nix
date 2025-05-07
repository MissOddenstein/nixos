{ config, lib, pkgs, ... }:

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
    bolt-launcher
    git
    hyprpaper
  ];

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
    displayManager ={
      sddm.settings = {
        defaultSession = "hyprland";
        General.DisplayServer = "wayland-user";
        Autologin = {
          User = "yuria";
        };
      };
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  system.stateVersion = "25.05";
}