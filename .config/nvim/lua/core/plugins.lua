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
  -- Have packer manage itself
  use {
    "wbthomason/packer.nvim",
    commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422",
  }

  -- Useful lua functions used by lots of plugins
  use {
    "nvim-lua/plenary.nvim",
    commit = "968a4b9afec0c633bc369662e78f8c5db0eba249",
  }

  -- Speed up loading Lua modules
  use {
    "lewis6991/impatient.nvim",
    commit = "969f2c5c90457612c09cf2a13fee1adaa986d350",
  }

  -- Colorscheme
  use {
    "navarasu/onedark.nvim",
    commit = "52b1ebd80831dd1232b396b82a77fba977fb6e2c",
  }

  -- Completion plugins
  use { "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" } -- The completion plugin
  use {
    "hrsh7th/cmp-buffer",
    commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323",
  } -- Buffer completions
  use { "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" } -- Path completions
  use {
    "saadparwaiz1/cmp_luasnip",
    commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
  } -- Snippet completions
  use {
    "hrsh7th/cmp-nvim-lsp",
    commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
  } -- Source for neovim's built-in language server client.
  use {
    "hrsh7th/cmp-nvim-lua",
    commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
  } -- Source for neovim Lua API.

  -- Snippets
  use { "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" } --Snippet engine
  use {
    "rafamadriz/friendly-snippets",
    commit = "d27a83a363e61009278b6598703a763ce9c8e617",
  } -- A bunch of snippets to use

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    commit = "689bdccf4f5ca036e3792e0f77f451553d33af0c",
  } -- Enable LSP
  use {
    "williamboman/nvim-lsp-installer",
    commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6",
  } -- Simple to use language server installer
  use {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "ff40739e5be6581899b43385997e39eecdbf9465",
  } -- Formatters and linters
  use {
    "RRethy/vim-illuminate",
    commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5",
  } -- Automatically highlighting other uses of the current word under the cursor.

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "518e27589c0463af15463c9d675c65e464efc2fe",
  }

  -- Autopairs, integrates with both cmp and treesitter
  use {
    "windwp/nvim-autopairs",
    commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec",
  }

  -- Comments
  use {
    "numToStr/Comment.nvim",
    commit = "2c26a00f32b190390b664e56e32fd5347613b9e2",
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    commit = "c18e016864c92ecf9775abea1baaa161c28082c3",
  }

  -- Icons
  use {
    "kyazdani42/nvim-web-devicons",
    commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e",
  }

  -- File explorer
  use {
    "kyazdani42/nvim-tree.lua",
    commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243",
  }

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    commit = "3362b28f917acc37538b1047f187ff1b5645ecdd",
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8",
  }

  -- Automatically create missing directories when saving a file.
  use {
    "jghauser/mkdir.nvim",
    commit = "01261650382bef195dab8ac39344234b57914f09",
  }

  -- Delete Neovim buffers without losing window layout.
  use {
    "famiu/bufdelete.nvim",
    commit = "46255e4a76c4fb450a94885527f5e58a7d96983c",
  }

  -- Escape from insert mode without delay when typing.
  use {
    "max397574/better-escape.nvim",
    commit = "d5ee0cef56a7e41a86048c14f25e964876ac20c1",
  }

  -- Indent blankline
  use {
    "lukas-reineke/indent-blankline.nvim",
    commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2",
  }

  -- Display a character as the colorcolumn.
  use {
    "lukas-reineke/virt-column.nvim",
    commit = "29db24c5e94243df1f34f47bbcb4e7803204cae4",
  }

  -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
  use {
    "folke/trouble.nvim",
    commit = "da61737d860ddc12f78e638152834487eabf0ee5",
  }

  -- Highlight, list and search todo comments in your projects.
  use {
    "folke/todo-comments.nvim",
    commit = "98b1ebf198836bdc226c0562b9f906584e6c400e",
  }

  -- Flutter
  use "akinsho/flutter-tools.nvim"

  -- Notification manager
  use {
    "rcarriga/nvim-notify",
    commit = "7caeaaef257ecbe95473ec79e5a82757b544f1fd",
  }

  -- Dashboard
  use {
    "goolord/alpha-nvim",
    commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94",
  }

  -- Project management
  use {
    "ahmedkhalf/project.nvim",
    commit = "541115e762764bc44d7d3bf501b6e367842d3d4f",
  }

  -- DAP
  use {
    "mfussenegger/nvim-dap",
    commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d",
  }
  use {
    "rcarriga/nvim-dap-ui",
    commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7",
  }
  use {
    "ravenxrz/DAPInstall.nvim",
    commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de",
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
