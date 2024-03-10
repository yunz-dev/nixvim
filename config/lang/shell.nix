{ pkgs, ... }:
{
  plugins = {
    conform-nvim = {
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
