vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 5

-- 开启折叠
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99


-- 弹窗颜色(在color scheme 之后设置)
--vim.api.nvim_set_hl(0, "Pmenu", { bg = "#bcbcbc", fg="#c0caf5" })
--vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#5e81ac", fg = "#ffffff", bold=true })
--vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#2a2e3f" })
--vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#7aa2f7" })

-- 行内显示警告
vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "●",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- 复制内容高亮
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 200,
        })
    end,
})

vim.opt.termguicolors = true
vim.opt.cursorline = true
