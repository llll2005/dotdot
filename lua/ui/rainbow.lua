return {
  "hiphish/rainbow-delimiters.nvim",
  dependencies = "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    -- 1. 設定策略：使用 Tree-sitter 進行精準解析
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"], -- 預設全局開啟
        vim = rainbow_delimiters.strategy["local"],  -- vim 檔案使用局部策略
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      -- 2. 設定顏色對應：直接使用你在 IBL 裡定義好的 Rainbow 顏色組
      highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      },
    }
  end,
}
