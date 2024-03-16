return {
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      filetypes_denylist = {
        "alpha",
        "lazy",
        "mason",
        "toggleterm",
        "DressingSelect",
        "TelescopePrompt",
        "neo-tree",
        "dirbuf",
        "dirvish",
        "fugitive",
      },
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
}
