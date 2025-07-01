{pkgs, inputs, config, ...}:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      colors = {
        background="24273aff";
        text="cad3f5ff";
        prompt="b8c0e0ff";
        placeholder="8087a2ff";
        input="cad3f5ff";
        match="f5bde6ff";
        selection="363a4fff";
        selection-text="cad3f5ff";
        selection-match="f5bde6ff";
        counter="8087a2ff";
        border="f5bde6ff";
      };
      border = {
        width = 2;
      };
    };
  };
}