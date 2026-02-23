return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim", -- windows.nvim 的核心動畫庫
  },
  event = "WinNew", -- 當新視窗建立時載入
  config = function()
    -- 1. 基礎系統設定 (保留你原本的偏好)
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false

    require('windows').setup({
      autowidth = {
        enable = true, -- [關鍵] 開啟自動寬度，聚焦在哪，哪裡就放大
        winwidth = 0.7, -- 聚焦視窗佔螢幕 80% 寬度
      },
      ignore = {
        buftype = { "quickfix" },
        filetype = {
          "neo-tree", "undotree", "gundo", "DiffviewFiles",
          "edgy", "overseer", "trouble", "notify"
        },
      },
      animation = {
        enable = true,
        duration = 200,
        fps = 60, -- 針對你 Predator 筆電的高刷優化
      },
    })

    -- 2. 快捷鍵 (優化 desc 方便 Which-key 顯示)
    local map = vim.keymap.set
    map('n', '<C-w>z', '<cmd>WindowsMaximize<cr>', { desc = "Windows: Maximize" })
    map('n', '<C-w>_', '<cmd>WindowsMaximizeVertically<cr>', { desc = "Windows: Maximize Vertical" })
    map('n', '<C-w>|', '<cmd>WindowsMaximizeHorizontally<cr>', { desc = "Windows: Maximize Horizontal" })
    map('n', '<C-w>=', '<cmd>WindowsEqualize<cr>', { desc = "Windows: Equalize" })
  end,
}