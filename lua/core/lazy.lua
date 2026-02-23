-- 1. 啟用 Neovim 的 Lua 載入加速器 (Neovim 0.9.1+ 內建)
-- 這能顯著提升啟動速度
if vim.loader then
  vim.loader.enable()
end

-- 2. 準備 lazy.nvim 路徑
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. 設定 Leader Key (必須在 setup 之前)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 4. 核心設定：合併所有插件目錄
require('lazy').setup({
  spec = {
    -- 這裡會自動掃描 lua/plugins/ 目錄下的所有檔案
    { import = "plugins" },
    -- 如果你有另一個目錄叫 lua/fun/，請用 import
    -- 但我看你的架構，建議把 ui, utils, lsp 等都放進這裡
    { import = "ui" },
    { import = "utils" },
    { import = "lsp" },
    { import = "debugger" },
    -- 針對你原本的 'fun' 目錄，如果是指 autoActPlugs
    { import = "autoActPlugs" },
  },
  defaults = {
    lazy = false, -- 預設不延遲載入，除非插件自己有設定
    version = false, -- 總是使用最新版本，而不是穩定版 (推薦，因為 Neovim 更新很快)
  },
  checker = { enabled = true }, -- 自動檢查插件更新
  performance = {
    rtp = {
      -- 禁用一些沒用的內建插件，加快啟動速度
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})