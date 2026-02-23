return {
  "echasnovski/mini.animate",
  event = "VeryLazy", -- 動畫不需要在啟動時載入，進到介面再開即可
  config = function()
    local animate = require("mini.animate")

    -- 2026 優化邏輯：檢測是否在 Neovide 中執行
    -- Neovide 自帶平滑游標與捲動，如果重複開啟 mini.animate 會變得很卡
    local is_neovide = vim.g.neovide ~= nil

    animate.setup({
      -- 1. 游標動畫
      cursor = {
        -- 如果是 Neovide，我們就關閉 mini.animate 的游標動畫，交給 GPU 處理
        enable = not is_neovide,
        timing = animate.gen_timing.linear({ duration = 75, unit = "total" }), -- 縮短時間，減少殘影
        path = animate.gen_path.line({
          predicate = function() return true end,
        }),
      },

      -- 2. 垂直捲動動畫
      scroll = {
        enable = not is_neovide, -- 同樣，Neovide 使用者建議關閉此項
        timing = animate.gen_timing.linear({ duration = 75, unit = "total" }),
        subscroll = animate.gen_subscroll.equal({ max_output_steps = 60 }),
      },

      -- 3. 視窗縮放動畫 (這在 Hyprland 下操作多個分屏非常帥)
      resize = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 60, unit = "total" }),
        subresize = animate.gen_subresize.equal(),
      },

      -- 4. 視窗開啟動畫
      open = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 75, unit = "total" }),
        winconfig = animate.gen_winconfig.wipe({ direction = "from_edge" }),
        winblend = animate.gen_winblend.linear({ from = 80, to = 100 }),
      },

      -- 5. 視窗關閉動畫
      close = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 75, unit = "total" }),
        winconfig = animate.gen_winconfig.wipe({ direction = "to_edge" }),
        winblend = animate.gen_winblend.linear({ from = 100, to = 80 }),
      },
    })
  end,
}