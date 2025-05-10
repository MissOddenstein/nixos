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
    btop.enable = true;
    fuzzel.enable = true;
  };
  programs = {
    git = {
      enable = true;
      userName = "MissOddenstein";
      userEmail = "yuria@londor.dev";
    };
  };
  packages = [
      krita
      nh
      prismlauncher
  ];

  home.stateVersion = "24.11";
}