{ pkgs, lib, ... }:
{
  plugins = {
    conform-nvim.formattersByFt = {
      html = [
        [
          "prettierd"
          "prettier"
        ]
      ];
    };

    lsp = {
      servers = {
        html = {
          enable = true;
          cmd = [
            "${pkgs.vscode-langservers-extracted}/bin/vscode-html-language-server"
            "--stdio"
          ];
        };
        # html = {
        #   enable = true;
        #   extraOptions.settings = {
        #     html = {
        #       format = {
        #         templating = true;
        #         wrapLineLength = 120;
        #         wrapAttributes = "auto";
        #       };
        #       hover = {
        #         documentation = true;
        #         references = true;
        #       };
        #     };
        #   };
        # };

        eslint = {
          enable = true;
          cmd = [
            (lib.getExe pkgs.eslint_d)
            "--stdio"
          ];
          filetypes = [ "html" ];
        };
      };

      enabledServers = [
        {
          name = "emmet_language_server";
          extraOptions = {
            cmd = [
              (lib.getExe pkgs.emmet-language-server)
              "--stdio"
            ];
            filetypes = [ "html" ];
          };
        }
      ];
    };
  };
}
