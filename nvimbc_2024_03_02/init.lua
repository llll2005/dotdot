-- core
  require("core.plugins-setup")
  require("core.keymaps")
  require("core.options")


--autoActPlugins
  require("autoActPlugs.header")
  require("autoActPlugs.pairs") -- 括號補全
  require("autoActPlugs.save") -- 自動儲存
  require("autoActPlugs.tabnine") -- ai

-- debugger
  require("debugger.dap-config")
  require("debugger.neodev")
  require("debugger.neotest")

-- lsp
  require("lsp.cmp")
  require("lsp.lsp")
  require("lsp.lspconfig")

-- themes
  -- require("themes.catppuccin")
  --require("themes.nordic")
  -- require("themes.blossom")
  --require("themes.aquarium")
  --require("themes.evergarden")
  -- require("themes.leaf")

-- ui 
--  require("ui.animation") --光標動效
  require("ui.bufferline") -- buffer分隔線
  require("ui.colorizer") --色碼顯色
  require("ui.edgy2") -- 像vscode的界面
  require("ui.gitsigns") -- 左則git提示
  require("ui.treesitter") -- 語法高亮 
  require("ui.indent_blankline")
  require("ui.lualine") -- 狀態欄
  require("ui.neo-tree") -- 側邊欄
  require("ui.sentiment") -- 括號高亮
  require("ui.sidebar")
  require("ui.todo")
  require("ui.dropbar")
  require("ui.windows")
--  require("ui.headline")

  -- utils 
  require("utils.biscuits")
  require("utils.bookmarks")
  require("utils.comment") -- 快速註釋
  require("utils.cybu")
  require("utils.goto-preview") -- 區域代碼視窗
  require("utils.guess-indent") -- 一鍵縮排
  require("utils.nekifoch") --font change
  require("utils.noice") -- commandline
  require("utils.smart-splits") --類似tmux
  require("utils.telescope") -- 檢索
  require("utils.trouble")
