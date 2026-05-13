return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown" },
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
        config = function()
            require("render-markdown").setup({
                -- pipe_table = {
                --     style = "full",
                --     cell = "padded",
                -- },
            })
        end,
    },
}
