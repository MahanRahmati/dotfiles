return {
  {
    "lewis6991/satellite.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      return {
        current_only = true,
        width = 1,
      }
    end,
    config = function(_, opts)
      require("satellite").setup(opts)
    end,
  },
}
