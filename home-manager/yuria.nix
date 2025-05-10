{
  inputs,
  pkgs,
  services,
  config,
  ...
}:
{
  home = {
    username = "yuria";
    homeDirectory = "/home/yuria";
  };
  programs = {
    git = {
      enable = true;
      userName = "MissOddenstein";
      userEmail = "yuria@londor.dev";
    };
    home-manager.enable = true;
  };
}