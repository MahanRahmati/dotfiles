return {
  {
    "sourcegraph/sg.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      enable_cody = true,
    },
    keys = {
      { "<leader>C", "<cmd>CodyToggle<CR>", desc = "Cody Toggle" },
    },
  },
}
