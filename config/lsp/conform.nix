{ pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = false;
      timeoutMs = 500;
    };
    formattersByFt = {
      # Use the "_" filetype to run formatters on filetypes that don't have other formatters configured.
      "_" = [ "trim_whitespace" ];
    };
    formatters = {
      _ = {
        command = "${pkgs.gawk}/bin/gawk";
      };
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
