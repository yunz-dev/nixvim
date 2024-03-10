{
  plugins = {
    lsp.servers.html = {
      enable = true;
      extraOptions.settings = {
        html = {
          format = {
            templating = true;
            wrapLineLength = 120;
            wrapAttributes = "auto";
          };
          hover = {
            documentation = true;
            references = true;
          };
        };
      };
    };
  };
}
