return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- 確保使用 2025/2026 的最新穩定版
  lazy = false,   -- 官方建議不延遲載入以確保 LSP 正確啟動
  config = function()
    vim.g.rustaceanvim = {
      -- LSP 設定
      server = {
        on_attach = function(client, bufnr)
          -- 這裡可以放你專屬的快捷鍵
          vim.keymap.set("n", "<leader>ca", function() vim.cmd.RustLsp('codeAction') end, { desc = "Rust Code Action", buffer = bufnr })
          vim.keymap.set("n", "<leader>dr", function() vim.cmd.RustLsp('debuggables') end, { desc = "Rust Debuggables", buffer = bufnr })
        end,
        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" }, -- 存檔時自動執行 clippy 檢查
            cargo = { allFeatures = true },
            procMacro = { enable = true },
          },
        },
      },
      -- DAP 偵錯設定 (會自動對接我們之前設好的 codelldb)
      dap = {},
    }
  end
}