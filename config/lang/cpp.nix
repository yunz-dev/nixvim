{ pkgs, ... }:
{
  plugins = {
    clangd-extensions.enable = true;

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

    lsp.servers = {
      cmake.enable = true;
      clangd = {
        enable = true;
        onAttach.function = ''
          vim.keymap.set('n', 'gh', "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)", buffer = bufnr })
        '';
      };
    };
  };
}
