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
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99


-- 弹窗颜色(在color scheme 之后设置)
--vim.api.nvim_set_hl(0, "Pmenu", { bg = "#bcbcbc", fg="#c0caf5" })
--vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#5e81ac", fg = "#ffffff", bold=true })
--vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#2a2e3f" })
--vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#7aa2f7" })

-- 行内显示警告
vim.diagnostic.config({
  virtual_text =  {
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


-- 文件夹导航
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(function()
      local args = vim.fn.argv()

      if #args == 0 then
        vim.api.nvim_set_current_dir(vim.fn.expand("~"))
        return
      end

      local path = args[1]

      -- 处理 oil.nvim 的 URI
      path = path:gsub("^oil://", "")

      path = vim.fn.fnamemodify(path, ":p")

      local stat = vim.loop.fs_stat(path)

      if stat then
        if stat.type == "directory" then
          vim.api.nvim_set_current_dir(path)
        else
          vim.api.nvim_set_current_dir(vim.fn.fnamemodify(path, ":h"))
        end
      end
    end)
  end,
})

