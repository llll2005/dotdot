-- =============================================================================
-- 此檔案僅保留「尚未模組化」或「輕量級」的插件
-- 大部分核心配置已移至：lua/ui/, lua/utils/, lua/lsp/, lua/debugger/
-- =============================================================================

return {
  ------------------------------------------------------------------------------
  -- 1. 核心開發工具 (Core Libs & Integrations)
  ------------------------------------------------------------------------------
  -- Git 衝突與差異檢視 (2026 必備)
  { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewFileHistory" } },

  -- 終端機文件管理器整合 (Yazi)
  {
    "DreamMaoMao/yazi.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = { { "<leader>yy", "<cmd>Yazi<cr>", desc = "Tools: Open Yazi" } },
  },

  -- 視窗與 Kitty/Tmux 導航增強
  -- 配合你剛才設定的 smart-splits 使用
  { "christoomey/vim-tmux-navigator", lazy = false },

  -- 快速緩衝區切換工具
  { "Yohannfra/Nvim-Switch-Buffer" },

  ------------------------------------------------------------------------------
  -- 2. 文字編輯增強 (Editing Utilities)
  ------------------------------------------------------------------------------


  -- Markdown 增強 (除了 render-md 之外的補充)
  {
    "lukas-reineke/headlines.nvim",
    ft = { "markdown", "rmd", "org" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function() require("headlines").setup() end,
  },

  ------------------------------------------------------------------------------
  -- 3. 其他視覺與主題 (尚未移入 zui_themes.lua 的)
  ------------------------------------------------------------------------------
  {
    'ramojus/mellifluous.nvim',
    lazy = true,
    config = function()
      require('mellifluous').setup({
        dim_inactive = true,
        styles = { comments = { italic = true } },
      })
    end,
  },

  {
    'NTBBloodbath/doom-one.nvim',
    lazy = true,
    init = function()
      vim.g.doom_one_italic_comments = true
      vim.g.doom_one_enable_treesitter = true
      vim.g.doom_one_transparent_background = false
    end,
  },

  ------------------------------------------------------------------------------
  -- 4. 模組化目錄導入 (核心關鍵！)
  -- 確保 lazy.nvim 會去讀取你剛才辛苦重構的那些資料夾
  -- 注意：通常這段是在 lua/core/lazy.lua 裡寫，
  -- 但如果你的 lazy 載入邏輯是讀取這份 init.lua，請確保路徑正確。
  ------------------------------------------------------------------------------
}