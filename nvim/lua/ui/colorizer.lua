-- Alwyas update the color values in cmp_docs even if it not focused
require 'colorizer'.setup {
  filetypes = {
    '*'; -- Highlight all files, but customize some others.
    cmp_docs = {always_update = true}
  },
}
