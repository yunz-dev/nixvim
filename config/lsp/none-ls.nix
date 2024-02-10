{
  # To install packages for conform and nvim-lint
  plugins.none-ls = {
    enable = false;
    sources = {
      code_actions = {
        eslint_d.enable = true;
        statix.enable = true;
      };
      diagnostics = {
        statix.enable = true;
        deadnix.enable = true;
        luacheck.enable = true;
        flake8.enable = true;
        eslint_d.enable = true;
      };
      formatting = {
        shfmt.enable = true;
        stylua.enable = true;
        nixpkgs_fmt.enable = true;
        rustfmt.enable = true;
        black.enable = true;
        prettier.enable = true;
        jq.enable = true;
      };
    };
  };
}
