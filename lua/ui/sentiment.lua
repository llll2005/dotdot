return {
  "utilyre/sentiment.nvim",
  version = "*",
  event = "VeryLazy", -- 進到編輯器再載入，不影響啟動速度
  init = function()
    -- 2026 必備：禁用 Neovim 內建的舊版 matchparen，避免雙重渲染
    vim.g.loaded_matchparen = 1
  end,
  opts = {
    -- 包含的緩衝區類型
    included_buftypes = {
      [""] = true, -- 一般檔案
    },
    -- 包含的模式
    included_modes = {
      n = true, -- 普通模式
      i = true, -- 插入模式 (這對寫 code 很有幫助)
    },
    -- 2026 優化延遲：針對高刷螢幕調整
    -- 原本 50ms 在高重複頻率下可能會太頻繁，100ms 是效能與直覺的平衡點
    delay = 100,
    -- 搜尋範圍 (行數)
    limit = 100,
    -- 定義要匹配的成對符號
    pairs = {
      { "(", ")" },
      { "{", "}" },
      { "[", "]" },
    },
  },
}