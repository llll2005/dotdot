return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
  keys = { -- 只有在需要手動開啟時才用，平常由 edgy 接管
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undo Tree" },
  },
}