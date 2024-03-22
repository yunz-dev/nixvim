{ pkgs, ... }: {
  plugins = {
    conform-nvim = {
      formattersByFt = {
        json = [ "jq" ];
      };

      formatters = {
        jq = {
          command = "${pkgs.jq}/bin/jq";
        };
      };
    };

    lint = {
      lintersByFt = {
        json = [ "jsonlint" ];
      };

      linters = {
        jsonlint = {
          cmd = "${pkgs.nodePackages_latest.jsonlint}/bin/jsonlint";
        };
      };
    };

    lsp.servers.jsonls = {
      enable = true;
    };
  };
}
