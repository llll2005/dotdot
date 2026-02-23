return {
  "RAprogramm/nekifoch",
  cmd = "Nekifoch",
  keys = {
    -- 2026 高效操作：一鍵彈出字體選擇器
    { "<leader>uf", "<cmd>Nekifoch<cr>", desc = "UI: Change Terminal Font" },
  },
  opts = {
    -- 自動擴展路徑，確保在 CachyOS/Arch 下運作正常
    kitty_conf_path = vim.fn.expand("~/.config/kitty/kitty.conf"),
  },
}