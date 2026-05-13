return {
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            require("onedark").setup({
                style = "dark",
                transparent = false,
                term_colors = false,
                ending_tildes = false,

                code_style = {
                    comments = "italic",
                    keywords = "none",
                    functions = "none",
                    strings = "none",
                    variables = "none",
                },

                colors = {},

                highlights = {
                    Comment = { fg = "#5c6370", italic = true },
                    Function = { fg = "#61afef" },
                    Keyword = { fg = "#c678dd" },
                    String = { fg = "#98c379" },
                    Type = { fg = "#e5c07b" },
                    Constant = { fg = "#d19a66" },
                    Identifier = { fg = "#e06c75" },
                }
            })

            require("onedark").load()
        end
    },
    {
        "itchyny/lightline.vim",
        lazy = false,
        dependencies = { "navarasu/onedark.nvim" },
        init = function()
            vim.g.lightline = {
                colorscheme = "onedark",
                active = {
                    left = { { "mode", "paste" }, { "readonly", "filename", "modified" } },
                    right = { { "lineinfo" }, { "percent" }, { "fileformat", "fileencoding", "filetype" } }
                }
            }
        end
    }
}
