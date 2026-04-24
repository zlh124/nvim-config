return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("tokyonight")
            vim.api.nvim_set_hl(0, "Pmenu", { bg = "#bcbcbc", fg = "#c0caf5" })
            vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#414868", fg = "#ffffff", bold = true })
            vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#2a2e3f" })
            vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#7aa2f7" })
        end,
    },
}
