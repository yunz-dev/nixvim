{ pkgs, ... }:
{
  plugins = {
    dap.extensions.dap-python.enable = true;

    conform-nvim = {
      formattersByFt.python = [
        "ruff_format"
        "ruff_organize_imports"
      ];

      # formatters.black.command = "${pkgs.black}/bin/black";
    };

    lint = {
      lintersByFt.python = [ "mypy" ];
      linters.mypy.cmd = "${pkgs.mypy}/bin/mypy";
    };

    lsp.servers = {
      pyright = {
        enable = true;
        extraOptions.settings = {
          # Using Ruff's import organizer
          pyright.disableOrganizeImports = true;
          python.analysis = {
            # Ignore all files for analysis to exclusively use Ruff for linting
            ignore.__raw = ''{ '*' }'';
          };
        };
      };

      ruff = {
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
