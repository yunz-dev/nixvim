{ pkgs, helpers, ... }:
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

    dap = {
      adapters.executables.lldb.command = "${pkgs.lldb}/bin/lldb-vscode";

      configurations.cpp = [
        {
          name = "C++";
          type = "lldb";
          request = "launch";
          cwd = "\${workspaceFolder}";
          program = helpers.mkRaw ''
            function()
              return vim.fn.input('Executable path: ', vim.fn.getcwd() .. '/', 'file')
            end
          '';
          # args = helpers.mkRaw ''
          #   function()
          #     local arguments_string = vim.fn.input('Executable arguments: ')
          #     return vim.split(arguments_string, " +")
          #   end
          # '';
        }
      ];
    };
  };
}
