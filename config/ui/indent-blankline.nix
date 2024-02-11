{
  plugins = {
    indent-blankline = {
      enable = true;
      indent = {
        char = "│"; # "│" or "▎"
        tabChar = "│";
      };
      scope.enabled = false;
      exclude = {
        buftypes = [ "terminal" "nofile" ];
        filetypes = [
          "help"
          "alpha"
          "dashboard"
          "neo-tree"
          "Trouble"
          "trouble"
          "lazy"
          "mason"
          "notify"
          "toggleterm"
          "lazyterm"
        ];
      };
    };
  };
}
