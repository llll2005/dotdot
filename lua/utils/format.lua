return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- 存檔前自動執行
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>mp", -- "Make Pretty"：手動觸發格式化
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    -- 根據語言設定格式化工具
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" }, -- 先排序 import 再執行 black
      cpp = { "clang-format" },
      rust = { "rustfmt" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettier" },
      html = { "prettier" },
      sh = { "shfmt" },
    },
    -- 存檔自動格式化 (選用)
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}