{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    marksman
  ];

  plugins = {
    markdown-preview = {
      enable = true;
    };

    lsp.servers = {
      marksman.enable = true;

      ltex = {
        enable = true;
        filetypes = [
          "markdown"
          "text"
        ];

        settings = {
          completionEnabled = true;
        };

        extraOptions = {
          checkFrequency = "save";
          language = "en-GB";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>m";
      action = "<cmd>MarkdownPreviewToggle<cr>";
      options = {
        silent = true;
        desc = "Toggle markdown preview";
      };
    }
  ];
}
