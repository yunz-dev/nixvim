{
  # Import all your configuration modules here
  imports = [
    ./bufferline

    ./completion/cmp.nix
    ./completion/lspkind.nix

    ./neotree
    ./theme
    ./luasnip
    ./telescope

    ./git/gitsigns.nix
    ./git/lazygit.nix

    ./lsp/conform.nix
    ./lsp/fidget.nix
    ./lsp/lsp.nix
    ./lsp/nvim-lint.nix
    ./lsp/lspsaga.nix
    ./lsp/trouble.nix
    ./lsp/none-ls.nix
    ./lsp/typescript-tools-nvim.nix

    ./treesitter/treesitter.nix
    ./treesitter/treesitter-textobjects.nix

    ./ui/alpha.nix
    ./ui/dressing-nvim.nix
    ./ui/flash.nix
    ./ui/indent-blankline.nix
    ./ui/lualine.nix
    ./ui/noice.nix
    ./ui/notify.nix
    ./ui/nui.nix
    ./ui/toggleterm.nix
    ./ui/whichkey.nix

    # ./util/hardtime.nix
    ./util/nvim-colorizer.nix
    ./util/mini.nix
    ./util/nvim-autopairs.nix
    ./util/nvim-surround.nix
    ./util/todo-comments.nix
    ./util/plenary.nix
    ./util/persistence.nix
    ./util/project-nvim.nix

    ./keymaps.nix
    ./settings.nix
  ];
}
