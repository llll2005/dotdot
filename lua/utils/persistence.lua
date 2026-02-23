return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- 2026 建議：在讀取緩衝區前就啟動，確保 session 紀錄不遺漏
  opts = {
    -- 1. 存儲路徑 (保持你的個人習慣)
    dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
    -- 2. 存儲選項 (保留 winsize 非常重要，這能鎖定你的四象限寬度)
    options = { "buffers", "curdir", "tabpages", "winsize" },
    save_empty = false,
  },
  keys = {
    -- 2026 高效操作：考研複習一鍵回歸
    { "<leader>qs", function() require("persistence").load() end, desc = "Session: Restore Current Dir" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Session: Restore Last Session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Session: Don't Save Current Session" },
  },
}