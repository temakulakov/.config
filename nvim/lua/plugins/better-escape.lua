return {
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",  -- загружается при входе в режим вставки
    config = function()
      require("better_escape").setup({
        mapping = {"jk", "jj"},   -- последовательности для выхода из режима вставки
        timeout = vim.o.timeoutlen,
        clear_empty_lines = true,
        keys = "<Esc>",
      })
    end,
  },
}

