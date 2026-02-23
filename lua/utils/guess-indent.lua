return {
  "NMAC427/guess-indent.nvim",
  event = "BufReadPost", -- 讀取檔案後自動偵測
  opts = {
    auto_cmd = true,
    override_editorconfig = false, -- 優先尊重專案內的 .editorconfig (2026 標準做法)
    filetype_exclude = {
      "netrw",
      "tutor",
      "neo-tree", -- 排除你的四象限邊欄
      "undotree",
      "Outline",
    },
    buftype_exclude = {
      "help",
      "nofile",
      "terminal",
      "prompt",
      "edgy",     -- 排除佈局管理員
    },
  },
}