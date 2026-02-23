return {
  "folke/lazydev.nvim",
  ft = "lua", -- 只有在編輯 lua 檔案時才載入，極速啟動
  opts = {
    library = {
      -- 2026 必備：讓 vim.uv 有自動補全 (Neovim 0.10+ 標準)
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "neotest", words = { "neotest" } },
    },
  },
}