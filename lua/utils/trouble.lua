return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    -- 2026 高效操作：一鍵打開診斷
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
    { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
    { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
  },
  opts = {
    -- 1. 視覺優化 (配合你的 Predator 16 吋螢幕)
    auto_close = false, -- 當沒有錯誤時是否自動關閉
    auto_open = false,  -- 有錯誤時是否自動打開 (建議手動，避免干擾)
    restore_prev_win = true,
    spacing = 1, -- 增加間距，視覺更清爽

    -- 2. 2026 現代化圖標 (Nerd Font v3)
    icons = {
      indent        = {
        middle     = "  ",
        last       = "  ",
        top        = "  ",
        ws         = "  ",
      },
      folder_closed = " ",
      folder_open   = " ",
      kinds = {
        Array         = " ",
        Boolean       = "󰨙 ",
        Class         = " ",
        Constant      = "󰏿 ",
        Constructor   = " ",
        Enum          = " ",
        -- ... 其餘圖示 Trouble v3 會自動抓取 Nerd Font
      },
    },

    -- 3. 自定義模式
    modes = {
      -- 專為考研 C++ 刷題設計：只顯示當前檔案的 Error
      test = {
        mode = "diagnostics",
        filter = { severity = vim.diagnostic.severity.ERROR },
      },
    },
  },
}