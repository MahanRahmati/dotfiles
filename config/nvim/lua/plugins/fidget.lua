return {
  {
    "j-hui/fidget.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      notification = {
        window = {
          winblend = 0,
          x_padding = 0,
        },
      },
    },
  },
}
