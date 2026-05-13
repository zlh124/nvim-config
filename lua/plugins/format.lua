return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "ruff_format", "black" },
                    lua = { "stylua" },
                    c = { "clang_format" },
                    cpp = { "clang_format" },
                    json = { "jq" },
                    markdown = { "prettier" },
                },

                formatters = {
                    clang_format = {
                        prepend_args = {
                            "--style",
                            "{BasedOnStyle: LLVM, IndentWidth: 4, UseTab: Never, ColumnLimit: 120}",
                        },
                    },
                },

                format_on_save = {
                    timeout_ms = 1000,
                    lsp_fallback = true,
                },
            })
        end,
    },
}
