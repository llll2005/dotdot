return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    animate = { enabled = true },
    left = {
      -- [左上] 檔案瀏覽器
      {
        title = "󰉓 Files",
        ft = "neo-tree",
        filter = function(buf) return vim.b[buf].neo_tree_source == "filesystem" end,
        size = { height = 0.5 }, -- 佔左側一半高度
      },
      -- [左下] 歷史紀錄
      {
        title = "󰄲 History",
        ft = "undotree",
        size = { height = 0.5 },
      },
    },
    right = {
      -- [右上] 已開啟檔案 (Buffers)
      {
        title = "󰅒 Buffers",
        ft = "neo-tree",
        filter = function(buf) return vim.b[buf].neo_tree_source == "buffers" end,
        size = { height = 0.4 }, -- 佔右側 40%
        pinned = true,
      },
      -- [右下] 函數大綱 (Symbols)
      {
        title = "󰗚 Symbols",
        ft = "Outline",
        size = { height = 0.6 },
        pinned = true,
      },
    },
    bottom = {
      { ft = "toggleterm", size = { height = 0.3 } },
      { ft = "overseer", title = "Tasks" },
    },
  },
}