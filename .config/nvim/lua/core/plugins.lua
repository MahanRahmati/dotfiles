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
  -----------------------------------------------------------------------------
  --------------------------- Plugin Manager ----------------------------------
  -----------------------------------------------------------------------------

  -- A use-package inspired plugin manager for Neovim.
  use {
    "wbthomason/packer.nvim",
    commit = "50aeb9060cf64c3c27e6d7b11d7af9e209ed6c3b",
  }

  -----------------------------------------------------------------------------
  --------------------------------- LSP ---------------------------------------
  -----------------------------------------------------------------------------

  -- Quickstart configurations for the Neovim LSP client.
  use {
    "neovim/nvim-lspconfig",
    commit = "79d4cb9c45ecf185d2200dd2af1e12829c8a9232",
  }

  -- A pretty diagnostics list to help you solve all the trouble your code is
  -- causing.
  use {
    "folke/trouble.nvim",
    commit = "929315ea5f146f1ce0e784c76c943ece6f36d786",
  }

  -- The plugin shows a lightbulb in the sign column whenever a codeAction is
  -- available at the current cursor position.
  use {
    "kosayoda/nvim-lightbulb",
    commit = "56b9ce31ec9d09d560fe8787c0920f76bc208297",
  }

  -- Use Neovim as a language server to inject LSP diagnostics, code actions,
  -- and more via Lua.
  use {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "1569ad4817492e0daefa4e1bcf55f8280cdc82db",
  }

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  use {
    "williamboman/mason.nvim",
    commit = "2fa0fd4bb13cb9060c8aae9296d53e6397245e9f",
  }

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  use {
    "williamboman/mason-lspconfig.nvim",
    commit = "980f83609cd58e2069dda89a05367f81a48bdf2f",
  }

  -----------------------------------------------------------------------------
  ----------------------------- Completion ------------------------------------
  -----------------------------------------------------------------------------

  -- Completion plugin for Neovim
  use { "hrsh7th/nvim-cmp", commit = "b16e5bcf1d8fd466c289eab2472d064bcd7bab5d" }

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
  use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }

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

  -----------------------------------------------------------------------------
  ------------------------------- Syntax --------------------------------------
  -----------------------------------------------------------------------------

  -- Neovim Treesitter configurations and abstraction layer.
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "2a63ea5665a6de96acd31a045d9d4d73272ff5a9",
  }

  -----------------------------------------------------------------------------
  ------------------------ Terminal integration  ------------------------------
  -----------------------------------------------------------------------------

  -- A Neovim Lua plugin to help easily manage multiple terminal windows.
  use {
    "akinsho/toggleterm.nvim",
    commit = "5e393e558f7c41d132542c8e9626aa824a1caa59",
  }

  -----------------------------------------------------------------------------
  ------------------------------- Snippet -------------------------------------
  -----------------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  use { "L3MON4D3/LuaSnip", commit = "4073f821e1c02c7deb50235b4b68ecc5cf0b95e9" }

  -- Set of preconfigured snippets for different languages.
  use {
    "rafamadriz/friendly-snippets",
    commit = "22a99756492a340c161ab122b0ded90ab115a1b3",
  }

  -----------------------------------------------------------------------------
  ---------------------------- Fuzzy Finder -----------------------------------
  -----------------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  use {
    "nvim-telescope/telescope.nvim",
    commit = "2584ff391b528d01bf5e8c04206d5902a79ebdde",
  }

  -----------------------------------------------------------------------------
  ---------------------------- Colorscheme -----------------------------------
  -----------------------------------------------------------------------------

  -- A One Dark Theme for Neovim
  use {
    "navarasu/onedark.nvim",
    commit = "551f299d9ab2fd557247aa1995b2831a1237e4ae",
  }

  -----------------------------------------------------------------------------
  ------------------------------- Utility -------------------------------------
  -----------------------------------------------------------------------------

  -- Delete Neovim buffers without losing window layout.
  use {
    "famiu/bufdelete.nvim",
    commit = "46255e4a76c4fb450a94885527f5e58a7d96983c",
  }

  -- Automatically create missing directories when saving a file.
  use {
    "jghauser/mkdir.nvim",
    commit = "c55d1dee4f099528a1853b28bb28caa802eba217",
  }

  -- Create shortcuts to escape insert mode without getting delay.
  use {
    "max397574/better-escape.nvim",
    commit = "d5ee0cef56a7e41a86048c14f25e964876ac20c1",
  }

  -- A fancy, configurable, notification manager for Neovim.
  use {
    "rcarriga/nvim-notify",
    commit = "7076ce8e8f042e193668b7ac67f776858df5206b",
  }

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  use {
    "stevearc/dressing.nvim",
    commit = "9cdb3e0f0973447b940b35d3175dc780301de427",
  }

  -- Display a line as colorcolumn.
  use {
    "lukas-reineke/virt-column.nvim",
    commit = "29db24c5e94243df1f34f47bbcb4e7803204cae4",
  }

  -----------------------------------------------------------------------------
  ------------------------------- Icon -------------------------------------
  -----------------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  use {
    "kyazdani42/nvim-web-devicons",
    commit = "2d02a56189e2bde11edd4712fea16f08a6656944",
  }

  -----------------------------------------------------------------------------
  ----------------------- Neovim Lua Development ------------------------------
  -----------------------------------------------------------------------------

  -- Useful lua functions used by lots of plugins.
  use {
    "nvim-lua/plenary.nvim",
    commit = "4b66054e75356ac0b909bbfee9c682e703f535c2",
  }

  -----------------------------------------------------------------------------
  ------------------------------ Tabline --------------------------------------
  -----------------------------------------------------------------------------

  -- A snazzy buffer line for Neovim built using Lua.
  use {
    "akinsho/bufferline.nvim",
    commit = "0b4b863244ef1369a8b9e4246dc95f8cdb5db026",
  }

  -----------------------------------------------------------------------------
  ----------------------------- Statusline ------------------------------------
  -----------------------------------------------------------------------------

  -- A blazing fast and easy to configure Neovim statusline.
  use {
    "nvim-lualine/lualine.nvim",
    commit = "3cf45404d4ab5e3b5da283877f57b676cb78d41d",
  }

  -----------------------------------------------------------------------------
  ----------------------------- Cursorline ------------------------------------
  -----------------------------------------------------------------------------

  -- Highlight the word under the cursor.
  use {
    "RRethy/vim-illuminate",
    commit = "1c8132dc81078fc1ec7a4a1492352b8f541ee84b",
  }

  -----------------------------------------------------------------------------
  ----------------------------- Startup ------------------------------------
  -----------------------------------------------------------------------------

  -- A fast and highly customizable greeter for Neovim.
  use {
    "goolord/alpha-nvim",
    commit = "09e5374465810d71c33e9b097214adcdebeee49a",
  }

  -----------------------------------------------------------------------------
  ------------------------------- Indent --------------------------------------
  -----------------------------------------------------------------------------

  -- IndentLine replacement in Lua with more features and treesitter support.
  use {
    "lukas-reineke/indent-blankline.nvim",
    commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6",
  }

  -----------------------------------------------------------------------------
  --------------------------- File explorer -----------------------------------
  -----------------------------------------------------------------------------

  -- A simple and fast file explorer tree for Neovim.
  use {
    "kyazdani42/nvim-tree.lua",
    commit = "3e49d9b7484e21f0b24ebdf21b8b7af227ea97a6",
  }

  -----------------------------------------------------------------------------
  ------------------------------- Git --------------------------------------
  -----------------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  use {
    "lewis6991/gitsigns.nvim",
    commit = "d7e0bcbe45bd9d5d106a7b2e11dc15917d272c7a",
  }

  -----------------------------------------------------------------------------
  ------------------- Programming languages support ---------------------------
  -----------------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  use {
    "akinsho/flutter-tools.nvim",
    commit = "78551498310e25055ec26d0f8dec2b5297043676",
  }

  -----------------------------------------------------------------------------
  ------------------------------ Comment --------------------------------------
  -----------------------------------------------------------------------------

  -- Smart and Powerful comment plugin for Neovim.
  use {
    "numToStr/Comment.nvim",
    commit = "30d23aa2e1ba204a74d5dfb99777e9acbe9dd2d6",
  }

  -- Highlight, list and search todo comments in your projects.
  use {
    "folke/todo-comments.nvim",
    commit = "a57b18c8b3fe9340d48585371df2c793fff417a7",
  }

  -----------------------------------------------------------------------------
  ------------------------------ Project --------------------------------------
  -----------------------------------------------------------------------------

  -- An all in one Neovim plugin that provides superior project management.
  use {
    "ahmedkhalf/project.nvim",
    commit = "090bb11ee7eb76ebb9d0be1c6060eac4f69a240f",
  }

  -----------------------------------------------------------------------------
  -------------------------- Editing support ----------------------------------
  -----------------------------------------------------------------------------

  -- A minimalist autopairs for Neovim written by Lua.
  use {
    "windwp/nvim-autopairs",
    commit = "0a18e10a0c3fde190437567e40557dcdbbc89ea1",
  }

  -- A Neovim plugin for saving your work before the world collapses or you
  -- type :qa!
  use {
    "Pocco81/auto-save.nvim",
    commit = "2c7a2943340ee2a36c6a61db812418fca1f57866",
  }

  -- Shows floating hover with the current function/block context.
  use {
    "nvim-treesitter/nvim-treesitter-context",
    commit = "82631f666f186dbccb8190bc37a65d7cfab45d16",
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

  -- Speed up loading Lua modules
  use {
    "lewis6991/impatient.nvim",
    commit = "969f2c5c90457612c09cf2a13fee1adaa986d350",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
