{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        cssls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        lua-ls = {
          enable = true;
          extraOptions.settings.Lua = {
            completion.callSnippet = "Replace";
            telemetry.enabled = false;
          };
        };
        nil_ls.enable = true;
        tsserver = {
          enable = false;
          filetypes = [ "javascript" "javascriptreact" "typescript" "typescriptreact" ];
        };
        eslint.enable = true;
        pyright.enable = true;
        ruff-lsp.enable = true;
        tailwindcss.enable = true;
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          settings.procMacro.enable = true;
        };
      };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
  keymaps = [{
    mode = "n";
    key = "<leader>cl";
    action = "<cmd>LspInfo<cr>";
    options.desc = "Lsp Info";
  }];
}
