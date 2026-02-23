return {
  "echasnovski/mini.nvim",
  version = false, -- 2026 建議直接用最新版
  event = "VeryLazy",
  config = function()
    -- 1. 增強型 AI 文本對象 (資工開發神器)
    -- 讓你用 'daf' 刪除整個函數，或是 'ci(' 改寫括號內容，判斷更聰明
    require("mini.ai").setup({ n_lines = 500 })

    -- 2. 現代化環繞操作 (取代舊的 vim-sandwich)
    -- sa: 新增, sd: 刪除, sr: 替換 (例如把 ' 換成 ")
    require("mini.surround").setup()

    -- 3. 電腦圖學專用：色彩高亮 (mini.hipatterns)
    -- 當你在寫 Shader 或 CSS 時，代碼裡的 #ff0000 會直接顯示背景色
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
      highlighters = {
        fixme = { pattern = "%f[%w]FIXME%f[%W]", group = "MiniHypatternsFixme" },
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })

    -- 4. 作用域動態引導 (mini.indentscope)
    -- 當你游標進入一個 if 或 for 迴圈時，左側會有一條細線「滑動」出來顯示範圍
    -- 配合你的 Predator 高刷螢幕，視覺效果極佳
    require("mini.indentscope").setup({
      symbol = "│",
      options = { try_as_border = true },
      draw = {
        animation = require("mini.indentscope").gen_animation.quadratic({ duration = 200 }),
      },
    })

    -- 5. 快速移動 (mini.bracketed)
    -- 用 [b / ]b 跳轉 buffer, [d / ]d 跳轉診斷錯誤
    require("mini.bracketed").setup()
  end,
}