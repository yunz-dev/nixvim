{
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;
    popupBorderStyle = "rounded"; # “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code

    filesystem = {
      bindToCwd = false;
      useLibuvFileWatcher = true;
      followCurrentFile.enabled = true;
    };

    window.mappings = {
      "<space>" = "none";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle reveal_force_cwd<cr>";
      options = {
        silent = true;
        desc = "Explorer NeoTree (root dir)";
      };
    }
  ];
}
