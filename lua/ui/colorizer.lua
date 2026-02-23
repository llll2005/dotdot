return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = {
      "*", -- 所有檔案類型
      cmp_docs = { always_update = true }, -- 保留你要求的 cmp_docs 即時更新
    },
    user_default_options = {
      RGB = true,          -- #RGB hex codes
      RRGGBB = true,       -- #RRGGBB hex codes
      names = false,       -- "Name" 顏色 (如 "Blue")，建議關閉以避免誤判
      RRGGBBAA = true,     -- #RRGGBBAA hex codes (透明度支援)
      AARRGGBB = true,     -- 0xAARRGGBB hex codes
      rgb_fn = true,       -- CSS rgb() and rgba() functions
      hsl_fn = true,       -- CSS hsl() and hsla() functions
      css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true,       -- Enable all CSS *functions*: rgb_fn, hsl_fn

      -- 2026 現代化顯示模式：
      -- 'background' (整行底色), 'foreground' (文字顏色), 'virtualtext' (旁邊一個小方塊)
      mode = "background",

      -- 針對電腦圖學與 Web 開發的加強：
      tailwind = true,     -- 支援 Tailwind CSS 顏色 (如果你有寫前端)
      sass = { enable = true, parsers = { "css" } },
      virtualtext = "■",   -- 在顏色代碼旁顯示一個小方塊 (如果 mode 設為 virtualtext)
    },
    -- 針對特定檔案類型的優化
    buftypes = {
      "*",
      "!prompt",
      "!popup",
    },
  },
}