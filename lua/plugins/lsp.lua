return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Pyright 配置：自动检测虚拟环境
            vim.lsp.config("pyright", {
                capabilities = capabilities,
                settings = {
                    python = {
                        pythonPath = vim.fn.exepath("python3"),
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                            typeCheckingMode = "basic",
                        },
                    },
                },
            })
            vim.lsp.enable("pyright")

            -- Lua LSP 配置
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })
            vim.lsp.enable("lua_ls")

            -- C++ LSP 配置 (clangd)
            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                },
            })
            vim.lsp.enable("clangd")
        end,
    },
}
