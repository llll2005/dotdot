-- 2026 現代化自動儲存方案 (原生 Autocmd)
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = vim.api.nvim_create_augroup("SimpleAutoSave", { clear = true }),
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    -- 只在檔案有變動、可讀寫、且不是臨時檔案時儲存
    if vim.bo[buf].modified and vim.bo[buf].buftype == "" and vim.fn.getbufvar(buf, "&modifiable") == 1 then
      vim.cmd("silent! update")
      -- 如果你還是想要有提示，可以用下面這行簡單的 print
      -- vim.api.nvim_echo({{ "󰄳  AutoSaved", "NavicSeparator" }}, false, {})
    end
  end,
})