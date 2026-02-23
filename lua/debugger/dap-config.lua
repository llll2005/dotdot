return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio", -- 2026 DAP-UI 必備依賴
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "mfussenegger/nvim-dap-python", -- 專為 Python 優化
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- 1. Mason-DAP 自動化：不再需要手動下載 lldb
    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb", "python" },
      automatic_installation = true,
      handlers = {
        -- 2026 建議：使用 Mason 預設處理器自動關聯適配器
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
      },
    })

    -- 2. UI & 虛擬文字
    dapui.setup({
      -- 你可以根據 Predator 螢幕比例調整寬度
      layouts = { {
        elements = {
          { id = "scopes", size = 0.25 },
          { id = "breakpoints", size = 0.25 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 0.25 },
        },
        position = "left",
        size = 40,
      }, {
        elements = {
          { id = "repl", size = 0.5 },
          { id = "console", size = 0.5 },
        },
        position = "bottom",
        size = 10,
      } },
    })

    require("nvim-dap-virtual-text").setup({
      commented = true, -- 在註解中顯示變數值
      highlight_changed_variables = true,
      show_stop_reason = true,
    })

    -- 3. 視覺圖示 (Nerd Font v3)
    local icons = {
      Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint          = { " ", "DiagnosticError" },
      BreakpointCondition = { " ", "DiagnosticError" },
      BreakpointRejected  = { " ", "DiagnosticError" },
      LogPoint            = { "󰛼 ", "DiagnosticInfo" },
    }
    for name, sign in pairs(icons) do
      vim.fn.sign_define("Dap" .. name, { text = sign[1], texthl = sign[2], linehl = sign[3], numhl = sign[3] })
    end

    -- 4. 自動開啟 UI (整合 Edgy)
    -- 注意：如果你在 edgy.lua 已經定義了 dapui，這裡可以保持 open
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    -------------------------
    -- 5. 語言特定設定 (C++ / Rust / C)
    -------------------------
    -- 使用 codelldb：它在 Linux 下效能極強且支援 LLDB 格式化
    dap.configurations.cpp = {
      {
        name = "Launch file (codelldb)",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("可執行檔路徑: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp

    -------------------------
    -- 6. Python 設定
    -------------------------
    require("dap-python").setup("python") -- 預設使用系統 python

    -------------------------
    -- 7. 快捷鍵 (2026 現代化配置)
    -------------------------
    local map = vim.keymap.set
    map("n", "<F5>", dap.continue, { desc = "DAP: Continue/Start" })
    map("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
    map("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
    map("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
    map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
    map("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
  end
}