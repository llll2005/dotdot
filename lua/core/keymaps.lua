local keymap = vim.keymap

-- 設置 leader key (雖然 lazy.lua 設過，但這裡保險起見再確認一次)
vim.g.mapleader = " "

---------------------
-- Visual Mode
---------------------
-- 視覺模式下移動選取區塊 (The Primeagen 經典款)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "移動選取區塊向下" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "移動選取區塊向上" })

---------------------
-- Normal Mode
---------------------
-- 視窗管理 (Windows)
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "垂直分割視窗" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "水平分割視窗" })

-- 取消搜尋高亮 (Unhighlight)
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "取消搜尋高亮" })

-- Buffer 切換 (切換分頁)
keymap.set("n", "<C-L>", "<cmd>bnext<CR>", { desc = "下一個 Buffer" })
keymap.set("n", "<C-H>", "<cmd>bprevious<CR>", { desc = "上一個 Buffer" })

-- 快速存檔與退出
keymap.set("n", "W", "<cmd>w<CR>", { desc = "快速存檔" })
keymap.set("n", "Q", "<cmd>q<CR>", { desc = "快速退出" })
keymap.set("n", "P", "<cmd>pu<CR>", { desc = "貼上並換行" })

-- 插件映射 (Plugins)
-- Neo-tree
keymap.set("n", "<leader>t", "<cmd>Neotree toggle<CR>", { desc = "切換檔案樹" })

-- Yazi (現代化終端檔案管理器)
keymap.set("n", "Y", "<cmd>Yazi<CR>", { desc = "打開 Yazi" })

-- 實用工具
keymap.set("n", "<C-a>", "ggVG", { desc = "全選" })
-- 快速將 4 空格轉為 2 空格
keymap.set("n", "<leader>T", "ggVG:s/    /  /g<CR><cmd>nohl<CR>", { desc = "4空格轉2空格" })

-- 視窗導航
keymap.set("n", "<C-]>", "<C-w>l", { desc = "跳到右邊視窗" })
-- 注意：<C-[> 在大多數終端等於 <Esc>，這可能會導致你在按 Esc 時發生延遲。
-- 如果你覺得按 Esc 變慢了，建議換成 <C-h> 或其他組合。
keymap.set("n", "<C-[>", "<C-w>h", { desc = "跳到左邊視窗" })

---------------------
-- Insert Mode
---------------------
-- 插入模式下快速存檔 (會自動回到插入模式)
keymap.set("i", "<C-s>", "<esc><cmd>w<CR>a", { desc = "插入模式快速存檔" })