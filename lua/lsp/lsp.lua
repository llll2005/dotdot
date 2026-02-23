return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- 1. 統一的邊框與外觀設定
    local border = "rounded"
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

    -- 2. 現代化 On_Attach (快捷鍵定義)
    local on_attach = function(client, bufnr)
      local builtin = require("telescope.builtin")
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, noremap = true, silent = true, desc = "LSP: " .. desc })
      end

      -- 基礎導航
      map("n", "gD", vim.lsp.buf.declaration, "跳轉到宣告 (Declaration)")
      map("n", "gd", builtin.lsp_definitions, "跳轉到定義 (Definition)")
      map("n", "B", vim.lsp.buf.hover, "顯示說明文件") -- 保留你習慣的 B
      map("n", "gi", builtin.lsp_implementations, "跳轉到實作 (Implementation)")
      map("n", "gr", builtin.lsp_references, "尋找引用 (References)")
      map("n", "<C-k>", vim.lsp.buf.signature_help, "簽名幫助")

      -- 變數/重構
      map("n", "<space>rn", vim.lsp.buf.rename, "重新命名")
      map("n", "<space>ca", vim.lsp.buf.code_action, "代碼修復")
      map("n", "<space>D", vim.lsp.buf.type_definition, "類型定義")

      -- 格式化 (2026 建議：這部分可以用更強大的 conform.nvim 取代)
      map("n", "<space>F", function()
        vim.lsp.buf.format({ async = true })
      end, "格式化代碼")

      -- 你的河狸提示 (如果你有裝相關的 UI 插件，這會生效)
      -- client.server_capabilities.signatureHelpProvider = true
    end

    -- 3. Mason 自動化配置
    mason_lspconfig.setup({
      ensure_installed = {
        "clangd", "cmake", "pyright", "lua_ls", "cssls",
        "html", "jsonls", "sqlls", "yamlls", "bashls"
      },
    })

    mason_lspconfig.setup_handlers({
      -- A. 預設處理器：自動為所有 Mason 安裝的伺服器套用設定
      function(server_name)
        -- [關鍵] 跳過 rust_analyzer，由 rustaceanvim 負責
        if server_name == "rust_analyzer" then return end

        lspconfig[server_name].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,

      -- B. Lua 專屬優化
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              completion = { callSnippet = "Replace" },
            },
          },
        })
      end,

      -- C. C++ (Clangd) 優化：與你的 CMakeTools 聯動
      ["clangd"] = function()
        lspconfig.clangd.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--compile-commands-dir=build",
          },
        })
      end,
    })

    -- 4. 診斷外觀設定 (Diagnostic)
    vim.diagnostic.config({
      virtual_text = { prefix = "🦫" },
      float = { border = border },
      severity_sort = true,
    })
  end
}