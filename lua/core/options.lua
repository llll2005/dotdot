local opt = vim.opt

---------------------
-- 行號與顯示
---------------------
opt.relativenumber = true -- 相對行號
opt.number = true         -- 同時顯示當前行號
opt.cursorline = true     -- 高亮當前行
opt.signcolumn = "yes"    -- 總是顯示左側圖示欄 (避免跳動)
-- 0.10+ 新功能：平滑捲動 (Smooth Scroll)
-- 當你使用 wrap (自動換行) 時，捲動會變得非常平滑
opt.smoothscroll = true

---------------------
-- 縮排與格式
---------------------
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.wrap = true           -- 自動換行

---------------------
-- 搜尋與匹配
---------------------
opt.ignorecase = true     -- 搜尋忽略大小寫
opt.smartcase = true      -- 如果搜尋包含大寫，則不忽略大小寫
opt.hlsearch = true       -- 高亮搜尋結果
opt.incsearch = true      -- 邊輸入邊預覽搜尋

---------------------
-- 系統與交互
---------------------
-- 系統剪貼簿
-- 在 Arch/Hyprland 下，確保你有安裝 wl-clipboard
opt.clipboard:append("unnamedplus")

-- 視窗分割方向 (這符合現代人的直覺)
opt.splitright = true     -- 新視窗在右邊
opt.splitbelow = true     -- 新視窗在下面

-- 優化搜尋替換預覽
-- 在輸入 :s/old/new/ 時，會直接在螢幕上顯示替換後的樣子
opt.inccommand = "split"

---------------------
-- 效能與外觀
---------------------
opt.termguicolors = true  -- 啟用 24-bit RGB 顏色
-- 保持游標上下至少有 8 行距離，不會貼到邊緣
opt.scrolloff = 8

-- 補全選單高度
opt.pumheight = 10

---------------------
-- 主題設定
---------------------
-- opt.background = "dark"
-- 使用 pcall 避免如果主題沒裝好會直接報錯中斷載入
local status, _ = pcall(vim.cmd, "colorscheme blossom")
if not status then
  print("Color scheme 'blossom' not found, falling back to default.")
end