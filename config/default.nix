{ pkgs, ... }:
{

  enableMan = false;

  # Import all your configuration modules here
  imports = [
    ./completion/cmp.nix

    ./neotree
    ./theme
    ./luasnip
    ./telescope

    ./git/gitsigns.nix
    ./git/lazygit.nix

    ./lsp/conform.nix
    ./lsp/fidget.nix
    ./lsp/lsp.nix
    ./lsp/lspsaga.nix
    ./lsp/trouble.nix

    ./lang/css.nix
    ./lang/docker.nix
    ./lang/html.nix
    ./lang/json.nix
    ./lang/lua.nix
    ./lang/markdown.nix
    ./lang/nix.nix
    ./lang/python.nix
    ./lang/shell.nix
    ./lang/typescript.nix
    ./lang/yaml.nix

    ./treesitter/treesitter.nix
    ./treesitter/treesitter-textobjects.nix

    ./ui/alpha.nix
    ./ui/bufferline.nix
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

    ./autocmd.nix
    ./keymaps.nix
    ./settings.nix
  ];

  extraPackages = with pkgs; [
    ripgrep
    lazygit
    fzf
  ];

  # feature that enhances the way Neovim loads and executes Lua modules, 
  # offering improved performance and flexibility.
  luaLoader.enable = true;

  clipboard.providers.wl-copy.enable = true;
}
