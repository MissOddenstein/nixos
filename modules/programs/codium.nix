{
  inputs,
  programs,
  pkgs,
  config,
  ...
}:
{
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      userSettings = {

        workbench = {
          colorTheme = "Catppuccin Macchiato";
          iconTheme = "catppuccin-macchiato";
        };

        catppuccin.accentColor = "pink";

        extensions = with pkgs.vscode-extensions; [
          redhat.java
          vscjava.vscode-java-debug
          vscjava.vscode-java-test
          vscjava.vscode-maven
          vscjava.vscode-gradle
          vscjava.vscode-java-dependency
          visualstudioexptteam.vscodeintellicode
          ms-azuretools.vscode-docker
          catppuccin.catppuccin-vsc
          catppuccin.catppuccin-vsc-icons
        ];

        files.exclude = {
          "**/.git" = false;
        };
      };
    };
  };
}
