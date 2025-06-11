{
  inputs,
  programs,
  config,
  ...
}:

{
  programs = {
    nixcord = {
      enable = true;
      discord.enable = false;
      vesktop.enable = true;
      vesktopConfig = {
        plugins = {
          youtubeAdblock.enable = true;
          spotifyCrack.enable = true;
          userMessagesPronouns.enable = true;
        };
        themeLinks = [
          "https://catppuccin.github.io/discord/dist/catppuccin-macchiato-pink.theme.css"
        ];
      };
    };
  };
}
