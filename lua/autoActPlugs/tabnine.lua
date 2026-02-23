return {
  "codota/tabnine-nvim",
  build = "./dl_binaries.sh", -- 2026 年標準：確保二進制檔自動下載
  event = "InsertEnter",      -- 進入插入模式才載入，節省啟動時間
  config = function()
    require('tabnine').setup({
      disable_auto_comment = true,
      accept_keymap = "<C-f>",   -- [建議修改] 避免與 Tab 鍵補全或縮排衝突
      dismiss_keymap = "<C-]>",
      debounce_ms = 300,         -- 2026 核心效能提升，建議縮短到 300ms
      suggestion_color = { gui = "#808080", cterm = 244 },
      exclude_filetypes = { "TelescopePrompt", "NvimTree", "neo-tree" }, -- 加入你的 neo-tree
      log_file_path = nil,
    })
  end
}