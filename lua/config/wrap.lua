-- 默认关闭 wrap（适合写代码）
vim.opt.wrap = false

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text", "gitcommit", "typst" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.breakindent = true
        vim.opt.showbreak = "↪ "
    end,
})
