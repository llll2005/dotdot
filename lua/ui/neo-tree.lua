return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
  },
  opts = {
    -- 1. 關閉內部的 Source Selector (標籤列)，因為我們使用 Edgy 分隔顯示
    source_selector = {
      winbar = false,
      statusline = false,
    },

    close_if_last_window = false,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,

    -- 2. 通用組件設定
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        with_expanders = true,
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
        default = "󰈚",
      },
      git_status = {
        symbols = {
          added     = "✚",
          modified  = "",
          deleted   = "✖",
          renamed   = "󰁕",
          untracked = "",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        }
      },
    },

    -- 3. 通用按鍵映射 (主要用於左側 Filesystem)
    window = {
      position = "left",
      width = 30,
      mappings = {
        ["<space>"] = "none",
        ["l"] = "open",
        ["h"] = "close_node",
        ["<cr>"] = "open_with_window_picker",
        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["d"] = "trash",
        ["D"] = "delete",
      }
    },

    -- 4. [左上] 檔案系統特定設定
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      hijack_netrw_behavior = "open_default",
    },

    -- 5. [右上] 已開啟檔案 (Buffers) 特定設定
    -- 這裡實作你要求的：上下鍵移動，Enter 切換檔案且游標不離開
    buffers = {
      follow_current_file = { enabled = true },
      window = {
        mappings = {
          ["<up>"] = "move_cursor_up",
          ["<down>"] = "move_cursor_down",
          ["<cr>"] = "open_drop", -- 開啟檔案但焦點留在 neo-tree
          ["d"] = "buffer_delete", -- 在右上角按 d 可以關閉 buffer
        }
      }
    },

    -- 6. 自定義指令 (Trash-cli 整合)
    commands = {
      trash = function(state)
        local node = state.tree:get_node()
        if node.type == "message" then return end

        local inputs = require("neo-tree.ui.inputs")
        inputs.confirm("確定要將 [" .. node.name .. "] 丟進回收桶嗎？", function(confirmed)
          if confirmed then
            vim.fn.system({ "trash-put", vim.fn.fnameescape(node.path) })
            require("neo-tree.sources.manager").refresh(state.name)
          end
        end)
      end,
    }
  },
}