{ pkgs, lib, ... }:
{
  plugins = {
    conform-nvim.formattersByFt = {
      css = [
        [
          "prettierd"
          "prettier"
        ]
      ];

      # formatters = {
      #   prettierd = {
      #     command = "${pkgs.prettierd}/bin/prettierd";
      #   };
      # };
    };

    # lint = {
    #   lintersByFt = {
    #     css = [ "stylelint" ];
    #   };
    #   linters = {
    #     stylelint = {
    #       cmd = "${pkgs.stylelint}/bin/stylelint";
    #     };
    #   };
    # };

    lsp.servers = {
      cssls = {
        enable = true;
        cmd = [
          "${pkgs.vscode-langservers-extracted}/bin/vscode-css-language-server"
          "--stdio"
        ];
      };

      tailwindcss = {
        enable = true;
        cmd = [
          (lib.getExe pkgs.tailwindcss-language-server)
          "--stdio"
        ];
      };
    };
  };
}
