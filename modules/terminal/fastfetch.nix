{ pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty-direct";
        source = "~/nixos/assets/nix.png";
        padding = {
          left = 6;
          top = 2;
        };
      };
      display = {
        separator = " ";
        color = "magenta";
      };
      modules = [
        {
          key = "╭──────────────────────────────────╮";
          type = "custom";
          keyColor = "magenta";
        }
        {
          key = "  Boot Loader";
          type = "bootmgr";
          keyColor = "blue";
          format = "{firmware-name}";
        }
        {
          key = "  OS";
          type = "os";
          keyColor = "blue";
        }
        {
          key = "  Kernel";
          type = "kernel";
          keyColor = "blue";
        }
        {
          key = "├──────────────────────────────────┤";
          type = "custom";
        }
        {
          key = "  WM";
          type = "wm";
          keyColor = "cyan";
        }
        {
          key = "  Terminal";
          type = "terminal";
          keyColor = "cyan";
        }
        {
          key = "  Shell";
          type = "shell";
          keyColor = "cyan";
        }
        {
          key = "├──────────────────────────────────┤";
          type = "custom";
        }
        {
          key = "  CPU";
          type = "cpu";
          keyColor = "green";
          format = "{name}";
        }
        {
          key = "  GPU";
          type = "gpu";
          keyColor = "green";
          format = "{name}";
        }
        {
          key = "╰──────────────────────────────────╯";
          type = "custom";
        }

        {
          type = "colors";
          symbol = "circle";
          paddingLeft = 10;
        }
        "break"
      ];
    };
  };
}
