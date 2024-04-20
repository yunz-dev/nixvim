{ pkgs, ... }:
{
  plugins = {
    conform-nvim = {
      formattersByFt = {
        cpp = [ "clang-format" ];
      };

      formatters = {
        clang-format = {
          command = "${pkgs.clang-tools}/bin/clang-format";
        };
      };
    };

    lsp.servers.clangd.enable = true;
  };
}
