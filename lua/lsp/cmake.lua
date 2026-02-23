return {
  "Civitasv/cmake-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "stevearc/overseer.nvim" },
  opts = {
    cmake_command = "cmake",
    cmake_build_directory = "build/${variant:buildType}",
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },

    -- [核心更新]：改用 Overseer 作為執行引擎
    cmake_executor = {
      name = "overseer",
      opts = {
        new_task_opts = {
          strategy = {
            "orchestrator",
            autostart = true,
            direction = "right",
          },
        },
      },
    },
    -- 執行 (Run) 時也用 Overseer
    cmake_runner = {
      name = "overseer",
      opts = {},
    },
  },
  keys = {
    { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
    { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
    { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
    { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
    { "<leader>cs", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Select Target" },
  }
}