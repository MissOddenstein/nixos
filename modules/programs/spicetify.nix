{
  inputs,
  config,
  pkgs,
  programs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        powerBar
      ];
      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        ncsVisualizer
      ];
      enabledSnippets = with spicePkgs.snippets; [
        pointer
      ];

      theme = spicePkgs.themes.catppuccin;
      colorScheme = "macchiato";
    };
}
