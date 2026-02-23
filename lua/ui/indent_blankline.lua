return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  main = "ibl", -- 2026 規範：指定主模組名稱
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require("ibl.hooks")

    -- 1. 註冊彩虹色高亮
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    -- 2. 設定 IBL
    require("ibl").setup({
      indent = {
        highlight = highlight,
        char = "▎", -- 使用更細、更現代的線條
      },
      -- 核心功能：當前作用域 (Scope) 高亮
      -- 這能讓你一眼看出目前在哪個 { } 裡面
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = { "RainbowViolet" }, -- 作用域線條使用紫色高亮
      },
      exclude = {
        filetypes = {
          "help", "alpha", "dashboard", "neo-tree",
          "Trouble", "lazy", "mason", "notify", "toggleterm",
        },
      },
    })
  end,
}