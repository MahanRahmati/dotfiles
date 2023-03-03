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
    commit = "e0926b6abc84578f44fb8917d61cdee22188639e",
  },

  -- Use Neovim as a language server to inject LSP diagnostics, code actions,
  -- and more via Lua.
  {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "689cdd78f70af20a37b5309ebc287ac645ae4f76",
  },

  -- Standalone UI for LSP progress.
  {
    "j-hui/fidget.nvim",
    commit = "688b4fec4517650e29c3e63cfbb6e498b3112ba1",
  },

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  {
    "williamboman/mason.nvim",
    commit = "7175340eee0b1b4a86b38794d8c21fdcfa01376b",
  },

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "e4badf7984f7a5f0ac7dc10657dbedbd99a82f94",
  },

  -- Extension to mason.nvim that makes it easier to use null-ls with
  -- mason.nvim
  {
    "jayp0521/mason-null-ls.nvim",
    commit = "c05de94bfedfa42060b09037d5faac4025c9374d",
  },

  ----------------------------------------------------------------------
  --                            Completion                            --
  ----------------------------------------------------------------------

  -- Completion plugin for Neovim
  {
    "hrsh7th/nvim-cmp",
    commit = "01f697a68905f9dcae70960a9eb013695a17f9a2",
  },

  -- A nvim-cmp source for Neovim builtin LSP client.
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
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
    commit = "3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1",
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
    commit = "8fcc934a52af96120fe26358985c10c035984b53",
  },

  ----------------------------------------------------------------------
  --                  Programming Languages Support                   --
  ----------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  {
    "akinsho/flutter-tools.nvim",
    commit = "5a32382da12dc129f2f5893dfbab4f369a081a5b",
  },

  -- Tools for better development in rust using Neovim's builtin LSP.
  {
    "simrat39/rust-tools.nvim",
    commit = "71d2cf67b5ed120a0e31b2c8adb210dd2834242f",
  },

  ----------------------------------------------------------------------
  --                              Syntax                              --
  ----------------------------------------------------------------------

  -- Neovim Treesitter configurations and abstraction layer.
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "f225f53510986997ae843b2a825df8083d85a191",
  },

  -- A plugin for adding/changing/deleting surrounding delimiter pairs.
  {
    "kylechui/nvim-surround",
    commit = "8680311f6de05d45b010883db7cc1912b7f0d0e4",
  },

  ----------------------------------------------------------------------
  --                             Snippet                              --
  ----------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  {
    "L3MON4D3/LuaSnip",
    commit = "58236e8b2f20de23ff35106dace9212b41d78860",
  },

  -- Set of preconfigured snippets for different languages.
  {
    "rafamadriz/friendly-snippets",
    commit = "009887b76f15d16f69ae1341f86a7862f61cf2a1",
  },

  ----------------------------------------------------------------------
  --                           Fuzzy Finder                           --
  ----------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  {
    "nvim-telescope/telescope.nvim",
    commit = "a3f17d3baf70df58b9d3544ea30abe52a7a832c2",
  },

  ----------------------------------------------------------------------
  --                          File Explorer                           --
  ----------------------------------------------------------------------

  -- File Browser extension for telescope.nvim.
  {
    "nvim-telescope/telescope-file-browser.nvim",
    commit = "61b3769065131129716974f7fb63f82ee409bd80",
  },

  ----------------------------------------------------------------------
  --                             Project                              --
  ----------------------------------------------------------------------

  -- An all in one Neovim plugin that provides superior project management.
  {
    "ahmedkhalf/project.nvim",
    commit = "1c2e9c93c7c85126c2197f5e770054f53b1926fb",
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
    commit = "e99d733e0213ceb8f548ae6551b04ae32e590c80",
  },

  ----------------------------------------------------------------------
  --                            Cursorline                            --
  ----------------------------------------------------------------------

  -- Highlight the word under the cursor.
  {
    "RRethy/vim-illuminate",
    commit = "49062ab1dd8fec91833a69f0a1344223dd59d643",
  },

  ----------------------------------------------------------------------
  --                             Startup                              --
  ----------------------------------------------------------------------

  -- A fast and highly customizable greeter for Neovim.
  {
    "goolord/alpha-nvim",
    commit = "4b0ba68022d8612b04b26844f1ce5e708c0d23b0",
  },

  ----------------------------------------------------------------------
  --                               Icon                               --
  ----------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  {
    "nvim-tree/nvim-web-devicons",
    commit = "c2c2317f356c8b7da0252f5da758f71bb60bb6b2",
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
    commit = "9c987081390753b625e2d94e749e80e9b4a3e082",
  },

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  {
    "stevearc/dressing.nvim",
    commit = "5f44f829481640be0f96759c965ae22a3bcaf7ce",
  },

  -- Display a line as colorcolumn.
  {
    "lukas-reineke/virt-column.nvim",
    commit = "93b40ea038f676f5a72d7d1f2336fe7b051fc0ce",
  },

  -- Delete Neovim buffers without losing window layout.
  {
    "famiu/bufdelete.nvim",
    commit = "8933abc09df6c381d47dc271b1ee5d266541448e",
  },

  ----------------------------------------------------------------------
  --                       Terminal Integration                       --
  ----------------------------------------------------------------------

  -- A Neovim Lua plugin to help easily manage multiple terminal windows.
  {
    "akinsho/toggleterm.nvim",
    commit = "31d38d11390bcd35a568fcc65a79b7d6ec89de62",
  },

  ----------------------------------------------------------------------
  --                      Neovim Lua Development                      --
  ----------------------------------------------------------------------

  -- Useful lua functions used by lots of plugins.
  {
    "nvim-lua/plenary.nvim",
    commit = "253d34830709d690f013daf2853a9d21ad7accab",
  },

  ----------------------------------------------------------------------
  --                      Dependency management                       --
  ----------------------------------------------------------------------

  -- Rust dependency management for Cargo.toml.
  {
    "Saecki/crates.nvim",
    commit = "c33aae75745877ee1ef16f5781478f4f2f120623",
  },

  ----------------------------------------------------------------------
  --                               Git                                --
  ----------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  {
    "lewis6991/gitsigns.nvim",
    commit = "3b6c0a6412b31b91eb26bb8f712562cf7bb1d3be",
  },

  ----------------------------------------------------------------------
  --                              Motion                              --
  ----------------------------------------------------------------------

  -- Add fancy sub-cursor to signcolumn to show your scroll or jump direction.
  {
    "gen740/SmoothCursor.nvim",
    commit = "679b5ee2ef6db53c328642535e0e8fdcb8e9bdec",
  },

  ----------------------------------------------------------------------
  --                            Keybinding                            --
  ----------------------------------------------------------------------

  -- Neovim plugin that shows a popup with possible keybindings of the command
  -- you started typing.
  {
    "folke/which-key.nvim",
    commit = "fb027738340502b556c3f43051f113bcaa7e8e63",
  },

  -- Create shortcuts to escape insert mode without getting delay.
  {
    "max397574/better-escape.nvim",
    commit = "426d29708064d5b1bfbb040424651c92af1f3f64",
  },

  ----------------------------------------------------------------------
  --                            Scrollbar                             --
  ----------------------------------------------------------------------

  -- Extensible scrollbar that shows diagnostics and search results.
  {
    "petertriho/nvim-scrollbar",
    commit = "75210c554e935740448cfb532d8a671ae544bb1b",
  },

  ----------------------------------------------------------------------
  --                         Editing Support                          --
  ----------------------------------------------------------------------

  -- A minimalist autopairs for Neovim written by Lua.
  {
    "windwp/nvim-autopairs",
    commit = "ab49517cfd1765b3f3de52c1f0fda6190b44e27b",
  },

  -- Shows floating hover with the current function/block context.
  {
    "nvim-treesitter/nvim-treesitter-context",
    commit = "895ec44f5c89bc67ba5440aef3d1f2efa3d59a41",
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
    commit = "03ff45fab0c4adad4d252e25b5b194e22caf5b4f",
  },

  ----------------------------------------------------------------------
  --                             Comment                              --
  ----------------------------------------------------------------------

  -- Smart and Powerful comment plugin for Neovim.
  {
    "numToStr/Comment.nvim",
    commit = "6821b3ae27a57f1f3cf8ed030e4a55d70d0c4e43",
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
    commit = "018bd04d80c9a73d399c1061fa0c3b14a7614399",
  },
}
