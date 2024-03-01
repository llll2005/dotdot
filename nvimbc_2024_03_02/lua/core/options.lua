local opt = vim.opt

--line number
    opt.relativenumber = true
    opt.number = true

--format
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.expandtab = true
    opt.autoindent = true

--prevent auto change line
    opt.wrap = false

--cursorline
    opt.cursorline = true

--sys-clipboard
    opt.clipboard:append("unnamedplus")

--normal-new-windoe-location
    opt.ignorecase = true
    opt.smartcase = true

--feature
    opt.termguicolors = true
    opt.signcolumn = "yes"

--theme
  vim.cmd"colorscheme mellifluous"
  --everforest"
  --aquarium"
