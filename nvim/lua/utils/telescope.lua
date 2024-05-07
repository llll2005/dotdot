local builtin = require('telescope.builtin')
require('telescope').load_extension('bookmarks')
-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了

vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- 找檔名
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})  -- 找文本
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
