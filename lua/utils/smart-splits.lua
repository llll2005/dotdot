return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  opts = {
    ignored_filetypes = { "nofile", "quickfix", "prompt" },
    ignored_buftypes = { "neo-tree", "undotree", "Outline", "edgy" },
    default_amount = 3,
    at_edge = "wrap",
    multiplexer_integration = "kitty",
  },
  keys = {
    -- 使用 Alt + 方向鍵進行跨視窗導航
    { "<A-Left>",  function() require("smart-splits").move_cursor_left() end,  desc = "Split: Move Left" },
    { "<A-Down>",  function() require("smart-splits").move_cursor_down() end,  desc = "Split: Move Down" },
    { "<A-Up>",    function() require("smart-splits").move_cursor_up() end,    desc = "Split: Move Up" },
    { "<A-Right>", function() require("smart-splits").move_cursor_right() end, desc = "Split: Move Right" },

    -- 視窗交換 (Alt + Shift + 方向鍵) - 讓你隨時調整四象限內容
    { "<A-S-Left>",  function() require("smart-splits").swap_buf_left() end,  desc = "Split: Swap Left" },
    { "<A-S-Down>",  function() require("smart-splits").swap_buf_down() end,  desc = "Split: Swap Down" },
    { "<A-S-Up>",    function() require("smart-splits").swap_buf_up() end,    desc = "Split: Swap Up" },
    { "<A-S-Right>", function() require("smart-splits").swap_buf_right() end, desc = "Split: Swap Right" },

    -- 保留原有的縮放模式快捷鍵
    { "<leader>r", function() require("smart-splits").start_resize_mode() end, desc = "Split: Resize Mode" },
  },
}