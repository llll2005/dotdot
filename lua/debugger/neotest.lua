return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Adapters
    "alfaix/neotest-gtest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "rouge8/neotest-rust",
  },
  keys = {
    { "<leader>tr", function() require("neotest").run.run() end, desc = "Test: Run Nearest" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test: Run File" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Test: Summary Panel" },
    { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Test: Output" },
    { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Test: Debug Nearest" },
  },
  config = function()
    require("neotest").setup({
      -- 整合之前的 Overseer，讓測試在後台跑
      consumers = {
        overseer = require("neotest.consumers.overseer"),
      },
      adapters = {
        -- 1. C++ Google Test 優化版
        require("neotest-gtest").setup({
          debug_adapter = "codelldb", -- 直接對接我們設好的 codelldb
          root = require("neotest.lib").files.match_root_pattern(
            "compile_commands.json", "CMakeLists.txt", ".git"
          ),
        }),
        -- 2. Python 測試
        require("neotest-python")({
          dap = { justMyCode = false },
          runner = "pytest",
        }),
        -- 3. Rust 測試 (考研若用到 Rust 很方便)
        require("neotest-rust"),
        require("neotest-plenary"),
      },
      -- 視覺化設定：符合你的 Bubbles 主題感
      icons = {
        passed = " ",
        running = " ",
        failed = " ",
        skipped = "󰜺 ",
        unknown = " ",
      },
      floating = {
        border = "rounded",
        max_height = 0.8,
        max_width = 0.9,
      },
      summary = {
        mappings = {
          expand = { "<CR>", "i" },
          short = "O",
          run = "r",
          debug = "d",
        },
      },
    })
  end,
}