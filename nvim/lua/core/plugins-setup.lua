----- PACKER -----
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])
return require('packer').startup(function(use)
use 'wbthomason/packer.nvim'
----- packer -----

use ----- autoact
{
  "windwp/nvim-autopairs", -- 自動補全括號
  "Pocco81/auto-save.nvim",
  "m4xshen/autoclose.nvim",
  {"codota/tabnine-nvim", run = "./dl_binaries.sh"}, --ai
}
use "machakann/vim-sandwich"

use ----- DEBUGGER 
  {
    'mfussenegger/nvim-dap',
    {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}},
    'theHamsta/nvim-dap-virtual-text',
    "nvim-telescope/telescope-dap.nvim",
    "ibhagwan/fzf-lua",
    "rcarriga/cmp-dap",
    "LiadOz/nvim-dap-repl-highlights",
    'folke/neodev.nvim',
    {"nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "alfaix/neotest-gtest",
        "nvim-neotest/neotest-plenary",
      }
    },
  }

use({
    'ramojus/mellifluous.nvim',
    -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
    config = function()
        require'mellifluous'.setup({}) -- optional, see configuration section.
        --vim.cmd('colorscheme mellifluous')
    end,
})
use -- theme 
{ "Biscuit-Colorscheme/nvim",
  "onur-ozkan/nimda.vim",
  "savq/melange-nvim",
  'sainnhe/gruvbox-material',
  'jacoborus/tender.vim',
  {'srcery-colors/srcery-vim', as = 'srcery'},
  "olimorris/onedarkpro.nvim",
  'AlexvZyl/nordic.nvim',
  'rhysd/vim-color-spring-night',
  'frenzyexists/aquarium-vim',
  "lunarvim/horizon.nvim",
  'Shadorain/shadotheme',
  "neanias/everforest-nvim",
  "rayes0/blossom.vim",
  "ellisonleao/gruvbox.nvim",
  'mountain-theme/vim',
  'perpetuatheme/nvim',
  "RaphaeleL/my_vivid",
  "aereal/vim-colors-japanesque",
  "cocopon/iceberg.vim",
  "CrispyBaccoon/evergarden",
  "daschw/leaf.nvim",
  { "catppuccin/nvim", as = "catppuccin" },
  "kihachi2000/yash.nvim",
  "nanotech/jellybeans.vim",
  "Enonya/yuyuko.vim",
  "tobi-wan-kenobi/zengarden",
}

use -- fun
  { "Eandrju/cellular-automaton.nvim", -- 沒用的特效
    "junegunn/goyo.vim", -- 文檔置中
    "junegunn/limelight.vim", --段落高亮
  }

----- MINI -----
  use "echasnovski/mini.nvim" -- mini nvim
----- mini -----

----- UI -----
  use "xiyaowong/transparent.nvim" -- background transparency

  use "akinsho/bufferline.nvim" -- buffer分割線
  use "NvChad/nvim-colorizer.lua" --color preview
  use "nvim-treesitter/nvim-treesitter" -- 語法高亮
  use "p00f/nvim-ts-rainbow" -- 配合treesitter，不同括號顏色區分
  use {
    'nvim-lualine/lualine.nvim',  -- 狀態欄
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }  -- 狀態欄圖標
  }
--  use {
--    "eoh-bse/minintro.nvim",
--    config = function() require("minintro").setup({ color = "#fedfe1" }) end
--  }
  use "folke/edgy.nvim"
  use "sidebar-nvim/sidebar.nvim"
  use "sidebar-nvim/sections-dap"
  use({
    "utilyre/sentiment.nvim",
    tag = "*",
  })
  use "lukas-reineke/indent-blankline.nvim"
  use({
    'Bekaboo/dropbar.nvim',
    requires = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  })
  use {
    "folke/todo-comments.nvim",
    requires = {"nvim-lua/plenary.nvim",}
  }
  use {
     "folke/trouble.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  }
  use {
    "anuvyklack/windows.nvim",
   requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
   }
 }
use {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = function()
    require"startup".setup()
  end
}
    use {
        "lukas-reineke/headlines.nvim",
        after = "nvim-treesitter",
        config = function()
            require("headlines").setup()
        end,
    }
