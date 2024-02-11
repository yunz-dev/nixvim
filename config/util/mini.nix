{
  plugins = {
    mini = {
      enable = true;
      modules = {
        comment = {
          options = {
            customCommentString = ''
              <cmd>lua require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring<cr>
            '';
          };
        };
        cursorword = { delay = 0; };

        indentscope = {
          symbol = "│";
          draw.delay = 0;
        };
      };
    };
    ts-context-commentstring.enable = true;
  };
}
