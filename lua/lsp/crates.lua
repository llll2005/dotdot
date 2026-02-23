return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("crates").setup({
      -- 1. 2026 視覺優化：在代碼右側直接顯示最新版本
      lsp = {
        enabled = true,
        on_attach = function(bufnr)
          -- 這裡可以定義專屬於 Cargo.toml 的快捷鍵
        end,
        actions = true,
        completion = true,
        hover = true,
      },
      -- 2. 彈窗樣式 (配合你的圓角主題)
      popup = {
        border = "rounded",
        show_version_date = true,
      },
      -- 3. 虛擬文字顯示格式
      src = {
        cmp = { enabled = true },
      },
    })
  end,
}