return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify", -- 確保通知能漂亮彈出
  },
  opts = {
    -- 1. 命令列設定 (Command Palette 風格)
    cmdline = {
      enabled = true,
      view = "cmdline_popup", -- 讓命令列彈出在螢幕中上部
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      },
    },

    -- 2. 訊息與通知整合
    messages = {
      enabled = true,
      view = "notify", -- 預設訊息改用右上角通知顯示
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = "virtualtext", -- 搜尋計數顯示在行末，不干擾畫面
    },

    -- 3. LSP 整合 (視覺化補強)
    lsp = {
      progress = {
        enabled = true,
        format = "lsp_progress",
        format_done = "lsp_progress_done",
        view = "mini", -- 左下角或右下角的小型進度條
      },
      override = {
        -- 使用 Noice 渲染 LSP 的文檔與補全說明
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = { enabled = true },
      signature = { enabled = true },
    },

    -- 4. 針對你的 Predator 高刷螢幕優化
    notify = {
      enabled = true,
      view = "notify",
      fps = 144, -- 鎖定 144Hz，動畫極致絲滑
      stages = "fade",
    },

    -- 5. 預設模式 (快捷開啟功能)
    presets = {
      bottom_search = false, -- 我們要用彈出式搜尋
      command_palette = true, -- 將 cmdline 與彈窗結合，超美觀
      long_message_to_split = true, -- 長訊息自動開啟分屏顯示
      lsp_doc_border = true, -- 給 LSP 說明文件加上邊框
    },

    -- 6. 智慧移動 (避讓功能)
    smart_move = {
      enabled = true, -- 當有浮動視窗遮擋時，自動移動通知位置
      excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
    },
  },
  keys = {
    -- 2026 快捷鍵：查看歷史通知 (對考研複習紀錄很有用)
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>sn", "<cmd>Noice<cr>", desc = "Noice: Show Message History" },
    { "<leader>sl", "<cmd>Noice last<cr>", desc = "Noice: Show Last Message" },
  },
}