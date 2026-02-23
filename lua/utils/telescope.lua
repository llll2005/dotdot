return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- 極速 C 語言實作過濾
    "nvim-telescope/telescope-ui-select.nvim", -- 美化 LSP 選單
  },
  keys = {
    -- 保持你的習慣，並加入更有用的資工開發選單
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep (Text)" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP: Symbols" }, -- 找函數神器
    { "<leader>fm", "<cmd>Telescope bookmarks list<cr>", desc = "Find Bookmarks" }, -- 聯動你的書籤
  },
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        -- 1. 2026 視覺優化：針對 16 吋大螢幕使用橫向佈局
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = { preview_width = 0.55 },
          width = 0.9,
          height = 0.8,
        },
        prompt_prefix = "   ",
        selection_caret = " 󰁕 ",

        -- 2. 解決你的痛點：在插入模式也能快速移動
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<esc>"] = actions.close, -- 按一下 Esc 直接關閉，不用跳回 Normal
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    -- 載入擴充套件
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
    telescope.load_extension("bookmarks") -- 聯動你剛剛設定的 bookmarks 插件
  end,
}