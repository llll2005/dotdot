return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerToggle", "OverseerBuild" },
  opts = {
    -- 介面設定
    templates = { "builtin" }, -- 載入內建模板 (Makefile, cargo, npm 等)
    task_list = {
      direction = "right", -- 任務清單顯示在右側
      bindings = {
        ["<C-l>"] = false, -- 避免與你的視窗跳轉快捷鍵衝突
        ["<C-h>"] = false,
      },
    },
    -- 自動追蹤：當編譯失敗時，自動彈出清單
    strategy = {
      "display_notifications",
      serviced = {
        on_status = function(status)
          if status == "FAILURE" then
            vim.cmd("OverseerToggle")
          end
        end,
      },
    },
  },
  keys = {
    { "<leader>oo", "<cmd>OverseerToggle<cr>", desc = "Overseer: Toggle Panel" },
    { "<leader>or", "<cmd>OverseerRun<cr>",    desc = "Overseer: Run Task" },
    { "<leader>oi", "<cmd>OverseerInfo<cr>",   desc = "Overseer: Info" },
  },
}