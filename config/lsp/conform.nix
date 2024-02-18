{
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 500;
    };
    notifyOnError = true;
    formattersByFt = {
      lua = [ "stylua" ];
      sh = [ "shfmt" ];
      python = [ "black" ];
      nix = [ "nixpkgs_fmt" ];
      html = [ [ "prettier" ] ];
      css = [ [ "prettier" ] ];
      javascript = [ [ "eslint_d" ] ];
      javascriptreact = [ [ "eslint_d" ] ];
      typescript = [ [ "eslint_d" ] ];
      typescriptreact = [ [ "eslint_d" ] ];
      markdown = [ [ "prettier" ] ];
      rust = [ "rustfmt" ];
      # Use the "_" filetype to run formatters on filetypes that don't have other formatters configured.
      "_" = [ "trim_whitespace" ];
    };
  };

  keymaps = [
    {
      mode = [ "n" "v" ];
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
