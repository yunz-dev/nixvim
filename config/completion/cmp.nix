{
  plugins = {
    cmp-nvim-lsp.enable = true;
    cmp-emoji.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;
    cmp-cmdline.enable = true;
    cmp = {
      enable = true;
      cmdline = {
        "/" = {
          mapping.__raw = "cmp.mapping.preset.cmdline()";
          sources = [ { name = "buffer"; } ];
        };
        ":" = {
          mapping.__raw = "cmp.mapping.preset.cmdline()";
          sources = [
            { name = "path"; }
            {
              name = "cmdline";
              option.ignore_cmds = [
                "Man"
                "!"
              ];
            }
          ];
        };
      };

      filetype = {
        sql.sources = [
          { name = "buffer"; }
          { name = "vim-dadbod-completion"; }
        ];
      };

      settings = {
        # Preselect first entry
        completion.completeopt = "menu,menuone,noinsert";
        sources = [
          { name = "nvim_lsp"; } # lsp
          { name = "luasnip"; }
          {
            name = "buffer";
            # Words from other open buffers can also be suggested.
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          { name = "path"; }
        ];

        window = {
          completion.border = "rounded";
          documentation.border = "rounded";
        };
        experimental.ghost_text = true;

        mapping = {
          "<Tab>".__raw = ''
            cmp.mapping(function(fallback)
              local luasnip = require("luasnip")
              if luasnip.locally_jumpable(1) then
                luasnip.jump(1)
              end
            end, { "i", "s" })
          '';

          "<S-Tab>".__raw = ''
            cmp.mapping(function(fallback)
              local luasnip = require("luasnip")
              if luasnip.jumpable(-1) then
                luasnip.jump(-1)
              end
            end, { "i", "s" })
          '';

          "<c-n>" = "cmp.mapping(cmp.mapping.select_next_item())";
          "<c-p>" = "cmp.mapping(cmp.mapping.select_prev_item())";
          "<c-e>" = "cmp.mapping.abort()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
        };

        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';

        formatting = {
          fields = [
            "abbr"
            "kind"
            "menu"
          ];
          format.__raw = ''
            function(_, item)
              local icons = {
                Namespace = "󰌗",
                Text = "󰊄",
                Method = "󰆧",
                Function = "󰡱",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "󰕳",
                Property = "",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈚",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
                Table = "",
                Object = "󰅩",
                Tag = "",
                Array = "[]",
                Boolean = "",
                Number = "",
                Null = "󰟢",
                String = "󰉿",
                Calendar = "",
                Watch = "󰥔",
                Package = "",
                Copilot = "",
                Codeium = "",
                TabNine = "",
              }

              local icon = icons[item.kind] or ""
              item.kind = string.format("%s %s", icon, item.kind or "")
              return item
            end
          '';
        };
      };
    };
  };
}
