return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("todo-comments").setup({
      signs = true,
      sign_priority = 8,
      keywords = {
        FIX = {
          icon = " ",
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE",
        bg = "BOLD",
      },
      merge_keywords = true,
      highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before = "",
        keyword = "wide", -- 保持你喜歡的寬度高亮
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true, -- [關鍵] 依賴 Treesitter，只在註解中生效
        max_line_len = 400,
        exclude = {},
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" }
      },
    })

    -- 2026 快捷鍵整合：搜尋全專案的 TODO
    local map = vim.keymap.set
    map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next TODO" })
    map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Prev TODO" })

    -- 聯動 Snacks Picker (如果你喜歡 Snacks) 或 Telescope
    --map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Search TODOs" })
    -- 在 keys 裡改用這個
    map("n", "<leader>td", function() Snacks.picker.todo_comments() end, { desc = "Todo Comments (Snacks)" })
  end,
}