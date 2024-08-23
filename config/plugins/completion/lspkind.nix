{
  plugins.lspkind = {
    enable = true;
    cmp = {
      menu = {
        nvim_lsp = "[LSP]";
        nvim_lua = "[api]";
        path = "[path]";
        luasnip = "[snip]";
        buffer = "[buffer]";
        neorg = "[neorg]";
      };
    };
    symbolMap = {
      Namespace = "󰌗";
      Text = "󰊄";
      Method = "󰆧";
      Function = "󰡱";
      Constructor = "";
      Field = "󰜢";
      Variable = "󰀫";
      Class = "󰠱";
      Interface = "";
      Module = "󰕳";
      Property = "";
      Unit = "󰑭";
      Value = "󰎠";
      Enum = "";
      Keyword = "󰌋";
      Snippet = "";
      Color = "󰏘";
      File = "󰈚";
      Reference = "󰈇";
      Folder = "󰉋";
      EnumMember = "";
      Constant = "󰏿";
      Struct = "󰙅";
      Event = "";
      Operator = "󰆕";
      TypeParameter = "";
      Table = "";
      Object = "󰅩";
      Tag = "";
      Array = "[]";
      Boolean = "";
      Number = "";
      Null = "󰟢";
      String = "󰉿";
      Calendar = "";
      Watch = "󰥔";
      Package = "";
      Copilot = "";
      Codeium = "";
      TabNine = "";
    };

    extraOptions = {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };
}
