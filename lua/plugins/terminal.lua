return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "horizontal",
        size = 15,
        start_in_insert = true,
        persist_size = true,
        close_on_exit = true,
      })

      local Terminal = require("toggleterm.terminal").Terminal

      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
      })

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end
    end,
  },
}
