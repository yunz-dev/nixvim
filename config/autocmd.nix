{
  autoCmd = [
    # highlight Text on Yank
    {
      event = "TextYankPost";
      callback = {
        __raw = "
        function()
          vim.highlight.on_yank()
        end
      ";
      };
    }
  ];
}
