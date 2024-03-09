{
  # To install packages for conform and nvim-lint
  plugins.none-ls = {
    enable = false;
    sources = {
      code_actions = {
        ts_node_action.enable = true;
        statix.enable = true;
        refactoring.enable = true;
      };
      diagnostics = {
        statix.enable = true;
        deadnix.enable = true;
        selene.enable = true;
        pylint.enable = true;
      };
      formatting = {
        shfmt.enable = true;
        stylua.enable = true;
        nixpkgs_fmt.enable = true;
        black.enable = true;
        prettier.enable = true;
      };
    };
  };
}
