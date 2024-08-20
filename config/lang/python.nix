{ pkgs, ... }:
{
  plugins = {
    dap.extensions.dap-python.enable = true;

    conform-nvim = {
      formattersByFt = {
        python = [ "black" ];
      };

      formatters = {
        black = {
          command = "${pkgs.black}/bin/black";
        };
      };
    };

    # lint = {
    #   lintersByFt = {
    #     python = [ "ruff" ];
    #   };
    #
    #   linters = {
    #     ruff = {
    #       cmd = "${pkgs.ruff}/bin/ruff";
    #     };
    #   };
    # };

    lsp.servers = {
      pyright.enable = true;
      ruff-lsp = {
        enable = true;
        onAttach.function = ''
          if client.name == 'ruff' then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end
        '';
      };
    };
  };
}
