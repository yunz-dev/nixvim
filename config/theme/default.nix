{
  colorschemes = {
    catppuccin = {
      enable = true;
      background = {
        light = "macchiato";
        dark = "mocha";
      };
      flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
      transparentBackground = true;
      integrations = {
        cmp = true;
        flash = true;
        fidget = true;
        gitsigns = true;
        indent_blankline.enabled = true;
        lsp_trouble = true;
        mini.enabled = true;
        neotree = true;
        noice = true;
        notify = true;
        native_lsp.enabled = true;
        telescope.enabled = true;
        treesitter = true;
        treesitter_context = true;
        which_key = true;
      };
    };
  };
}
