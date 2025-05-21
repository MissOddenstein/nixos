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
        workbench.colorTheme = "Rosé Pine Moon";
        editor.fontFamily = "JetBrainsMono Nerd Font";
        files.exclude = "";
        git.enableSmartCommit = true;
        git.confirmSync = false;
      };
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        jeff-hykin.better-nix-syntax
      ];
    };
  };
}
