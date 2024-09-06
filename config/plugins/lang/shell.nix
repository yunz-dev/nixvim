{ pkgs, ... }:
{
  plugins = {
    conform-nvim.settings = {
      formattersByFt = {
        sh = [ "shfmt" ];
      };
      formatters = {
        shfmt = {
          command = "${pkgs.shfmt}/bin/shfmt";
        };
      };
    };

    lsp.servers.bashls.enable = true;
  };
}
