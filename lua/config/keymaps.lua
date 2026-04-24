vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })

-- 终端
vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<cr>")
vim.keymap.set("t", "<C-\\>", "<cmd>ToggleTerm<cr>")
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>")

-- md 渲染开关
vim.keymap.set("n", "<leader>md", "<cmd>RenderMarkdown toggle<cr>")

-- debug
local dap = require("dap")

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dr", dap.repl.open)

-- format
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
end)

-- git
vim.keymap.set("n", "<leader>g", "<cmd>Neogit<CR>")

-- filesearch
vim.keymap.set("n", "<leader>ss", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>")
