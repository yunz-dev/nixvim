{
  plugins.noice = {
    enable = true;
    lsp = {
      override = {
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
        "cmp.entry.get_documentation" = true;
      };
      hover.enabled = false;
      message.enabled = false;
      signature.enabled = false;
      progress.enabled = false;
    };

    presets = {
      bottom_search = true;
      command_palette = true;
      long_message_to_split = true;
      inc_rename = false;
      lsp_doc_border = false;
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
