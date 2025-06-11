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
        workbench.colorTheme = "Catppuccin Macchiato";

        editor.fontFamily = "AdwaitaMono Nerd Font";

        explorer.confirmDelete = false;
        explorer.confirmDragAndDrop = false;

        git.enableSmartCommit = true;
        git.confirmSync = false;
      };
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc

        redhat.java
        vscjava.vscode-gradle

        jnoortheen.nix-ide
        jeff-hykin.better-nix-syntax
      ];
    };
  };
}
