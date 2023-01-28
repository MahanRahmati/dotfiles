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

lazy.setup {

  ----------------------------------------------------------------------
  --                               LSP                                --
  ----------------------------------------------------------------------

  -- Quickstart configurations for the Neovim LSP client.
  {
    "neovim/nvim-lspconfig",
    commit = "1e988250a0f52a68ddb72905d623405d634e9c5d",
  },

  -- Use Neovim as a language server to inject LSP diagnostics, code actions,
  -- and more via Lua.
  {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "7b2b28e207a1df4ebb13c7dc0bd83f69b5403d71",
  },

  -- Standalone UI for LSP progress.
  {
    "j-hui/fidget.nvim",
    commit = "44585a0c0085765195e6961c15529ba6c5a2a13b",
  },

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  {
    "williamboman/mason.nvim",
    commit = "2469bfc2538652cb0cf88c129f67d38e46a9cb59",
  },

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "422b9745143150e16cd3fe331c74f6737de75e72",
  },

  -- Extension to mason.nvim that makes it easier to use null-ls with
  -- mason.nvim
  {
    "jayp0521/mason-null-ls.nvim",
    commit = "93946aef86b1409958c97ee5feaf30bdd1053e24",
  },

  ----------------------------------------------------------------------
  --                            Completion                            --
  ----------------------------------------------------------------------

  -- Completion plugin for Neovim
  {
    "hrsh7th/nvim-cmp",
    commit = "e7e2ef7031db8e0cfad7ad9916ec766ddd9dbb3b",
  },

  -- A nvim-cmp source for Neovim builtin LSP client.
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb",
  },

  -- A nvim-cmp source for luasnip completion.
  {
    "saadparwaiz1/cmp_luasnip",
    commit = "18095520391186d634a0045dacaa346291096566",
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
    commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6",
  },

  -- A nvim-cmp source for displaying function signatures.
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    commit = "d2768cb1b83de649d57d967085fe73c5e01f8fd7",
  },

  -- A nvim-cmp source for nerdfont icons.
  {
    "chrisgrieser/cmp-nerdfont",
    commit = "989baa81b3cb82890f232ae0b58dbea13ebf8f23",
  },

  -- A nvim-cmp source for look.
  {
    "octaltree/cmp-look",
    commit = "b39c50bcdf6199dddda56adc466c2bd9c951a960",
  },

  -- A nvim-cmp source for math calculation.
  {
    "hrsh7th/cmp-calc",
    commit = "50792f34a628ea6eb31d2c90e8df174671e4e7a0",
  },

  -- A nvim-cmp source for vim's cmdline.
  {
    "hrsh7th/cmp-cmdline",
    commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063",
  },

  ----------------------------------------------------------------------
  --                  Programming Languages Support                   --
  ----------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  {
    "akinsho/flutter-tools.nvim",
    commit = "ae0be3cef35c0cb41d6c7f814a19b3402d50fd7a",
  },

  -- Tools for better development in rust using Neovim's builtin LSP.
  {
    "simrat39/rust-tools.nvim",
    commit = "b297167d9e01accc9b9afe872ce91e791df2dde0",
  },

  ----------------------------------------------------------------------
  --                              Syntax                              --
  ----------------------------------------------------------------------

  -- Neovim Treesitter configurations and abstraction layer.
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "5812ae26f749f38fb6a315bd0c3544e6ed9905d4",
  },

  -- A plugin for adding/changing/deleting surrounding delimiter pairs.
  {
    "kylechui/nvim-surround",
    commit = "ad56e6234bf42fb7f7e4dccc7752e25abd5ec80e",
  },

  ----------------------------------------------------------------------
  --                             Snippet                              --
  ----------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  {
    "L3MON4D3/LuaSnip",
    commit = "94f192cf5f0a1931b3035c2d8affdebec460968c",
  },

  -- Set of preconfigured snippets for different languages.
  {
    "rafamadriz/friendly-snippets",
    commit = "a6f7a1609addb4e57daa6bedc300f77f8d225ab7",
  },

  ----------------------------------------------------------------------
  --                           Fuzzy Finder                           --
  ----------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  {
    "nvim-telescope/telescope.nvim",
    commit = "dce1156ca103b8222e4abbfc63f9c6887abf5ec6",
  },

  ----------------------------------------------------------------------
  --                          File Explorer                           --
  ----------------------------------------------------------------------

  -- File Browser extension for telescope.nvim.
  {
    "nvim-telescope/telescope-file-browser.nvim",
    commit = "304508fb7bea78e3c0eeddd88c4837501e403ae8",
  },

  ----------------------------------------------------------------------
  --                             Project                              --
  ----------------------------------------------------------------------

  -- An all in one Neovim plugin that provides superior project management.
  {
    "ahmedkhalf/project.nvim",
    commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
  },

  ----------------------------------------------------------------------
  --                              Color                               --
  ----------------------------------------------------------------------

  -- A high-performance color highlighter for Neovim which has no external
  -- dependencies.
  {
    "NvChad/nvim-colorizer.lua",
    commit = "760e27df4dd966607e8fb7fd8b6b93e3c7d2e193",
  },

  ----------------------------------------------------------------------
  --                           Colorscheme                            --
  ----------------------------------------------------------------------

  -- NvChad's base46 theme plugin
  {
    "NvChad/base46",
    commit = "be301b2cd309394dfa62e8c569250e4fb58dd763",
  },

  ----------------------------------------------------------------------
  --                            Statusline                            --
  ----------------------------------------------------------------------

  -- A blazing fast and easy to configure Neovim statusline.
  {
    "nvim-lualine/lualine.nvim",
    commit = "0050b308552e45f7128f399886c86afefc3eb988",
  },

  ----------------------------------------------------------------------
  --                            Cursorline                            --
  ----------------------------------------------------------------------

  -- Highlight the word under the cursor.
  {
    "RRethy/vim-illuminate",
    commit = "4e1d43cdc39e35f495c7b39a78a349b4d5badad0",
  },

  ----------------------------------------------------------------------
  --                             Startup                              --
  ----------------------------------------------------------------------

  -- A fast and highly customizable greeter for Neovim.
  {
    "goolord/alpha-nvim",
    commit = "21a0f2520ad3a7c32c0822f943368dc063a569fb",
  },

  ----------------------------------------------------------------------
  --                               Icon                               --
  ----------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  {
    "nvim-tree/nvim-web-devicons",
    commit = "a421d183ef37dfa13f51a5805bed2381aebf9080",
  },

  ----------------------------------------------------------------------
  --                             Utility                              --
  ----------------------------------------------------------------------

  -- Automatically create missing directories when saving a file.
  {
    "jghauser/mkdir.nvim",
    commit = "c55d1dee4f099528a1853b28bb28caa802eba217",
  },

  -- A fancy, configurable, notification manager for Neovim.
  {
    "rcarriga/nvim-notify",
    commit = "bdd647f61a05c9b8a57c83b78341a0690e9c29d7",
  },

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  {
    "stevearc/dressing.nvim",
    commit = "4436d6f41e2f6b8ada57588acd1a9f8b3d21453c",
  },

  -- Display a line as colorcolumn.
  {
    "lukas-reineke/virt-column.nvim",
    commit = "93b40ea038f676f5a72d7d1f2336fe7b051fc0ce",
  },

  -- Delete Neovim buffers without losing window layout.
  {
    "famiu/bufdelete.nvim",
    commit = "f79e9d186b42fba5f1b1362006e7c70240db97a4",
  },

  ----------------------------------------------------------------------
  --                       Terminal Integration                       --
  ----------------------------------------------------------------------

  -- A Neovim Lua plugin to help easily manage multiple terminal windows.
  {
    "akinsho/toggleterm.nvim",
    commit = "a54e6c471ce1cd8ef8357e34598a28a955297131",
  },

  ----------------------------------------------------------------------
  --                      Neovim Lua Development                      --
  ----------------------------------------------------------------------

  -- Useful lua functions used by lots of plugins.
  {
    "nvim-lua/plenary.nvim",
    commit = "1c7e3e6b0f4dd5a174fcea9fda8a4d7de593b826",
  },

  ----------------------------------------------------------------------
  --                      Dependency management                       --
  ----------------------------------------------------------------------

  -- Rust dependency management for Cargo.toml.
  {
    "Saecki/crates.nvim",
    commit = "c2e9929c3ac40776c30bc7b328a7dff98756050a",
  },

  ----------------------------------------------------------------------
  --                               Git                                --
  ----------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  {
    "lewis6991/gitsigns.nvim",
    commit = "0d4fe37ba5285171f3729da955955205f3fa945b",
  },

  ----------------------------------------------------------------------
  --                              Motion                              --
  ----------------------------------------------------------------------

  -- Add fancy sub-cursor to signcolumn to show your scroll or jump direction.
  {
    "gen740/SmoothCursor.nvim",
    commit = "79f02173317a76ab406d182ac89b20b59f5e34fe",
  },

  ----------------------------------------------------------------------
  --                            Keybinding                            --
  ----------------------------------------------------------------------

  -- Neovim plugin that shows a popup with possible keybindings of the command
  -- you started typing.
  {
    "folke/which-key.nvim",
    commit = "684e96c5e8477f1ee9b3f2e9a12d802fd12c5531",
  },

  -- Create shortcuts to escape insert mode without getting delay.
  {
    "max397574/better-escape.nvim",
    commit = "6fed33809cde3b416087fc540ad9eb17ec470193",
  },

  ----------------------------------------------------------------------
  --                            Scrollbar                             --
  ----------------------------------------------------------------------

  -- Extensible scrollbar that shows diagnostics and search results.
  {
    "petertriho/nvim-scrollbar",
    commit = "6a2065fbcd032075a06d2ab54508b69842bc4496",
  },

  ----------------------------------------------------------------------
  --                         Editing Support                          --
  ----------------------------------------------------------------------

  -- A minimalist autopairs for Neovim written by Lua.
  {
    "windwp/nvim-autopairs",
    commit = "31042a5823b55c4bfb30efcbba2fc1b5b53f90dc",
  },

  -- Shows floating hover with the current function/block context.
  {
    "nvim-treesitter/nvim-treesitter-context",
    commit = "cacee4828152dd3a83736169ae61bbcd29a3d213",
  },

  -- Peek lines in a non-obtrusive way.
  {
    "nacro90/numb.nvim",
    commit = "d95b7ea62e320b02ca1aa9df3635471a88d6f3b1",
  },

  -- Reopen files at your last edit position.
  {
    "ethanholz/nvim-lastplace",
    commit = "65c5d6e2501a3af9c2cd15c6548e67fa035bf640",
  },

  -- A telescope extension to visualize your undo tree and fuzzy-search changes
  -- in it.
  {
    "debugloop/telescope-undo.nvim",
    commit = "f2ca7c914134c7e6eb9275ee09863141caa77a3f",
  },

  ----------------------------------------------------------------------
  --                             Comment                              --
  ----------------------------------------------------------------------

  -- Smart and Powerful comment plugin for Neovim.
  {
    "numToStr/Comment.nvim",
    commit = "eab2c83a0207369900e92783f56990808082eac2",
  },

  -- Highlight, list and search todo comments in your projects.
  {
    "folke/todo-comments.nvim",
    commit = "74c7d28cb50b0713c881ef69bcb6cdd77d8907d1",
  },

  -- Adds a comment frame based on the source file.
  {
    "s1n7ax/nvim-comment-frame",
    commit = "7a7d34ee7a236a89ffe5674bf794358ee12a7df8",
  },

  ----------------------------------------------------------------------
  --                              Indent                              --
  ----------------------------------------------------------------------

  -- IndentLine replacement in Lua with more features and treesitter support.
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "8299fe7703dfff4b1752aeed271c3b95281a952d",
  },
}
