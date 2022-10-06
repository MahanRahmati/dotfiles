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
    commit = "fc2f44dc6024bddb75b82e471c642ad1f4483094",
  }

  -- Use Neovim as a language server to inject LSP diagnostics, code actions,
  -- and more via Lua.
  use {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "4e1118c3f19885623d060aa9b10e41544232f183",
  }

  -- Standalone UI for LSP progress.
  use {
    "j-hui/fidget.nvim",
    commit = "1097a86db8ba38e390850dc4035a03ed234a4673",
  }

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  use {
    "williamboman/mason.nvim",
    commit = "45606b0e9b01a1565bfc8b57a52ec04f58f5f295",
  }

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  use {
    "williamboman/mason-lspconfig.nvim",
    commit = "b364c98644b53e351d27313dfdab809df7fde1d3",
  }

  -- Extension to mason.nvim that makes it easier to use null-ls with
  -- mason.nvim
  use {
    "jayp0521/mason-null-ls.nvim",
    commit = "3be1172bfba22b2b42a3deb2fa588e1ed80142dc",
  }

  -- A pretty diagnostics list to help you solve all the trouble your code is
  -- causing.
  use {
    "folke/trouble.nvim",
    commit = "929315ea5f146f1ce0e784c76c943ece6f36d786",
  }

  ----------------------------------------------------------------------
  --                            Completion                            --
  ----------------------------------------------------------------------

  -- Completion plugin for Neovim
  use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" }

  -- A nvim-cmp source for Neovim builtin LSP client.
  use {
    "hrsh7th/cmp-nvim-lsp",
    commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
  }

  -- A nvim-cmp source for luasnip completion.
  use {
    "saadparwaiz1/cmp_luasnip",
    commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
  }

  -- A nvim-cmp source for filesystem paths.
  use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }

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
    commit = "3dd40097196bdffe5f868d5dddcc0aa146ae41eb",
  }

  ----------------------------------------------------------------------
  --                  Programming Languages Support                   --
  ----------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  use {
    "akinsho/flutter-tools.nvim",
    commit = "15b770dcdca7ad2dab11cdf0dfdca34f04739471",
  }

  ----------------------------------------------------------------------
  --                              Syntax                              --
  ----------------------------------------------------------------------

  -- Neovim Treesitter configurations and abstraction layer.
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "a1bf2c75c01d612c4c3128aad6e291fe41eb03a9",
  }

  ----------------------------------------------------------------------
  --                             Snippet                              --
  ----------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" }

  -- Set of preconfigured snippets for different languages.
  use {
    "rafamadriz/friendly-snippets",
    commit = "9f4ffd17ade26815cad52ba90f478a4e6e2d80df",
  }

  ----------------------------------------------------------------------
  --                           Fuzzy Finder                           --
  ----------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  use {
    "nvim-telescope/telescope.nvim",
    commit = "76ea9a898d3307244dce3573392dcf2cc38f340f",
  }

  ----------------------------------------------------------------------
  --                          File Explorer                           --
  ----------------------------------------------------------------------

  -- A simple and fast file explorer tree for Neovim.
  use {
    "kyazdani42/nvim-tree.lua",
    commit = "7282f7de8aedf861fe0162a559fc2b214383c51c",
  }

  ----------------------------------------------------------------------
  --                             Project                              --
  ----------------------------------------------------------------------

  -- An all in one Neovim plugin that provides superior project management.
  use {
    "ahmedkhalf/project.nvim",
    commit = "628de7e433dd503e782831fe150bb750e56e55d6",
  }

  ----------------------------------------------------------------------
  --                              Color                               --
  ----------------------------------------------------------------------

  -- A high-performance color highlighter for Neovim which has no external
  -- dependencies.
  use {
    "NvChad/nvim-colorizer.lua",
    commit = "9dd7ecde55b06b5114e1fa67c522433e7e59db8b",
  }

  ----------------------------------------------------------------------
  --                           Colorscheme                            --
  ----------------------------------------------------------------------

  -- NvChad's base46 theme plugin
  use {
    "NvChad/base46",
  }

  ----------------------------------------------------------------------
  --                            Statusline                            --
  ----------------------------------------------------------------------

  -- A blazing fast and easy to configure Neovim statusline.
  use {
    "nvim-lualine/lualine.nvim",
    commit = "f564015a23b7874ee83ae1b1c9ace723d915e16d",
  }

  ----------------------------------------------------------------------
  --                             Tabline                              --
  ----------------------------------------------------------------------

  -- A snazzy buffer line for Neovim built using Lua.
  use {
    "akinsho/bufferline.nvim",
    commit = "0606ceeea77e85428ba06e21c9121e635992ccc7",
  }

  ----------------------------------------------------------------------
  --                            Cursorline                            --
  ----------------------------------------------------------------------

  -- Highlight the word under the cursor.
  use {
    "RRethy/vim-illuminate",
    commit = "0603e75fc4ecde1ee5a1b2fc8106ed6704f34d14",
  }

  ----------------------------------------------------------------------
  --                             Startup                              --
  ----------------------------------------------------------------------

  -- A fast and highly customizable greeter for Neovim.
  use {
    "goolord/alpha-nvim",
    commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31",
  }

  ----------------------------------------------------------------------
  --                               Icon                               --
  ----------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  use {
    "kyazdani42/nvim-web-devicons",
    commit = "a8cf88cbdb5c58e2b658e179c4b2aa997479b3da",
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
    commit = "414465468c93f693be4e2f69f47586cf37f3f751",
  }

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  use {
    "stevearc/dressing.nvim",
    commit = "12b808a6867e8c38015488ad6cee4e3d58174182",
  }

  -- Display a line as colorcolumn.
  use {
    "lukas-reineke/virt-column.nvim",
    commit = "36fa3be9cba9195081e934b4f9729021726c5889",
  }

  -- Delete Neovim buffers without losing window layout.
  use {
    "famiu/bufdelete.nvim",
    commit = "46255e4a76c4fb450a94885527f5e58a7d96983c",
  }

  ----------------------------------------------------------------------
  --                       Terminal Integration                       --
  ----------------------------------------------------------------------

  -- A Neovim Lua plugin to help easily manage multiple terminal windows.
  use {
    "akinsho/toggleterm.nvim",
    commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda",
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
  --                               Git                                --
  ----------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  use {
    "lewis6991/gitsigns.nvim",
    commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f",
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
    commit = "6885b669523ff4238de99a7c653d47b081b5506d",
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
  --                         Editing Support                          --
  ----------------------------------------------------------------------

  -- A minimalist autopairs for Neovim written by Lua.
  use {
    "windwp/nvim-autopairs",
    commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347",
  }

  -- Shows floating hover with the current function/block context.
  use {
    "nvim-treesitter/nvim-treesitter-context",
    commit = "8d0759eb798fee2e1201b26c3279713ac67c44c2",
  }

  -- Peek lines in a non-obtrusive way.
  use {
    "nacro90/numb.nvim",
    commit = "453c50ab921fa066fb073d2fd0f826cb036eaf7b",
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
    commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67",
  }

  -- Highlight, list and search todo comments in your projects.
  use {
    "folke/todo-comments.nvim",
    commit = "8df75dbb9ddd78a378b9661f25f0b193f38f06dd",
  }

  -- Adds a comment frame based on the source file.
  use {
    "s1n7ax/nvim-comment-frame",
    commit = "1c6379300d7ce306657481c4b7a51d72f387ae89",
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
    commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
