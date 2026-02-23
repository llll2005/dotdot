return {
  "rmagatti/goto-preview",
  event = "LspAttach", -- 只有在 LSP 啟動後，這個功能才有意義
  keys = {
    -- 保持你的核心快捷鍵習慣，並加入描述以便 Which-key 顯示
    { "df", function() require('goto-preview').goto_preview_definition() end, desc = "LSP: Preview Definition" },
    { "tf", function() require('goto-preview').goto_preview_type_definition() end, desc = "LSP: Preview Type Definition" },
    { "ip", function() require('goto-preview').goto_preview_implementation() end, desc = "LSP: Preview Implementation" },
    { "dc", function() require('goto-preview').goto_preview_declaration() end, desc = "LSP: Preview Declaration" },
    { "qq", function() require('goto-preview').close_all_win() end, desc = "LSP: Close All Previews" },
  },
  opts = {
    width = 120,
    height = 15,
    -- 2026 視覺優化：使用現代化圓角邊框，取代舊式的 ASCII 字元
    border = "rounded",
    default_mappings = false,
    debug = false,
    opacity = nil,
    resizing_mappings = false,
    -- 整合 Telescope：當有多個定義時，彈出漂亮的清單
    references = {
      telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
    },
    focus_on_open = true,
    dismiss_on_move = false,
    force_close = true,
    bufhidden = "wipe",
    stack_floating_preview_windows = true,
    preview_window_title = { enable = true, position = "left" },
  },
}