return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- 2026 現代化圖示 (與你的 Nerd Font v3 完美契合)
    signs = {
      add          = { text = "▎" }, -- 使用細條狀，視覺上更乾淨
      change       = { text = "▎" },
      delete       = { text = "" },
      topdelete    = { text = "" },
      changedelete = { text = "▎" },
      untracked    = { text = "┆" },
    },

    -- 2026 核心功能：行內 Git Blame
    -- 當你游標停留在某一行，會以虛擬文字顯示誰在哪時改了這行 (這在多人專案超級有用)
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 顯示在行尾
      delay = 500,           -- 停頓 0.5 秒後顯示
    },

    -- 快捷鍵設定 (直接在插件內定義)
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = "Git: " .. desc })
      end

      -- 導航：在改動區塊 (Hunk) 間跳轉
      map("n", "]h", function()
        if vim.wo.diff then return "]h" end
        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
      end, "下一個改動區塊")

      map("n", "[h", function()
        if vim.wo.diff then return "[h" end
        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
      end, "上一個改動區塊")

      -- 操作：預覽、重置、暫存
      map("n", "<leader>hp", gs.preview_hunk, "預覽改動區塊")
      map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "顯示詳細 Blame")
      map("n", "<leader>hd", gs.diffthis, "開啟 Diff 視窗")
    end,
  },
}