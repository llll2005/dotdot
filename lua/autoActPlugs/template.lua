return {
  "glepnir/template.nvim",
  cmd = { "Template", "Tempgraph" },
  config = function()
    local path = vim.fn.stdpath("config") .. "/templates"

    require("template").setup({
      temp_dir = path,
      author = "hzl",
      email = "test@gmail.com", -- 你可以修改為你的信箱
    })

    -- 自動更新 Header 的邏輯 (在存檔前觸發)
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("UpdateHeader", { clear = true }),
      callback = function()
        -- 只檢查前 15 行，避免大檔案掃描效能問題
        local n = math.min(vim.api.nvim_buf_line_count(0), 15)
        local lines = vim.api.nvim_buf_get_lines(0, 0, n, false)
        local time = os.date("%Y-%m-%d %H:%M:%S")

        for i, line in ipairs(lines) do
          if line:match("Last modified:") then
            -- 根據不同語言的註解符號進行替換
            local comment_char = vim.bo.commentstring:gsub("%%s", "")
            local new_line = string.format("%s Last modified: %s", comment_char:trim(), time)
            vim.api.nvim_buf_set_lines(0, i - 1, i, false, { new_line })
            break
          end
        end
      end,
    })
  end
}