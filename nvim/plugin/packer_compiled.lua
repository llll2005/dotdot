-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/l_inux/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?.lua;/home/l_inux/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?/init.lua;/home/l_inux/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?.lua;/home/l_inux/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/l_inux/.cache/nvim/packer_hererocks/2.1.1702233742/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["animation.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/animation.nvim",
    url = "https://github.com/anuvyklack/animation.nvim"
  },
  ["aquarium-vim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/aquarium-vim",
    url = "https://github.com/frenzyexists/aquarium-vim"
  },
  ["auto-header.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/auto-header.nvim",
    url = "https://github.com/VincentBerthier/auto-header.nvim"
  },
  ["auto-save.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/auto-save.nvim",
    url = "https://github.com/Pocco81/auto-save.nvim"
  },
  ["autoclose.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/autoclose.nvim",
    url = "https://github.com/m4xshen/autoclose.nvim"
  },
  ["blossom.vim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/blossom.vim",
    url = "https://github.com/rayes0/blossom.vim"
  },
  ["bookmarks.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/bookmarks.nvim",
    url = "https://github.com/tomasky/bookmarks.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cellular-automaton.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/cellular-automaton.nvim",
    url = "https://github.com/Eandrju/cellular-automaton.nvim"
  },
  ["clangd_extensions.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/clangd_extensions.nvim",
    url = "https://github.com/p00f/clangd_extensions.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-dap"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/cmp-dap",
    url = "https://github.com/rcarriga/cmp-dap"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["cybu.nvim"] = {
    config = { "\27LJ\2\nH\0\0\4\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\tcybu\frequire\npcall\0" },
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/cybu.nvim",
    url = "https://github.com/ghillb/cybu.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["doom-one.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/opt/doom-one.nvim",
    url = "https://github.com/NTBBloodbath/doom-one.nvim"
  },
  ["dropbar.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/dropbar.nvim",
    url = "https://github.com/Bekaboo/dropbar.nvim"
  },
  ["edgy.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/edgy.nvim",
    url = "https://github.com/folke/edgy.nvim"
  },
  ["everforest-nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/everforest-nvim",
    url = "https://github.com/neanias/everforest-nvim"
  },
  evergarden = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/evergarden",
    url = "https://github.com/CrispyBaccoon/evergarden"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goto-preview"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17goto-preview\frequire\0" },
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/goto-preview",
    url = "https://github.com/rmagatti/goto-preview"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["guess-indent.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/NMAC427/guess-indent.nvim"
  },
  ["headlines.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14headlines\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/opt/headlines.nvim",
    url = "https://github.com/lukas-reineke/headlines.nvim"
  },
  ["horizon.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/horizon.nvim",
    url = "https://github.com/lunarvim/horizon.nvim"
  },
  ["iceberg.vim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/iceberg.vim",
    url = "https://github.com/cocopon/iceberg.vim"
  },
  ["image.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/image.nvim",
    url = "https://github.com/3rd/image.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["jellybeans.vim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/jellybeans.vim",
    url = "https://github.com/nanotech/jellybeans.vim"
  },
  ["leaf.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/leaf.nvim",
    url = "https://github.com/daschw/leaf.nvim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/limelight.vim",
    url = "https://github.com/junegunn/limelight.vim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["melange-nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/melange-nvim",
    url = "https://github.com/savq/melange-nvim"
  },
  ["mellifluous.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\16mellifluous\frequire\0" },
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/mellifluous.nvim",
    url = "https://github.com/ramojus/mellifluous.nvim"
  },
  middleclass = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/middleclass",
    url = "https://github.com/anuvyklack/middleclass"
  },
  ["mini.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  my_vivid = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/my_vivid",
    url = "https://github.com/RaphaeleL/my_vivid"
  },
  nekifoch = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nekifoch",
    url = "https://github.com/RAprogramm/nekifoch"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\nõ\3\0\0\4\0\r\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\0\0009\0\v\0'\2\f\0B\0\2\1K\0\1\0#nnoremap \\ :Neotree reveal<cr>\bcmd\1\0\2\vtexthl\23DiagnosticSignHint\ttext\tÛ∞åµ\23DiagnosticSignHint\1\0\2\vtexthl\23DiagnosticSignInfo\ttext\tÔÅö \23DiagnosticSignInfo\1\0\2\vtexthl\23DiagnosticSignWarn\ttext\tÔÅ± \23DiagnosticSignWarn\1\0\2\vtexthl\24DiagnosticSignError\ttext\tÔÅó \24DiagnosticSignError\16sign_define\afn\bvim\0" },
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  neotest = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-gtest"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/neotest-gtest",
    url = "https://github.com/alfaix/neotest-gtest"
  },
  ["neotest-plenary"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/neotest-plenary",
    url = "https://github.com/nvim-neotest/neotest-plenary"
  },
  ["nimda.vim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nimda.vim",
    url = "https://github.com/onur-ozkan/nimda.vim"
  },
  ["noice.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nordic.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nordic.nvim",
    url = "https://github.com/AlexvZyl/nordic.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  nvim = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim",
    url = "https://github.com/Biscuit-Colorscheme/nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-biscuits"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-biscuits",
    url = "https://github.com/code-biscuits/nvim-biscuits"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-repl-highlights"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-dap-repl-highlights",
    url = "https://github.com/LiadOz/nvim-dap-repl-highlights"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lint"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\nÁ\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\1\0\0\abo\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\2\19autoselect_one\2\24include_current_win\1\nsetup\18window-picker\frequire\0" },
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["onedarkpro.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/onedarkpro.nvim",
    url = "https://github.com/olimorris/onedarkpro.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["persistence.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/persistence.nvim",
    url = "https://github.com/folke/persistence.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["sections-dap"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/sections-dap",
    url = "https://github.com/sidebar-nvim/sections-dap"
  },
  ["sentiment.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/sentiment.nvim",
    url = "https://github.com/utilyre/sentiment.nvim"
  },
  shadotheme = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/shadotheme",
    url = "https://github.com/Shadorain/shadotheme"
  },
  ["sidebar.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/sidebar.nvim",
    url = "https://github.com/sidebar-nvim/sidebar.nvim"
  },
  ["smart-splits.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
  },
  srcery = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/srcery",
    url = "https://github.com/srcery-colors/srcery-vim"
  },
  ["startup.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fstartup\frequire\0" },
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/startup.nvim",
    url = "https://github.com/startup-nvim/startup.nvim"
  },
  ["tabnine-nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/tabnine-nvim",
    url = "https://github.com/codota/tabnine-nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tender.vim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/tender.vim",
    url = "https://github.com/jacoborus/tender.vim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["transparent.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/transparent.nvim",
    url = "https://github.com/xiyaowong/transparent.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  vim = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/vim",
    url = "https://github.com/mountain-theme/vim"
  },
  ["vim-color-spring-night"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/vim-color-spring-night",
    url = "https://github.com/rhysd/vim-color-spring-night"
  },
  ["vim-colors-japanesque"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/vim-colors-japanesque",
    url = "https://github.com/aereal/vim-colors-japanesque"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["windows.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/windows.nvim",
    url = "https://github.com/anuvyklack/windows.nvim"
  },
  ["yash.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/yash.nvim",
    url = "https://github.com/kihachi2000/yash.nvim"
  },
  ["yazi.nvim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/yazi.nvim",
    url = "https://github.com/DreamMaoMao/yazi.nvim"
  },
  ["yuyuko.vim"] = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/yuyuko.vim",
    url = "https://github.com/Enonya/yuyuko.vim"
  },
  zengarden = {
    loaded = true,
    path = "/home/l_inux/.local/share/nvim/site/pack/packer/start/zengarden",
    url = "https://github.com/tobi-wan-kenobi/zengarden"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: doom-one.nvim
time([[Setup for doom-one.nvim]], true)
try_loadstring("\27LJ\2\nª\6\0\0\2\0\21\0M6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0006\0\0\0009\0\1\0)\1\20\0=\1\t\0006\0\0\0009\0\1\0+\1\2\0=\1\n\0006\0\0\0009\0\1\0+\1\1\0=\1\v\0006\0\0\0009\0\1\0+\1\1\0=\1\f\0006\0\0\0009\0\1\0+\1\2\0=\1\r\0006\0\0\0009\0\1\0+\1\2\0=\1\14\0006\0\0\0009\0\1\0+\1\2\0=\1\15\0006\0\0\0009\0\1\0+\1\2\0=\1\16\0006\0\0\0009\0\1\0+\1\2\0=\1\17\0006\0\0\0009\0\1\0+\1\2\0=\1\18\0006\0\0\0009\0\1\0+\1\2\0=\1\19\0006\0\0\0009\0\1\0+\1\1\0=\1\20\0K\0\1\0\28doom_one_plugin_lspsaga#doom_one_plugin_vim_illuminate%doom_one_plugin_indent_blankline\29doom_one_plugin_whichkey\29doom_one_plugin_startify\30doom_one_plugin_dashboard\30doom_one_plugin_nvim_tree\27doom_one_plugin_neogit\30doom_one_plugin_telescope\27doom_one_plugin_barbar\26doom_one_plugin_neorg#doom_one_pumblend_transparency\29doom_one_pumblend_enable$doom_one_transparent_background$doom_one_diagnostics_text_color\31doom_one_enable_treesitter\29doom_one_italic_comments\29doom_one_terminal_colors\29doom_one_cursor_coloring\6g\bvim\0", "setup", "doom-one.nvim")
time([[Setup for doom-one.nvim]], false)
time([[packadd for doom-one.nvim]], true)
vim.cmd [[packadd doom-one.nvim]]
time([[packadd for doom-one.nvim]], false)
-- Config for: mellifluous.nvim
time([[Config for mellifluous.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\16mellifluous\frequire\0", "config", "mellifluous.nvim")
time([[Config for mellifluous.nvim]], false)
-- Config for: doom-one.nvim
time([[Config for doom-one.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "doom-one.nvim")
time([[Config for doom-one.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nõ\3\0\0\4\0\r\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\0\0009\0\v\0'\2\f\0B\0\2\1K\0\1\0#nnoremap \\ :Neotree reveal<cr>\bcmd\1\0\2\vtexthl\23DiagnosticSignHint\ttext\tÛ∞åµ\23DiagnosticSignHint\1\0\2\vtexthl\23DiagnosticSignInfo\ttext\tÔÅö \23DiagnosticSignInfo\1\0\2\vtexthl\23DiagnosticSignWarn\ttext\tÔÅ± \23DiagnosticSignWarn\1\0\2\vtexthl\24DiagnosticSignError\ttext\tÔÅó \24DiagnosticSignError\16sign_define\afn\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: startup.nvim
time([[Config for startup.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fstartup\frequire\0", "config", "startup.nvim")
time([[Config for startup.nvim]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\nÁ\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\1\0\0\abo\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\2\19autoselect_one\2\24include_current_win\1\nsetup\18window-picker\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)
-- Config for: cybu.nvim
time([[Config for cybu.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\4\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\tcybu\frequire\npcall\0", "config", "cybu.nvim")
time([[Config for cybu.nvim]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17goto-preview\frequire\0", "config", "goto-preview")
time([[Config for goto-preview]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd headlines.nvim ]]

-- Config for: headlines.nvim
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14headlines\frequire\0", "config", "headlines.nvim")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
