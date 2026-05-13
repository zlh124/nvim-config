return {
    {
        "stevearc/aerial.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("aerial").setup({
                backends = { "lsp", "treesitter" },
                layout = {
                    max_width = { 40, 0.2 },
                    min_width = 20,
                    default_direction = "right",
                },
                show_guides = true,
                attach_mode = "window",
            })
        end,
        keys = {
            { "<leader>o", "<cmd>AerialToggle<cr>", desc = "Toggle outline" },
        },
    },
}
