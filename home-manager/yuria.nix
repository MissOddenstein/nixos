{
  inputs,
  pkgs,
  pkgsUnstable,
  services,
  config,
  ...
}:
{

  home = {
    username = "yuria";
    homeDirectory = "/home/yuria";
    packages = with pkgs; [
      krita
      nh
      prismlauncher
    ];
  };

  programs = {
    git = {
      enable = true;
      userName = "MissOddenstein";
      userEmail = "yuria@londor.dev";
    };
  };

  home.stateVersion = "24.11";
}