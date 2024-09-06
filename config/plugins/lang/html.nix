{ pkgs, lib, ... }:
{
  plugins = {
    conform-nvim.settings = {
      formatters_by_ft.html = [
        "prettierd"
        "prettier"
      ];

      formatters = {
        prettierd.command = "${pkgs.prettierd}/bin/prettierd";
        prettier.command = "${pkgs.nodePackages.prettier}/bin/prettier";
      };
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
