return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    -- 2026 必備：讓註解能根據 Treesitter 自動切換（例如在 TSX 或 Markdown 裡）
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("Comment").setup({
      -- 1. 預設快捷鍵：
      -- gcc: 註解當前行
      -- gbc: 註解當前區塊
      -- gc (visual): 註解選取範圍
      padding = true,     -- 在註解符號後加空格
      sticky = true,      -- 註解後游標保持原位

      -- 2. 針對 2026 Treesitter 的整合
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })

    -- 3. 考研刷題快捷鍵：快速在行末增加註解
    local map = vim.keymap.set
    map("n", "<leader>/", "gcc", { remap = true, desc = "Comment: Toggle Line" })
    map("v", "<leader>/", "gc", { remap = true, desc = "Comment: Toggle Selection" })
  end,
}