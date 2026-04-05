vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd "nvim-treesitter"
      end
      vim.cmd "TSUpdate"
    end
  end,
})

vim.pack.add {
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
  },
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/hiphish/rainbow-delimiters.nvim",
}

require("treesitter-context").setup {
  max_lines = 3,
  multiline_threshold = 1,
}

require("rainbow-delimiters.setup").setup {}

function _G.enable_treesitter(lang)
  local treesitter_ok, nvim_treesitter = pcall(require, "nvim-treesitter")
  if treesitter_ok then
    local installed = nvim_treesitter.get_installed "parsers"
    if vim.tbl_contains(installed, lang) then
      vim.treesitter.start()
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    else
      nvim_treesitter.install({ lang }):wait(300000)
      vim.cmd "e"
    end
  end
end
