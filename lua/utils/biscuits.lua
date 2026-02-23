return {
  "code-biscuits/nvim-biscuits",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "BufReadPost", -- 進到檔案才啟動，節省首頁開啟時間
  opts = {
    -- 1. 2026 現代化圖標與視覺
    default_config = {
      max_length = 20, -- 保持短小精悍，避免遮住右側的代碼
      min_distance = 8, -- 程式碼區塊超過 8 行才顯示，避免簡單小函數顯得凌亂
      prefix_string = " 󰆤 ", -- 改用 Nerd Font 的連結圖示，比 📎 更具代碼感
      gui_style = "italic", -- 斜體顯示，增加層次感
    },
    language_config = {
      -- 針對你考研常用的 C++ 進行特定優化
      cpp = {
        prefix_string = " 󰙲 ", -- C++ 專用圖示
      },
      python = {
        prefix_string = "  ",
      },
    },
  },
  config = function(_, opts)
    require("nvim-biscuits").setup(opts)

    -- 2. 效能優化：配合你的透明背景主題
    -- 讓 Biscuit 的文字顏色稍微暗一點，不要搶了主體代碼的鋒芒
    vim.api.nvim_set_hl(0, "NvimBiscuitColor", { link = "Comment", italic = true })
  end,
}