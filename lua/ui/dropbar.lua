return {
  "Bekaboo/dropbar.nvim",
  event = "BufReadPost",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim", -- 2026 建議：增加模糊搜尋支援
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>p",
      function()
        require("dropbar.api").pick()
      end,
      desc = "Dropbar: Pick symbols",
    },
  },
  config = function()
    local dropbar_api = require("dropbar.api")

    require("dropbar").setup({
      general = {
        enable = function(buf, win)
          -- 排除掉不需要導航列的檔案類型
          return not vim.tbl_contains({
            "neo-tree",
            "dashboard",
            "TelescopePrompt",
          }, vim.bo[buf].ft)
          and vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      icons = {
        ui = {
          bar = {
            separator = "  ",
            extends = "…",
          },
        },
      },
      -- 整合 vim.ui.select，讓整體的彈出選單風格統一
      vim.ui.select = require('dropbar.utils.menu').select,
    })

    -- 2026 高效操作：當你在導航列時，可以使用 j/k 來選擇符號
    -- 這部分會自動在 dropbar menu 開啟時生效
  end,
}