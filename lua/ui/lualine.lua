return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "stevearc/overseer.nvim" },
  config = function()
    -- 1. 定義你的 Bubbles 配色
    local colors = {
      blue   = '#80a0ff',
      cyan   = '#79dac8',
      black  = '#080808',
      white  = '#c6c6c6',
      red    = '#ff5189',
      violet = '#d183e8',
      grey   = '#222222', -- 稍微調深一點，增加對比度
      magenta = '#c678dd',
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet, gui = 'bold' },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white, bg = 'NONE' }, -- 透明背景更現代
      },
      insert  = { a = { fg = colors.black, bg = colors.blue, gui = 'bold' } },
      visual  = { a = { fg = colors.black, bg = colors.cyan, gui = 'bold' } },
      replace = { a = { fg = colors.black, bg = colors.red, gui = 'bold' } },
      command = { a = { fg = colors.black, bg = colors.magenta, gui = 'bold' } },
      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    -- 2. 執行 Lualine 設定
    require('lualine').setup({
      options = {
        theme = bubbles_theme,
        component_separators = '',
        -- 使用你喜歡的 ▒░ 搭配圓角 
        section_separators = { left = '', right = '' },
        globalstatus = true, -- 2026 標準：使用單一全局狀態列
        disabled_filetypes = { statusline = { "dashboard", "alpha", "neo-tree" } },
      },
      sections = {
        -- 左側：模式 (加上 Arch 圖示與圓角)
        lualine_a = {
          {
            function() return "" end, -- 你在 Arch 上，放個圖示很合理
            separator = { left = '' },
            padding = { left = 1, right = 1 },
          },
          { 'mode', separator = { right = '' }, padding = { left = 1, right = 1 } },
        },
        -- 檔案資訊與 Git 狀態
        lualine_b = {
          { 'filename', file_status = true, path = 1 }, -- path = 1 顯示相對路徑
          { 'branch', icon = '󰘬' },
          { 'diff', symbols = { added = ' ', modified = '󰝤 ', removed = ' ' } },
        },
        -- 中間：LSP 診斷訊息 (靠左對齊)
        lualine_c = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' },
          },
          '%=', -- 分隔符，後面的組件會靠右
        },
        -- 右側：核心功能 (Overseer, LSP)
        lualine_x = {
          -- [整合] Overseer 任務狀態
          {
            "overseer",
            label = '󱓞 ',
            unique = true,
            on_click = function() vim.cmd("OverseerToggle") end,
          },
          -- 顯示當前 LSP 名稱
          {
            function()
              local msg = 'No Active LSP'
              local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then return msg end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return '󰄭 ' .. client.name
                end
              end
              return msg
            end,
            color = { fg = colors.blue, gui = 'bold' },
          },
        },
        -- 檔案格式與類型
        lualine_y = {
          { 'fileformat', symbols = { unix = 'LF', dos = 'CRLF', mac = 'CR' } },
          'encoding',
          'filetype',
        },
        -- 最右側：位置資訊 (圓角對稱)
        lualine_z = {
          { 'location', separator = { left = '' }, padding = { left = 1, right = 1 } },
          { 'progress', separator = { right = '' }, padding = { left = 1, right = 1 } },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end
}