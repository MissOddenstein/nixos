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
        workbench.iconTheme = "catppuccin-macchiato";

        editor.fontFamily = "AdwaitaMono Nerd Font";

        explorer.confirmDelete = false;
        explorer.confirmDragAndDrop = false;
        
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
