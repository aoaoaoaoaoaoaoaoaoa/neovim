local view_group = vim.api.nvim_create_augroup("ViewPersistence", {
    clear = true,
})

vim.opt.viewoptions = {
    "cursor",
    "folds",
}

vim.api.nvim_create_autocmd("BufWinEnter", {
    group = view_group,
    callback = function()
        if vim.bo.buftype == "" then
            vim.cmd("silent! loadview")
        end
    end,
})
