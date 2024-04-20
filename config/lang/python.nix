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

    lint = {
      lintersByFt = {
        python = [ "ruff" ];
      };

      linters = {
        ruff = {
          cmd = "${pkgs.ruff}/bin/ruff";
        };
      };
    };

    lsp.servers.ruff.enable = true;
  };
}
