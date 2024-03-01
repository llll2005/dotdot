local sidebar = require("sidebar-nvim")
local opts = {open = true}
sidebar.setup(optsi)
require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = nil,
    open = true,
    side = "right",
    initial_width = 35,
    hide_statusline = false,
    update_interval = 1000,
    section_separator = {"", "-----", ""},
    section_title_separator = {""},
    containers = {
        attach_shell = "/usr/bin/zsh", show_all = true, interval = 5000,
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "for tsaizhifan" } } },
    todos = { ignored_paths = { "~" } },
    sections = {
        "datetime",
        "git",
        "diagnostics",
        require("dap-sidebar-nvim.breakpoints")
    },
    dap = {
        breakpoints = {
            icon = "🔍"
        }
    }
})
