{
  plugins = {
    lsp = {
      enable = true;
    };

    lint.enable = true;
  };

  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border,
      })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border,
      })

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  '';
  keymaps = [{
    mode = "n";
    key = "<leader>cl";
    action = "<cmd>LspInfo<cr>";
    options.desc = "Lsp Info";
  }];
}
