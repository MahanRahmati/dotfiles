return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        preloadFileSize = 10000,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}
