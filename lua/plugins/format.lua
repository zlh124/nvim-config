return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "ruff_format", "black" },
                    lua = { "stylua" },
                    json = { "jq" },
                    markdown = { "prettier" },
                },

                format_on_save = {
                    timeout_ms = 1000,
                    lsp_fallback = true,
                },
            })
        end,
    },
}
