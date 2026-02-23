return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- 1. 儀表板設定
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" }, -- 顯示 Arch 或 Neovim Logo
        { section = "keys", gap = 1, padding = 1 }, -- 快捷鍵導航
        { icon = " ", title = "最近檔案", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "專案目錄", section = "projects", indent = 2, padding = 1 },
        { section = "startup" }, -- 顯示啟動時間
      },
    },
    -- 2. 終端機設定
    terminal = { enabled = true },
    -- 3. 其他好用小工具 (2026 標配)
    notifier = { enabled = true }, -- 取代 nvim-notify，更輕量漂亮的通知
    bigfile = { enabled = true },  -- 開啟超大檔案時自動優化效能
    words = { enabled = true },    -- 自動高亮游標下相同的單字
  },
  keys = {
    -- 快速打開終端
    { "<leader>fT", function() Snacks.terminal() end, desc = "Terminal (Float)" },
    -- 快速找檔案 (如果沒裝 Telescope，Snacks 也有內建極速搜尋)
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    -- 顯示通知紀錄
    { "<leader>un", function() Snacks.notifier.show_history() end, desc = "Notification History" },
  },
}