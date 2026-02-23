return {
  "tomasky/bookmarks.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("bookmarks").setup({
      -- 1. 持久化存儲設定 (保留你的個人偏好)
      save_file = vim.fn.expand("$HOME/.bookmarks"),
      -- 2. 2026 現代化圖標 (Nerd Font v3)
      keywords = {
        ["@t"] = "󰄲 ", -- Todo
        ["@w"] = "󱈸 ", -- Warn
        ["@f"] = "󱆟 ", -- Fix
        ["@n"] = "󰎚 ", -- Note
      },
      on_attach = function(bufnr)
        local bm = require("bookmarks")
        local map = vim.keymap.set
        local opts = { buffer = bufnr, silent = true }

        -- 3. 保持你的核心快捷鍵習慣
        map("n", "mm", bm.bookmark_toggle, { desc = "Bookmark: Toggle", unpack(opts) })
        map("n", "mi", bm.bookmark_ann, { desc = "Bookmark: Annotate", unpack(opts) })
        map("n", "mc", bm.bookmark_clean, { desc = "Bookmark: Clear All", unpack(opts) })
        map("n", "mn", bm.bookmark_next, { desc = "Bookmark: Next", unpack(opts) })
        map("n", "mp", bm.bookmark_prev, { desc = "Bookmark: Prev", unpack(opts) })

        -- 2026 聯動：改用 Telescope 顯示書籤列表 (比 Quickfix 漂亮多了)
        map("n", "ml", "<cmd>Telescope bookmarks list<cr>", { desc = "Bookmark: Search with Telescope", unpack(opts) })
      end,
    })
  end,
}