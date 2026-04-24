return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
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
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
