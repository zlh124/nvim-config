return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.config").setup({})

            require("nvim-treesitter.install").install({
                "lua",
                "python",
                "c",
                "cpp",
                "bash",
                "json",
                "markdown",
                "markdown_inline",
                "java",
                "yaml",
            })
        end,
    },
}
