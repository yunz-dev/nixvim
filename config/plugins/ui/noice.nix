{
  plugins.noice = {
    enable = true;
    presets = {
      bottom_search = true;
      command_palette = true;
      long_message_to_split = true;
    };
    notify.enabled = false;
    routes = [
      {
        filter = {
          event = "msg_show";
          any = [
            { find = "%d+L, %d+B"; }
            { find = "; after #%d+"; }
            { find = "; before #%d+"; }
          ];
        };
        view = "mini";
      }
    ];
  };

  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>sn";
      action = "+noice";
    }
    {
      mode = "n";
      key = "<leader>snl";
      action = "<cmd>lua require('noice').cmd('last')<cr>";
      options = {
        desc = "Noice Last Message";
      };
    }
    {
      mode = "n";
      key = "<leader>snh";
      action = "<cmd>lua require('noice').cmd('history')<cr>";
      options = {
        desc = "Noice History";
      };
    }
    {
      mode = "n";
      key = "<leader>sna";
      action = "<cmd>lua require('noice').cmd('all')<cr>";
      options = {
        desc = "Noice All";
      };
    }
    {
      mode = "n";
      key = "<leader>snd";
      action = "<cmd>lua require('noice').cmd('dismiss')<cr>";
      options = {
        desc = "Noice Dismiss";
      };
    }
  ];
}
