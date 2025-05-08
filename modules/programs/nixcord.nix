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
          fakeNitro.enable = true;
          youtubeAdblock.enable = true;
          spotifyCrack.enable = true;

          readAllNotificationsButton.enable = true;
          typingTweaks.enable = true;
          userMessagesPronouns.enable = true;

          webKeybinds.enable = true;
          webScreenShareFixes.enable = true;
        };
        themeLinks = [
          "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
        ];
      };
    };
  };
}
