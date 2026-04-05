vim.pack.add { "https://github.com/DrKJeff16/project.nvim" }

require("project").setup {
  patterns = {
    ".git",
    ".github",
    "_darcs",
    ".hg",
    ".bzr",
    ".svn",
    "Pipfile",
    "pyproject.toml",
    ".pre-commit-config.yaml",
    ".pre-commit-config.yml",
    ".csproj",
    ".sln",
    ".nvim.lua",
    ".neoconf.json",
    "neoconf.json",
    ".stylua.toml",
  },
}
