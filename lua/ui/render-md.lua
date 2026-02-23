return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ft = { 'markdown', 'norg', 'rmd', 'org' },
  opts = {
    -- 針對你喜歡的標題風格進行微調
    heading = {
      sign = true,
      icons = { "◉ ", "○ ", "✸ ", "✿ " },
      backgrounds = { 'Headline1', 'Headline2', 'Headline3', 'Headline4', 'Headline5', 'Headline6' },
    },
    -- 這是 Headlines.nvim 做不到的強大功能：
    code = {
      sign = false,
      width = 'block',
      right_pad = 1,
    },
    checkbox = {
      enabled = true, -- 非常適合用來管理讀書進度 (TODO list)
    },
    latex = {
      enabled = true, -- 對資工系學生非常有用的公式渲染
    },
  },
}