{ icons, ... }:
{
  plugins = {
    lsp = {
      enable = true;
      servers.typos_lsp.enable = true;
      keymaps.lspBuf = {
        "<c-k>" = "signature_help";
        "i" = "implementation";
      };
    };
    lint.enable = true;
  };

  # extraConfigLua = # lua
  #   ''
  #     local _border = "rounded"
  #     local signs = {
  #         Hint = "${icons.diagnostics.BoldHint}",
  #         Info = "${icons.diagnostics.BoldInformation}",
  #         Warn = "${icons.diagnostics.BoldWarning}",
  #         Error = "${icons.diagnostics.BoldError}",
  #       }
  #
  #     vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  #       vim.lsp.handlers.hover, {
  #         border = _border,
  #       })
  #
  #     vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  #       vim.lsp.handlers.signature_help, {
  #         border = _border,
  #       })
  #
  #
  #
  #     for type, icon in pairs(signs) do
  #       local hl = "DiagnosticSign" .. type
  #       vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  #     end
  #
  #     vim.diagnostic.config{
  #       float = { border = _border },
  #       virtual_text = true,
  #       underline = true,
  #       serverity_sort = true,
  #       signs = true,
  #       update_in_insert = true,
  #     };
  #
  #     require('lspconfig.ui.windows').default_options = {
  #       border = _border
  #     }
  #
  #     vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  #       callback = function()
  #         require("lint").try_lint()
  #       end,
  #     })
  #   '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd>LspInfo<cr>";
      options.desc = "Lsp Info";
    }
  ];
}
