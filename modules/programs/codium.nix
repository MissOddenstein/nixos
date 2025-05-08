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
        explorer.confirmDelete = false;
        catppuccin.accentColor = "mauve";
        workbench.colorTheme = "Catppuccin Mocha";
        editor.fontFamily = "RobotoMono Nerd Font";
        files.exclude = "";
        git.enableSmartCommit = true;
        git.confirmSync = false;
      };
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons

        jnoortheen.nix-ide
        jeff-hykin.better-nix-syntax
      ];
    };
  };
}