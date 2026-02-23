return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects", -- 2026 建議：增加更強的代碼塊操作
  },
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      -- 1. 2026 現代化安裝策略
      -- 不需要列出所有語言，Mason 會幫你處理
      ensure_installed = {
        "c", "cpp", "lua", "vim", "vimdoc", "query", "python",
        "rust", "markdown", "markdown_inline", "bash", "json", "yaml"
      },
      sync_install = false,
      auto_install = true, -- 當進入未安裝語言的檔案時，自動幫你裝好

      -- 2. 核心高亮優化
      highlight = {
        enable = true,
        -- [重要] 關閉額外的正則高亮，2026 年的 TS 已經足夠強大，開啟這個只會變慢
        additional_vim_regex_highlighting = false,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },

      -- 3. 自動縮排 (Indent)
      indent = { enable = true },

      -- 4. [新增] 增量選取：資工開發的神器
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",    -- 按 Enter 開始選取
          node_incremental = "<CR>", -- 繼續按 Enter 擴大範圍 (變數 -> 括號 -> 函數)
          scope_incremental = false,
          node_decremental = "<BS>", -- 按 Backspace 縮小選取範圍
        },
      },

      -- 5. [新增] Textobjects：直接用鍵位操作函數或類別
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer", -- 選取整個函數
            ["if"] = "@function.inner", -- 選取函數內容
            ["ac"] = "@class.outer",    -- 選取整個類別
            ["ic"] = "@class.inner",    -- 選取類別內容
          },
        },
      },
    })

    -- 6. 你的自定義 Zimbu Parser (保留原有邏輯)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.zimbu = {
      install_info = {
        url = "~/projects/tree-sitter-zimbu",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "zu",
    }
  end,
}