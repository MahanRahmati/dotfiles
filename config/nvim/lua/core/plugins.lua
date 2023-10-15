-- Automatically install lazy
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  vim.api.nvim_err_writeln "Failed to load lazy"
  return
end

lazy.setup({

  ----------------------------------------------------------------------
  --                               LSP                                --
  ----------------------------------------------------------------------

  -- Quickstart configurations for the Neovim LSP client.
  {
    "neovim/nvim-lspconfig",
    commit = "8f3ddc448769f563248654a5099c943c7139137e",
  },

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  {
    "williamboman/mason.nvim",
    commit = "cd7835b15f5a4204fc37e0aa739347472121a54c",
  },

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "e7b64c11035aa924f87385b72145e0ccf68a7e0a",
  },

  -- Another lsp progress status for Neovim.
  {
    "linrongbin16/lsp-progress.nvim",
    commit = "df7a3d0d865d584552ab571295e73868e736e60f",
  },

  ----------------------------------------------------------------------
  --                            Completion                            --
  ----------------------------------------------------------------------

  -- Completion plugin for Neovim
  {
    "hrsh7th/nvim-cmp",
    commit = "5dce1b778b85c717f6614e3f4da45e9f19f54435",
  },

  -- A nvim-cmp source for Neovim builtin LSP client.
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = "44b16d11215dce86f253ce0c30949813c0a90765",
  },

  -- A nvim-cmp source for luasnip completion.
  {
    "saadparwaiz1/cmp_luasnip",
    commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843",
  },

  -- A nvim-cmp source for filesystem paths.
  {
    "hrsh7th/cmp-path",
    commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
  },

  -- A nvim-cmp source for buffer words.
  {
    "hrsh7th/cmp-buffer",
    commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
  },

  -- A nvim-cmp source for the Neovim Lua API.
  {
    "hrsh7th/cmp-nvim-lua",
    commit = "f12408bdb54c39c23e67cab726264c10db33ada8",
  },

  -- A nvim-cmp source for displaying function signatures.
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    commit = "3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1",
  },

  -- A nvim-cmp source for nerdfont icons.
  {
    "chrisgrieser/cmp-nerdfont",
    commit = "853a946eda00016f60c0602a20d8595c6eb074a6",
  },

  -- A nvim-cmp source for look.
  {
    "octaltree/cmp-look",
    commit = "b39c50bcdf6199dddda56adc466c2bd9c951a960",
  },

  -- A nvim-cmp source for math calculation.
  {
    "hrsh7th/cmp-calc",
    commit = "ce91d14d2e7a8b3f6ad86d85e34d41c1ae6268d9",
  },

  -- A nvim-cmp source for vim's cmdline.
  {
    "hrsh7th/cmp-cmdline",
    commit = "8ee981b4a91f536f52add291594e89fb6645e451",
  },

  -- The official Sourcegraph/Cody plugin for Neovim
  {
    "sourcegraph/sg.nvim",
    commit = "0a3c7f76a5e81452b5d4bd78a7bb8cd2603445b5",
  },

  ----------------------------------------------------------------------
  --                  Programming Languages Support                   --
  ----------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  {
    "akinsho/flutter-tools.nvim",
    commit = "7350750d46fbeb4d2bb4878157b658d435935299",
  },

  -- Tools for better development in rust using Neovim's builtin LSP.
  {
    "simrat39/rust-tools.nvim",
    commit = "0cc8adab23117783a0292a0c8a2fbed1005dc645",
  },

  ----------------------------------------------------------------------
  --                              Syntax                              --
  ----------------------------------------------------------------------

  -- Neovim Treesitter configurations and abstraction layer.
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "f8fcb0da0618be551560a57fa1457dc6f889e568",
  },

  -- Generic log syntax highlighting and filetype management for Neovim.
  {
    "fei6409/log-highlight.nvim",
    commit = "8b7dd3c3ccaa553d6ed45ebcae32552689f56108",
  },

  ----------------------------------------------------------------------
  --                             Snippet                              --
  ----------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  {
    "L3MON4D3/LuaSnip",
    commit = "0df29db3543837f8b41597f2640397c5ec792b7b",
  },

  -- Set of preconfigured snippets for different languages.
  {
    "rafamadriz/friendly-snippets",
    commit = "43727c2ff84240e55d4069ec3e6158d74cb534b6",
  },

  ----------------------------------------------------------------------
  --                           Fuzzy Finder                           --
  ----------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  {
    "nvim-telescope/telescope.nvim",
    commit = "74ce793a60759e3db0d265174f137fb627430355",
  },

  ----------------------------------------------------------------------
  --                          File Explorer                           --
  ----------------------------------------------------------------------

  -- Neo-tree is a Neovim plugin to browse the file system and other tree like
  -- structures in whatever style suits you, including sidebars, floating
  -- windows, netrw split style, or all of them at once.
  {
    "nvim-neo-tree/neo-tree.nvim",
    commit = "63ebe879ad4798b66d29c0b2c8d04942389d438e",
  },

  ----------------------------------------------------------------------
  --                             Project                              --
  ----------------------------------------------------------------------

  -- An all in one Neovim plugin that provides superior project management.
  {
    "ahmedkhalf/project.nvim",
    commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
  },

  ----------------------------------------------------------------------
  --                              Color                               --
  ----------------------------------------------------------------------

  -- A high-performance color highlighter for Neovim which has no external
  -- dependencies.
  {
    "NvChad/nvim-colorizer.lua",
    commit = "dde3084106a70b9a79d48f426f6d6fec6fd203f7",
  },

  ----------------------------------------------------------------------
  --                           Colorscheme                            --
  ----------------------------------------------------------------------

  -- Warm mid-tone dark theme to show off your vibrant self! with support for
  -- native LSP, Tree-sitter, and more 🍨!
  {
    "catppuccin/nvim",
    commit = "f03cbfb65664e55451d91616242bd1c63919da10",
  },

  ----------------------------------------------------------------------
  --                            Statusline                            --
  ----------------------------------------------------------------------

  -- A blazing fast and easy to configure Neovim statusline.
  {
    "nvim-lualine/lualine.nvim",
    commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63",
  },

  ----------------------------------------------------------------------
  --                            Cursorline                            --
  ----------------------------------------------------------------------

  -- Highlight the word under the cursor.
  {
    "RRethy/vim-illuminate",
    commit = "3bd2ab64b5d63b29e05691e624927e5ebbf0fb86",
  },

  ----------------------------------------------------------------------
  --                             Startup                              --
  ----------------------------------------------------------------------

  -- A fast and highly customizable greeter for Neovim.
  {
    "goolord/alpha-nvim",
    commit = "234822140b265ec4ba3203e3e0be0e0bb826dff5",
  },

  ----------------------------------------------------------------------
  --                               Icon                               --
  ----------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  {
    "nvim-tree/nvim-web-devicons",
    commit = "3af745113ea537f58c4b1573b64a429fefad9e07",
  },

  ----------------------------------------------------------------------
  --                             Utility                              --
  ----------------------------------------------------------------------

  -- A fancy, configurable, notification manager for Neovim.
  {
    "rcarriga/nvim-notify",
    commit = "e4a2022f4fec2d5ebc79afa612f96d8b11c627b3",
  },

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  {
    "stevearc/dressing.nvim",
    commit = "1f2d1206a03bd3add8aedf6251e4534611de577f",
  },

  -- Display a line as colorcolumn.
  {
    "lukas-reineke/virt-column.nvim",
    commit = "9c82009c53e5f9d43b6c0f5e8cb69c53663b786a",
  },

  -- Delete Neovim buffers without losing window layout.
  {
    "famiu/bufdelete.nvim",
    commit = "07d1f8ba79dec59d42b975a4df1c732b2e4e37b4",
  },

  -- Pomodoro time tracker for NeoVim written entirely in LUA
  {
    "dbinagi/nomodoro",
    commit = "42c6775da86558ca96b5d20b7782f442187ca8d8",
  },

  ----------------------------------------------------------------------
  --                       Terminal Integration                       --
  ----------------------------------------------------------------------

  -- A Neovim Lua plugin to help easily manage multiple terminal windows.
  {
    "akinsho/toggleterm.nvim",
    commit = "c80844fd52ba76f48fabf83e2b9f9b93273f418d",
  },

  ----------------------------------------------------------------------
  --                      Neovim Lua Development                      --
  ----------------------------------------------------------------------

  -- Useful lua functions used by lots of plugins.
  {
    "nvim-lua/plenary.nvim",
    commit = "50012918b2fc8357b87cff2a7f7f0446e47da174",
  },

  -- UI Component Library.
  {
    "MunifTanjim/nui.nvim",
    commit = "c0c8e347ceac53030f5c1ece1c5a5b6a17a25b32",
  },

  ----------------------------------------------------------------------
  --                               Git                                --
  ----------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  {
    "lewis6991/gitsigns.nvim",
    commit = "ff01d34daaed72f271a8ffa088a7e839a60c640f",
  },

  --  Single tabpage interface for easily cycling through diffs for all
  --  modified files for any git rev.
  {
    "sindrets/diffview.nvim",
    commit = "d38c1b5266850f77f75e006bcc26213684e1e141",
  },

  ----------------------------------------------------------------------
  --                            Keybinding                            --
  ----------------------------------------------------------------------

  -- Neovim plugin that shows a popup with possible keybindings of the command
  -- you started typing.
  {
    "folke/which-key.nvim",
    commit = "6962dae3565369363b59dd51fb206051555fcb4d",
  },

  -- Create shortcuts to escape insert mode without getting delay.
  {
    "max397574/better-escape.nvim",
    commit = "7031dc734add47bb71c010e0551829fa5799375f",
  },

  ----------------------------------------------------------------------
  --                         Editing Support                          --
  ----------------------------------------------------------------------

  -- A minimalist autopairs for Neovim written by Lua.
  {
    "windwp/nvim-autopairs",
    commit = "4c21ec0b9068cd5c22e960260467b94b841fd4f8",
  },

  -- Rainbow delimiters for Neovim through Tree-sitter
  {
    "HiPhish/nvim-ts-rainbow2",
    commit = "b3120cd5ae9ca524af9cb602f41e12e301fa985f",
  },

  -- Shows floating hover with the current function/block context.
  {
    "nvim-treesitter/nvim-treesitter-context",
    commit = "82c695951612911421e8e21068ba5fc2c2e2c212",
  },

  -- Peek lines in a non-obtrusive way.
  {
    "nacro90/numb.nvim",
    commit = "3f7d4a74bd456e747a1278ea1672b26116e0824d",
  },

  ----------------------------------------------------------------------
  --                             Comment                              --
  ----------------------------------------------------------------------

  -- Smart and Powerful comment plugin for Neovim.
  {
    "numToStr/Comment.nvim",
    commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
  },

  -- Highlight, list and search todo comments in your projects.
  {
    "folke/todo-comments.nvim",
    commit = "3094ead8edfa9040de2421deddec55d3762f64d1",
  },

  -- Adds a comment frame based on the source file.
  {
    "s1n7ax/nvim-comment-frame",
    commit = "7a7d34ee7a236a89ffe5674bf794358ee12a7df8",
  },

  ----------------------------------------------------------------------
  --                            Formatting                            --
  ----------------------------------------------------------------------

  -- A lightweight formatting engine that plays nice with LSP.
  {
    "stevearc/conform.nvim",
    commit = "ea44a6f0a5b8f3924537b004a76e8aef26f2b22a",
  },

  ----------------------------------------------------------------------
  --                              Indent                              --
  ----------------------------------------------------------------------
  -- A minimal and blazing fast indentline plugin by using
  -- nvim_set_decoration_provide api.
  {
    "nvimdev/indentmini.nvim",
    commit = "a58129ae424fd6d8e0e2e7f6ce06c0443101e370",
  },
}, {
  ui = { border = "rounded" },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})
