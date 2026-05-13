return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            -- Setup nvim-treesitter (optional, uses defaults if not called)
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            -- Install parsers
            require("nvim-treesitter").install({
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

            -- Enable highlighting and indentation for supported filetypes only
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "lua",
                    "python",
                    "c",
                    "cpp",
                    "bash",
                    "sh",
                    "json",
                    "markdown",
                    "java",
                    "yaml",
                },
                callback = function()
                    vim.treesitter.start()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