----- UTILS -----
  use { -- 區塊註解
    'code-biscuits/nvim-biscuits',
    requires = {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    },
  }
  use "numToStr/Comment.nvim" -- gcc和gc註釋
  use "NMAC427/guess-indent.nvim" -- 偵測縮排規律
  use "folke/persistence.nvim" -- 保存歷史紀錄
  use 'RAprogramm/nekifoch' --字體更改
  use 'mrjones2014/smart-splits.nvim'
  use 'tomasky/bookmarks.nvim'
  use "christoomey/vim-tmux-navigator" -- 用ctl-hjkl来定位窗口
  use {
    'nvim-telescope/telescope.nvim',  -- 文件檢索
      requires = {
        {'nvim-lua/plenary.nvim'},
        {"folke/noice.nvim"},
        {"tomasky/bookmarks.nvim"},
      }
  }
  use "sindrets/diffview.nvim"
  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
  end
}
  use {
    "DreamMaoMao/yazi.nvim",
    requires = {
      {"nvim-telescope/telescope.nvim"},
      {"nvim-lua/plenary.nvim"},
    },
  }
  use({
  "ghillb/cybu.nvim",
  branch = "main", -- timely updates
  -- branch = "v1.x", -- won't receive breaking changes
  requires = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim"}, -- optional for icon support
  config = function()
    local ok, cybu = pcall(require, "cybu")
    if not ok then
      return
    end
    cybu.setup()
  end,
  })
use({
    'NTBBloodbath/doom-one.nvim',
    setup = function()
        -- Add color to cursor
		vim.g.doom_one_cursor_coloring = false
		-- Set :terminal colors
		vim.g.doom_one_terminal_colors = true
		-- Enable italic comments
		vim.g.doom_one_italic_comments = false
		-- Enable TS support
		vim.g.doom_one_enable_treesitter = true
		-- Color whole diagnostic text or only underline
        vim.g.doom_one_diagnostics_text_color = false
		-- Enable transparent background
		vim.g.doom_one_transparent_background = false

        -- Pumblend transparency
		vim.g.doom_one_pumblend_enable = false
		vim.g.doom_one_pumblend_transparency = 20

        -- Plugins integration
		vim.g.doom_one_plugin_neorg = true
		vim.g.doom_one_plugin_barbar = false
		vim.g.doom_one_plugin_telescope = false
		vim.g.doom_one_plugin_neogit = true
		vim.g.doom_one_plugin_nvim_tree = true
		vim.g.doom_one_plugin_dashboard = true
		vim.g.doom_one_plugin_startify = true
		vim.g.doom_one_plugin_whichkey = true
		vim.g.doom_one_plugin_indent_blankline = true
		vim.g.doom_one_plugin_vim_illuminate = true
		vim.g.doom_one_plugin_lspsaga = false
	end,
	config = function()
    end,
})
----- utils -----
-- made by L
----- LSP -----
  use "lewis6991/gitsigns.nvim" -- 左則git提示
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",  -- mason.nvim和lspconfig的橋樑
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp", -- autocompletion
    "hrsh7th/cmp-nvim-lsp", -- lsp source
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-calc",
    "f3fora/cmp-spell",
    "rafamadriz/friendly-snippets",
    "VincentBerthier/auto-header.nvim",
    "onsails/lspkind.nvim",
    "saadparwaiz1/cmp_luasnip", -- snippets source for nvim-cmp
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "L3MON4D3/LuaSnip", -- snippets
    "p00f/clangd_extensions.nvim",
    "mfussenegger/nvim-lint",
  }
----- NEOTREE -----
use "nvim-tree/nvim-web-devicons"
use {
  "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
       "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      {
        's1n7ax/nvim-window-picker',
        config = function()
            require 'window-picker'.setup({
                filter_rules = {
                    include_current_win = false,
                    autoselect_one = true,
                    -- filter using buffer options
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                        -- if the buffer type is one of following, the window will be ignored
                        buftype = { 'terminal', "quickfix" },
                    },
            },
        })
        end,
      },
    },
    config = function ()
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "󰌵", texthl = "DiagnosticSignHint"})
      vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
    end
  }


  use {
    "folke/noice.nvim",
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      "nvim-treesitter/nvim-treesitter",
    }
  }

----- PACKER -----
  if packer_bootstrap then
    require('packer').sync()
  end
end)
----- packer -----
