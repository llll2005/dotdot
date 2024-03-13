require("auto-header").setup({
    -- if true, a header will automatically be added when a file is first saved
    create = true,
    -- if true, some fields of the existing header will be updated
    update = true,
    -- languages for which the plugin is enabled. To enable it to all files, add "*"
    languages = { "cpp", "python", "bash", "rust", "lua", "c", "java" },
    -- The keybinding to use (in normal mode only) that will add or refresh the header
    -- Note that it will ignore the create / update parameters specified above, but
    -- will still require a valid template and project information.
    key = nil,
    -- The templates to use to create the headers, one by language ("*" will be used if no specific one was found)
    -- The language is determined by neovim’s buffer filetype.
    templates = {
        {
            -- The language for which this template applies
            language = "*",
            -- The prefix of each line of the header ("auto" is allowed, the buffer’s commentstring will then be used)
            prefix = "--",
            -- If block and block_length are both set, the header will take the form of a block
            block = "-",
            block_length = 0,
            -- Lines to add before the header
            before = {},
            -- Lines to add after the header
            after = { "" },
            -- The comment lines of the buffer
            -- Some fields preceded by # will be set if known or given
            template = {
                "File: #file_relative_path",
                "Project: #project_name",
                "Creation date: #date_now",
                "Author: #author_name <#author_mail>",
                "-----",
                "Last modified: #date_now",
                "Modified By: #author_name",
                "-----",
            },
            -- All the lines beginning with these patterns will be updated
            track_change = {
                "File: ",
                "Last modified: ",
                "Modified By: ",
                "Copyright ",
            },
        }
    },
})

