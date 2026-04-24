return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local servers = { "pyright", "lua_ls" }
            --      local lspconfig = require("lspconfig")
            --
            --      lspconfig.pyright.setup({
            --          settings = {
            --              python = {
            --                  analysis = {
            --                      typeCheckingMode = "basic"
            --                  }
            --              }
            --          }
            --      })


            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })
                vim.lsp.enable(server)
            end
        end,
    },
}
