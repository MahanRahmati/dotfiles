return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    ft = {
      "html",
      "css",
      "php",
      "blade",
      "twig",
      "vue",
      "heex",
      "astro",
      "templ",
      "svelte",
      "elixir",
      "htmldjango",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    opts = {},
  },
}
