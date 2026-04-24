return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    config = function()
      local highlight = {
        "Indent1",
        "Indent2",
        "Indent3",
        "Indent4",
        "Indent5",
        "Indent6",
      }

      vim.api.nvim_set_hl(0, "Indent1", { fg = "#3b4261" })
      vim.api.nvim_set_hl(0, "Indent2", { fg = "#3b4261" })
      vim.api.nvim_set_hl(0, "Indent3", { fg = "#3b4261" })
      vim.api.nvim_set_hl(0, "Indent4", { fg = "#3b4261" })
      vim.api.nvim_set_hl(0, "Indent5", { fg = "#3b4261" })
      vim.api.nvim_set_hl(0, "Indent6", { fg = "#3b4261" })

      require("ibl").setup({
        indent = {
          char = "│",
          highlight = highlight,
        },
        scope = {
          enabled = true,
          show_start = false,
          show_end = false,
        },
      })
    end,
  },
}
