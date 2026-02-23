return {
  "ghillb/cybu.nvim",
  branch = "main",
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
  keys = {
    -- 保持你的習慣：[b / ]b 線性切換，Tab / S-Tab 根據最近使用切換
    { "[b", "<Plug>(CybuPrev)", desc = "Buffer: Previous" },
    { "]b", "<Plug>(CybuNext)", desc = "Buffer: Next" },
    { "<tab>", "<Plug>(CybuLastusedNext)", desc = "Buffer: Last Used Next" },
    { "<s-tab>", "<Plug>(CybuLastusedPrev)", desc = "Buffer: Last Used Prev" },
  },
  opts = {
    position = {
      relative_to = "win",
      anchor = "topcenter",
      vertical_offset = 5, -- 稍微往下調一點，避開最頂部的 dropbar
      horizontal_offset = 0,
      max_win_height = 5,
      max_win_width = 0.5,
    },
    style = {
      path = "relative",
      border = "rounded", -- 配合你的圓角泡泡風格
      separator = " ",
      padding = 1,
      hide_buffer_id = true,
      devicons = {
        enabled = true,
        colored = true,
      },
      highlights = {
        -- 2026 建議：連結到你主題的標準高亮組，確保透明背景效果
        current_buffer = "PmenuSel",
        adjacent_buffers = "Comment",
        background = "NormalFloat",
        border = "FloatBorder",
      },
    },
    behavior = {
      mode = {
        default = {
          switch = "immediate",
          view = "rolling",
        },
        last_used = {
          switch = "on_close", -- 這是最像 Alt-Tab 的模式
          view = "paging",
        },
      },
    },
    display_time = 750, -- 顯示 0.75 秒後自動消失
    exclude = { "neo-tree", "qf", "help", "Notify", "edgy" },
  },
}