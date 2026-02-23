return {
  "Eandrju/cellular-automaton.nvim",
  cmd = "CellularAutomaton",
  keys = {
    { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "FML: Code Falling" },
    { "<leader>fms", "<cmd>CellularAutomaton slide<cr>", desc = "FML: Code Sliding" },
  },
  config = function()
    local automaton = require("cellular-automaton")

    -- 註冊你自定義的 'slide' 動畫
    automaton.register_animation({
      fps = 60, -- 配合你 Predator 筆電的高刷螢幕
      name = "slide",
      update = function(grid)
        for i = 1, #grid do
          local prev = grid[i][#(grid[i])]
          for j = 1, #(grid[i]) do
            grid[i][j], prev = prev, grid[i][j]
          end
        end
        return true
      end,
    })
  end,
}