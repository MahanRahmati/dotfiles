local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.api.nvim_err_writeln "Failed to load packer"
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins
return packer.startup(function(use)
  ----------------------------------------------------------------------
  --                          Plugin Manager                          --
  ----------------------------------------------------------------------

  -- A use-package inspired plugin manager for Neovim.
  use {
    "wbthomason/packer.nvim",
    commit = "6afb67460283f0e990d35d229fd38fdc04063e0a",
  }

  ----------------------------------------------------------------------
  --                               LSP                                --
  ----------------------------------------------------------------------

  -- Quickstart configurations for the Neovim LSP client.
  use {
    "neovim/nvim-lspconfig",
    commit = "2b802ab1e94d595ca5cc7c55f9d1fb9b17f9754c",
  }

  -- A code outline window for skimming and quick navigation.
  use {
    "stevearc/aerial.nvim",
    commit = "6146e0aaea0c42f8cc151827a0ac83408d11b639",
  }

  -- Use Neovim as a language server to inject LSP diagnostics, code actions,
  -- and more via Lua.
  use {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "07d4ed4c6b561914aafd787453a685598bec510f",
  }

  -- Standalone UI for LSP progress.
  use {
    "j-hui/fidget.nvim",
    commit = "2cf9997d3bde2323a1a0934826ec553423005a26",
  }

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  use {
    "williamboman/mason.nvim",
    commit = "30a945103ee672a8fc79dc1161bca3e67383fc0b",
  }

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  use {
    "williamboman/mason-lspconfig.nvim",
    commit = "a1e2219ecea273d52b1ce1d527dd3a93cfe5b396",
  }

  -- Extension to mason.nvim that makes it easier to use null-ls with
  -- mason.nvim
  use {
    "jayp0521/mason-null-ls.nvim",
    commit = "564ed1231ee78144ac1bb2da914c4c7791552005",
  }

  -- A pretty diagnostics list to help you solve all the trouble your code is
  -- causing.
  use {
    "folke/trouble.nvim",
    commit = "ed65f84abc4a1e5d8f368d7e02601fc0357ea15e",
  }

  ----------------------------------------------------------------------
  --                            Completion                            --
  ----------------------------------------------------------------------

  -- Completion plugin for Neovim
  use {
    "hrsh7th/nvim-cmp",
    commit = "aee40113c2ba3ab158955f233ca083ca9958d6f8",
  }

  -- A nvim-cmp source for Neovim builtin LSP client.
  use {
    "hrsh7th/cmp-nvim-lsp",
    commit = "78924d1d677b29b3d1fe429864185341724ee5a2",
  }

  -- A nvim-cmp source for luasnip completion.
  use {
    "saadparwaiz1/cmp_luasnip",
    commit = "18095520391186d634a0045dacaa346291096566",
  }

  -- A nvim-cmp source for filesystem paths.
  use {
    "hrsh7th/cmp-path",
    commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
  }

  -- A nvim-cmp source for buffer words.
  use {
    "hrsh7th/cmp-buffer",
    commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
  }

  -- A nvim-cmp source for the Neovim Lua API.
  use {
    "hrsh7th/cmp-nvim-lua",
    commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
  }

  -- A nvim-cmp source for displaying function signatures.
  use {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    commit = "d2768cb1b83de649d57d967085fe73c5e01f8fd7",
  }

  -- A nvim-cmp source for nerdfont icons.
  use {
    "chrisgrieser/cmp-nerdfont",
    commit = "51e454660d70908cfeaaf1283b67b4bbf3b5f7dd",
  }

  -- A nvim-cmp source for look.
  use {
    "octaltree/cmp-look",
    commit = "b39c50bcdf6199dddda56adc466c2bd9c951a960",
  }

  ----------------------------------------------------------------------
  --                  Programming Languages Support                   --
  ----------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  use {
    "akinsho/flutter-tools.nvim",
    commit = "fc336d95ca00ae9c2a7c4fad57f131494fc825dd",
  }

  -- Tools for better development in rust using Neovim's builtin LSP.
  use {
    "simrat39/rust-tools.nvim",
    commit = "99fd1238c6068d0637df30b6cee9a264334015e9",
  }

  ----------------------------------------------------------------------
  --                              Syntax                              --
  ----------------------------------------------------------------------

  -- Neovim Treesitter configurations and abstraction layer.
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "2072692aaa4b6da7c354e66c2caf4b0a8f736858",
  }

  -- A plugin for adding/changing/deleting surrounding delimiter pairs.
  use {
    "kylechui/nvim-surround",
    commit = "87839e18d3953eb8cebd23a007183fd6c48863b5",
  }

  ----------------------------------------------------------------------
  --                             Snippet                              --
  ----------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  use {
    "L3MON4D3/LuaSnip",
    commit = "95ccfd97b2087e22676e2797e4ef024ec5b6b0bb",
  }

  -- Set of preconfigured snippets for different languages.
  use {
    "rafamadriz/friendly-snippets",
    commit = "c93311fbcc840210a2c0db574177d84a35a2c9c1",
  }

  ----------------------------------------------------------------------
  --                           Fuzzy Finder                           --
  ----------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  use {
    "nvim-telescope/telescope.nvim",
    commit = "7a4ffef931769c3fe7544214ed7ffde5852653f6",
  }

  ----------------------------------------------------------------------
  --                          File Explorer                           --
  ----------------------------------------------------------------------

  -- A simple and fast file explorer tree for Neovim.
  use {
    "nvim-tree/nvim-tree.lua",
    commit = "9d241e5f5889cf8d37c3a8054b3e55157549c283",
  }

  ----------------------------------------------------------------------
  --                             Project                              --
  ----------------------------------------------------------------------

  -- An all in one Neovim plugin that provides superior project management.
  use {
    "ahmedkhalf/project.nvim",
    commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
  }

  ----------------------------------------------------------------------
  --                              Color                               --
  ----------------------------------------------------------------------

  -- A high-performance color highlighter for Neovim which has no external
  -- dependencies.
  use {
    "NvChad/nvim-colorizer.lua",
    commit = "760e27df4dd966607e8fb7fd8b6b93e3c7d2e193",
  }

  ----------------------------------------------------------------------
  --                           Colorscheme                            --
  ----------------------------------------------------------------------

  -- NvChad's base46 theme plugin
  use {
    "NvChad/base46",
    commit = "be301b2cd309394dfa62e8c569250e4fb58dd763",
  }

  ----------------------------------------------------------------------
  --                            Statusline                            --
  ----------------------------------------------------------------------

  -- A blazing fast and easy to configure Neovim statusline.
  use {
    "nvim-lualine/lualine.nvim",
    commit = "3325d5d43a7a2bc9baeef2b7e58e1d915278beaf",
  }

  ----------------------------------------------------------------------
  --                             Tabline                              --
  ----------------------------------------------------------------------

  -- A snazzy buffer line for Neovim built using Lua.
  use {
    "akinsho/bufferline.nvim",
    commit = "7c07dee2714778a84a9adda6e676c8e2151085f2",
  }

  ----------------------------------------------------------------------
  --                            Cursorline                            --
  ----------------------------------------------------------------------

  -- Highlight the word under the cursor.
  use {
    "RRethy/vim-illuminate",
    commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3",
  }

  ----------------------------------------------------------------------
  --                             Startup                              --
  ----------------------------------------------------------------------

  -- A fast and highly customizable greeter for Neovim.
  use {
    "goolord/alpha-nvim",
    commit = "a858e4e7b0805835e61fab2b54704450427d47c3",
  }

  ----------------------------------------------------------------------
  --                               Icon                               --
  ----------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  use {
    "nvim-tree/nvim-web-devicons",
    commit = "3b1b794bc17b7ac3df3ae471f1c18f18d1a0f958",
  }

  ----------------------------------------------------------------------
  --                             Utility                              --
  ----------------------------------------------------------------------

  -- Automatically create missing directories when saving a file.
  use {
    "jghauser/mkdir.nvim",
    commit = "c55d1dee4f099528a1853b28bb28caa802eba217",
  }

  -- A fancy, configurable, notification manager for Neovim.
  use {
    "rcarriga/nvim-notify",
    commit = "43c54aec682854b39a7e0e89b4c3ba00426d74a8",
  }

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  use {
    "stevearc/dressing.nvim",
    commit = "8c1500069cafc9cfd93bf5521b17fde060008022",
  }

  -- Display a line as colorcolumn.
  use {
    "lukas-reineke/virt-column.nvim",
    commit = "36fa3be9cba9195081e934b4f9729021726c5889",
  }

  -- Delete Neovim buffers without losing window layout.
  use {
    "famiu/bufdelete.nvim",
    commit = "027d356a5caec51881089886893c197f0c27fb48",
  }

  ----------------------------------------------------------------------
  --                       Terminal Integration                       --
  ----------------------------------------------------------------------

  -- A Neovim Lua plugin to help easily manage multiple terminal windows.
  use {
    "akinsho/toggleterm.nvim",
    commit = "3ba683827c623affb4d9aa518e97b34db2623093",
  }

  ----------------------------------------------------------------------
  --                      Neovim Lua Development                      --
  ----------------------------------------------------------------------

  -- Useful lua functions used by lots of plugins.
  use {
    "nvim-lua/plenary.nvim",
    commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7",
  }

  ----------------------------------------------------------------------
  --                      Dependency management                       --
  ----------------------------------------------------------------------

  -- Rust dependency management for Cargo.toml.
  use {
    "Saecki/crates.nvim",
    commit = "1dffccc0a95f656ebe00cacb4de282473430c5a1",
  }

  ----------------------------------------------------------------------
  --                               Git                                --
  ----------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  use {
    "lewis6991/gitsigns.nvim",
    commit = "9ff7dfb051e5104088ff80556203634fc8f8546d",
  }

  ----------------------------------------------------------------------
  --                              Motion                              --
  ----------------------------------------------------------------------

  -- Add fancy sub-cursor to signcolumn to show your scroll or jump direction.
  use {
    "gen740/SmoothCursor.nvim",
    commit = "abc2065f748f346c02bed19b3a075d561b20aa6f",
  }

  ----------------------------------------------------------------------
  --                            Keybinding                            --
  ----------------------------------------------------------------------

  -- Neovim plugin that shows a popup with possible keybindings of the command
  -- you started typing.
  use {
    "folke/which-key.nvim",
    commit = "61553aeb3d5ca8c11eea8be6eadf478062982ac9",
  }

  -- Create shortcuts to escape insert mode without getting delay.
  use {
    "max397574/better-escape.nvim",
    commit = "d5ee0cef56a7e41a86048c14f25e964876ac20c1",
  }

  ----------------------------------------------------------------------
  --                            Scrolling                             --
  ----------------------------------------------------------------------

  -- Smooth scrolling for Neovim.
  use {
    "karb94/neoscroll.nvim",
    commit = "54c5c419f6ee2b35557b3a6a7d631724234ba97a",
  }

  ----------------------------------------------------------------------
  --                            Scrollbar                             --
  ----------------------------------------------------------------------

  -- Extensible scrollbar that shows diagnostics and search results.
  use {
    "petertriho/nvim-scrollbar",
    commit = "3b8782747e2e364c4c51d0a08bd9496880f29c63",
  }

  ----------------------------------------------------------------------
  --                         Editing Support                          --
  ----------------------------------------------------------------------

  -- A minimalist autopairs for Neovim written by Lua.
  use {
    "windwp/nvim-autopairs",
    commit = "6b6e35fc9aca1030a74cc022220bc22ea6c5daf4",
  }

  -- Shows floating hover with the current function/block context.
  use {
    "nvim-treesitter/nvim-treesitter-context",
    commit = "0dd5eae6dbf226107da2c2041ffbb695d9e267c1",
  }

  -- Peek lines in a non-obtrusive way.
  use {
    "nacro90/numb.nvim",
    commit = "d95b7ea62e320b02ca1aa9df3635471a88d6f3b1",
  }

  -- Reopen files at your last edit position.
  use {
    "ethanholz/nvim-lastplace",
    commit = "ecced899435c6bcdd81becb5efc6d5751d0dc4c8",
  }

  ----------------------------------------------------------------------
  --                             Comment                              --
  ----------------------------------------------------------------------

  -- Smart and Powerful comment plugin for Neovim.
  use {
    "numToStr/Comment.nvim",
    commit = "ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6",
  }

  -- Highlight, list and search todo comments in your projects.
  use {
    "folke/todo-comments.nvim",
    commit = "d73693012b5dd0dae7a49504b93dcc79d189c733",
  }

  -- Adds a comment frame based on the source file.
  use {
    "s1n7ax/nvim-comment-frame",
    commit = "7a7d34ee7a236a89ffe5674bf794358ee12a7df8",
  }

  ----------------------------------------------------------------------
  --                              Indent                              --
  ----------------------------------------------------------------------

  -- IndentLine replacement in Lua with more features and treesitter support.
  use {
    "lukas-reineke/indent-blankline.nvim",
    commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6",
  }

  ----------------------------------------------------------------------
  --                            Impatient                             --
  ----------------------------------------------------------------------

  -- Speed up loading Lua modules
  use {
    "lewis6991/impatient.nvim",
    commit = "d3dd30ff0b811756e735eb9020609fa315bfbbcc",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
