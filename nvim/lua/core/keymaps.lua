vim.g.mapleader = " "

local keymap = vim.keymap

--insert mode

--visual mode
  --move
    keymap.set("v", "J", ":m '>+1<CR>gv=gv")
    keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--normal mode
  --windows
--[[     keymap.set("n", "<esc><esc>", ":wq<CR>") ]]
    keymap.set("n", "<leader>sv", "<C-w>v")
    keymap.set("n", "<leader>sh", "<C-w>s")
  --unhighlight
    keymap.set("n", "<leader>nh", ":nohl<CR>")
  --change buffer
    keymap.set("n", "<C-L>", ":bnext<CR>")
    keymap.set("n", "<C-H>", ":bprevious<CR>")
--plugins
  --nvim-tree
    keymap.set("n", "<leader>t", ":Neotree<CR>")

    keymap.set("i", "<C-s>", "<esc>:w<CR>i")
    keymap.set("n", "W", ":w<CR>")
    keymap.set("n", "Q", ":q<CR>")
    keymap.set("n", "P", ":pu<CR")
    keymap.set("n", "Y", ":Yazi<CR>")

