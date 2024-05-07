return {

 ----- autoact
{
  "windwp/nvim-autopairs", -- 自動補全括號
  "Pocco81/auto-save.nvim",
  "m4xshen/autoclose.nvim",
  {"codota/tabnine-nvim", build = "./dl_binaries.sh"}, --ai
},
"machakann/vim-sandwich",

 ----- DEBUGGER 
  {
    'mfussenegger/nvim-dap',
    {"rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"}},
    'theHamsta/nvim-dap-virtual-text',
    "nvim-telescope/telescope-dap.nvim",
    "ibhagwan/fzf-lua",
    "rcarriga/cmp-dap",
    "LiadOz/nvim-dap-repl-highlights",
    'folke/neodev.nvim',
    {"nvim-neotest/neotest",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "alfaix/neotest-gtest",
        "nvim-neotest/neotest-plenary",
      }
    },
  },

({
    'ramojus/mellifluous.nvim',
    -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
    config = function()
        require'mellifluous'.setup({}) -- optional, see configuration section.
        --vim.cmd('colorscheme mellifluous')
    end,
}),
 -- theme 
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
},

 -- fun
  { "Eandrju/cellular-automaton.nvim", -- 沒用的特效
    "junegunn/goyo.vim", -- 文檔置中
    "junegunn/limelight.vim", --段落高亮
  },

----- MINI -----
   "echasnovski/mini.nvim", -- mini nvim
----- mini -----

----- UI -----
   "xiyaowong/transparent.nvim", -- background transparency

   "akinsho/bufferline.nvim", -- buffer分割線
   "NvChad/nvim-colorizer.lua", --color preview
   "nvim-treesitter/nvim-treesitter", -- 語法高亮
   "p00f/nvim-ts-rainbow", -- 配合treesitter，不同括號顏色區分
   {
    'nvim-lualine/lualine.nvim',  -- 狀態欄
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }  -- 狀態欄圖標
  },
--   {
--    "eoh-bse/minintro.nvim",
--    config = function() require("minintro").setup({ color = "#fedfe1" }) end
--  },
{
  "folke/edgy.nvim",
  event = "VeryLazy",
  opts = {}
},
   "sidebar-nvim/sidebar.nvim",
   "sidebar-nvim/sections-dap",
  ({
    "utilyre/sentiment.nvim",
    tag = "*",
  }),
   "lukas-reineke/indent-blankline.nvim",
  ({
    'Bekaboo/dropbar.nvim',
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  }),
   {
    "folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim",}
  },
   {
     "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
   {
    "anuvyklack/windows.nvim",
   dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
   },
 },
 {
  "startup-nvim/startup.nvim",
  dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = function()
    require"startup".setup()
  end
},
  {
    "lukas-reineke/headlines.nvim",
    dependencies = {"nvim-treesitter"},
    config = function()
      require("headlines").setup()
    end,
  },
----- UTILS -----
  { -- 區塊註解
    'code-biscuits/nvim-biscuits',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate'
    },
  },
   "numToStr/Comment.nvim", -- gcc和gc註釋
   "NMAC427/guess-indent.nvim", -- 偵測縮排規律
   "folke/persistence.nvim", -- 保存歷史紀錄
  'RAprogramm/nekifoch', --字體更改
  'mrjones2014/smart-splits.nvim',
  'tomasky/bookmarks.nvim',
   "christoomey/vim-tmux-navigator", -- 用ctl-hjkl来定位窗口
   {
    'nvim-telescope/telescope.nvim',  -- 文件檢索
      dependencies = {
        {'nvim-lua/plenary.nvim'},
        {"folke/noice.nvim"},
        {"tomasky/bookmarks.nvim"},
      }
  },
   "sindrets/diffview.nvim",
   {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
  end
},
   {
    "DreamMaoMao/yazi.nvim",
    dependencies = {
      {"nvim-telescope/telescope.nvim"},
      {"nvim-lua/plenary.nvim"},
    },
  },
  ({
  "ghillb/cybu.nvim",
  branch = "main", -- timely updates
  -- branch = "v1.x", -- won't receive breaking changes
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim"}, -- optional for icon support
  config = function()
    local ok, cybu = pcall(require, "cybu")
    if not ok then
      return
    end
    cybu.setup()
  end,
  }),
({
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
}),
----- utils -----
-- made by L
----- LSP -----
   "lewis6991/gitsigns.nvim", -- 左則git提示
   {
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
  },
----- NEOTREE -----
  "nvim-tree/nvim-web-devicons",
  {
  "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
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
  },


   {
    "folke/noice.nvim",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      "nvim-treesitter/nvim-treesitter",
    }
  },

}
