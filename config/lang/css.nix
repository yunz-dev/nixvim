{ pkgs, ... }:
{
  plugins = {
    conform-nvim = {
      formattersByFt = {
        css = [ "prettierd" ];
      };

      formatters = {
        prettierd = {
          command = "${pkgs.prettierd}/bin/prettierd";
        };
      };
    };

    lint = {
      lintersByFt = {
        css = [ "stylelint" ];
      };
      linters = {
        stylelint = {
          cmd = "${pkgs.stylelint}/bin/stylelint";
        };
      };
    };

    lsp.servers = {
      cssls.enable = true;
      tailwindcss.enable = true;
    };
  };
}
