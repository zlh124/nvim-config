local session_dir = vim.fn.stdpath('state') .. "/sessions/"

vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,terminal"
vim.fn.mkdir(session_dir, "p")

local function strip_trailing_slash(path)
    return path:gsub("[/\\]+$", "")
end

local function session_file(path)
    path = strip_trailing_slash(path)
    local hash = vim.fn.sha256(path)
    return session_dir .. hash .. '.vim'
end

-- 文件夹导航和 session 恢复
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        local args = vim.fn.argv()

        local workdir = ''
        if #args == 0 then
            workdir = vim.fn.expand("~")
        else
            local path = args[1]

            -- 处理 oil.nvim 的 URI
            path = path:gsub("^oil://", "")

            workdir = vim.fn.fnamemodify(path, ":p")
        end

        local sessfile = session_file(workdir)
        if vim.fn.filereadable(sessfile) == 1 then
            local ok, err = pcall(vim.cmd, "source " .. sessfile)
            if not ok then
                vim.notify("Session 加载失败: " .. err, vim.log.levels.WARN)
            else
                -- 延迟触发 filetype 让 treesitter 完全加载后再挂载
                vim.defer_fn(function()
                    -- 重新应用折叠设置（session 会覆盖）
                    vim.opt.foldmethod = "expr"
                    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    vim.cmd("doautocmd BufRead")
                end, 100)
            end
            return
        end

        local stat = vim.loop.fs_stat(workdir)
        if stat then
            if stat.type == "directory" then
                vim.api.nvim_set_current_dir(workdir)
            else
                vim.api.nvim_set_current_dir(vim.fn.fnamemodify(workdir, ":h"))
            end
        end
    end,
})

-- 退出时保存
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        local cwd = vim.fn.getcwd()
        local file = session_file(cwd)
        local ok, err = pcall(vim.cmd, "mksession! " .. file)
        if not ok then
            vim.notify("Session 保存失败: " .. err, vim.log.levels.WARN)
        end
    end,
})
