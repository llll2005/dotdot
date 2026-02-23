-- 1. 先載入基礎設定與快捷鍵
require("core.options")
require("core.keymaps")

-- 2. 初始化插件管理器 (它會自動 import 你的 ui, utils, lsp 等目錄)
require("core.lazy")

-- 3. 特殊檔案類型支援 (保持原樣，這是正確的寫法)
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- 提示：現在你不需要在這裡手動 require("ui.treesitter") 或 require("lsp.lspconfig") 了
-- 只要這些檔案位於 lazy.setup 裡 import 的資料夾中，lazy.nvim 會自動執行它們。