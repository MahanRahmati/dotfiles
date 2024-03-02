require("lazy").setup({

  ----------------------------------------------------------------------
  --                               Mini                               --
  ----------------------------------------------------------------------

  -- Library of 35+ independent Lua modules improving overall Neovim
  -- experience with minimal effort
  {
    "echasnovski/mini.nvim",
    commit = "7827793105685d8158812bbdab027d11aac19c24",
  },

  ----------------------------------------------------------------------
  --                               LSP                                --
  ----------------------------------------------------------------------

  -- Quickstart configurations for the Neovim LSP client.
  {
    "neovim/nvim-lspconfig",
    commit = "9553725789be682ecd945a527ec552e489ea8534",
  },

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  {
    "williamboman/mason.nvim",
    commit = "3b5068f0fc565f337d67a2d315d935f574848ee7",
  },

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "21d33d69a81f6351e5a5f49078b2e4f0075c8e73",
  },

  -- Another lsp progress status for Neovim.
  {
    "linrongbin16/lsp-progress.nvim",
    commit = "b673377c50ebaf37053f23cc3caeeb6d469ba1c1",
    config = function()
      require "plugins.lsp-progress"
    end,
  },

  ----------------------------------------------------------------------
  --                            Completion                            --
  ----------------------------------------------------------------------

  -- Completion plugin for Neovim
  {
    "hrsh7th/nvim-cmp",
    commit = "04e0ca376d6abdbfc8b52180f8ea236cbfddf782",
  },

  -- A nvim-cmp source for Neovim builtin LSP client.
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = "5af77f54de1b16c34b23cba810150689a3a90312",
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
    commit = "a3b7c0cadb7bd389f513eecda376d4c6bec90003",
  },

  -- A nvim-cmp source for look.
  {
    "octaltree/cmp-look",
    commit = "971e65a6be0e75c3438fe7b176d4fc020cb89d7b",
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
    commit = "d8286f431981f32e5e6e494c8a6f9ffbd2ee1428",
  },

  ----------------------------------------------------------------------
  --                  Programming Languages Support                   --
  ----------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  {
    "akinsho/flutter-tools.nvim",
    commit = "01d72d9c1bdf2d454a60c5ba450f83e5ea783f6a",
  },

  -- Tools for better development in rust using Neovim's builtin LSP.
  {
    "simrat39/rust-tools.nvim",
    commit = "676187908a1ce35ffcd727c654ed68d851299d3e",
  },

  ----------------------------------------------------------------------
  --                              Syntax                              --
  ----------------------------------------------------------------------

  -- Neovim Treesitter configurations and abstraction layer.
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "a47540fd737eb5c03ee21ee69eb8134ce5568fb6",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      -- Rainbow delimiters for Neovim through Tree-sitter
      {
        "HiPhish/nvim-ts-rainbow2",
        commit = "b3120cd5ae9ca524af9cb602f41e12e301fa985f",
      },

      -- Shows floating hover with the current function/block context.
      {
        "nvim-treesitter/nvim-treesitter-context",
        commit = "b8d1ffe58a88e0356da56b167373e89c4579ce15",
        config = function()
          require "plugins.treesitter-context"
        end,
      },
    },
    config = function()
      require "plugins.treesitter"
    end,
  },

  ----------------------------------------------------------------------
  --                             Snippet                              --
  ----------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  {
    "L3MON4D3/LuaSnip",
    commit = "f3b3d3446bcbfa62d638b1903ff00a78b2b730a1",
  },

  -- Set of preconfigured snippets for different languages.
  {
    "rafamadriz/friendly-snippets",
    commit = "dcd4a586439a1c81357d5b9d26319ae218cc9479",
  },

  ----------------------------------------------------------------------
  --                           Fuzzy Finder                           --
  ----------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  {
    "nvim-telescope/telescope.nvim",
    commit = "aa83606299c5beeaf80e656efbf07bde258db7be",
  },

  ----------------------------------------------------------------------
  --                          File Explorer                           --
  ----------------------------------------------------------------------

  -- Neo-tree is a Neovim plugin to browse the file system and other tree like
  -- structures in whatever style suits you, including sidebars, floating
  -- windows, netrw split style, or all of them at once.
  {
    "nvim-neo-tree/neo-tree.nvim",
    commit = "459c60317cc1d251f6eb3b6f010d015d5d24b806",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "plugins.neo-tree"
    end,
  },

  ----------------------------------------------------------------------
  --                             Project                              --
  ----------------------------------------------------------------------

  -- An all in one Neovim plugin that provides superior project management.
  {
    "ahmedkhalf/project.nvim",
    commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
    event = "VimEnter",
    config = function()
      require "plugins.project"
    end,
  },

  ----------------------------------------------------------------------
  --                              Color                               --
  ----------------------------------------------------------------------

  -- A high-performance color highlighter for Neovim which has no external
  -- dependencies.
  {
    "NvChad/nvim-colorizer.lua",
    commit = "85855b38011114929f4058efc97af1059ab3e41d",
    event = "VimEnter",
    config = function()
      require "plugins.colorizer"
    end,
  },

  ----------------------------------------------------------------------
  --                           Colorscheme                            --
  ----------------------------------------------------------------------

  -- Warm mid-tone dark theme to show off your vibrant self! with support for
  -- native LSP, Tree-sitter, and more 🍨!
  {
    "catppuccin/nvim",
    commit = "c0de3b46811fe1ce3912e2245a9dfbea6b41c300",
    config = function()
      require "plugins.catppuccin"
    end,
  },

  ----------------------------------------------------------------------
  --                            Statusline                            --
  ----------------------------------------------------------------------

  -- A blazing fast and easy to configure Neovim statusline.
  {
    "nvim-lualine/lualine.nvim",
    commit = "7d131a8d3ba5016229e8a1d08bf8782acea98852",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    config = function()
      require "plugins.lualine"
    end,
  },

  ----------------------------------------------------------------------
  --                            Cursorline                            --
  ----------------------------------------------------------------------

  -- Highlight the word under the cursor.
  {
    "RRethy/vim-illuminate",
    commit = "305bf07b919ac526deb5193280379e2f8b599926",
    event = "VimEnter",
    config = function()
      require "plugins.illuminate"
    end,
  },

  ----------------------------------------------------------------------
  --                             Startup                              --
  ----------------------------------------------------------------------

  -- A fast and highly customizable greeter for Neovim.
  {
    "goolord/alpha-nvim",
    commit = "41283fb402713fc8b327e60907f74e46166f4cfd",
    event = "VimEnter",
    config = function()
      require "plugins.alpha"
    end,
  },

  ----------------------------------------------------------------------
  --                               Icon                               --
  ----------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  {
    "nvim-tree/nvim-web-devicons",
    commit = "4adea17610d140a99c313e3f79a9dc01825d59ae",
  },

  ----------------------------------------------------------------------
  --                             Utility                              --
  ----------------------------------------------------------------------

  -- A fancy, configurable, notification manager for Neovim.
  {
    "rcarriga/nvim-notify",
    commit = "5371f4bfc1f6d3adf4fe9d62cd3a9d44356bfd15",
  },

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  {
    "stevearc/dressing.nvim",
    commit = "6f212262061a2120e42da0d1e87326e8a41c0478",
    event = "VeryLazy",
    config = function()
      require "plugins.dressing"
    end,
  },

  -- Display a line as colorcolumn.
  {
    "lukas-reineke/virt-column.nvim",
    commit = "b62b4ef0774d19452d4ed18e473e824c7a756f2f",
    event = "VimEnter",
    config = function()
      require "plugins.virt-column"
    end,
  },

  -- Delete Neovim buffers without losing window layout.
  {
    "famiu/bufdelete.nvim",
    commit = "f6bcea78afb3060b198125256f897040538bcb81",
  },

  ----------------------------------------------------------------------
  --                       Terminal Integration                       --
  ----------------------------------------------------------------------

  -- A Neovim Lua plugin to help easily manage multiple terminal windows.
  {
    "akinsho/toggleterm.nvim",
    commit = "193786e0371e3286d3bc9aa0079da1cd41beaa62",
    event = "VeryLazy",
    config = function()
      require "plugins.toggleterm"
    end,
  },

  ----------------------------------------------------------------------
  --                      Neovim Lua Development                      --
  ----------------------------------------------------------------------

  -- Useful lua functions used by lots of plugins.
  {
    "nvim-lua/plenary.nvim",
    commit = "4f71c0c4a196ceb656c824a70792f3df3ce6bb6d",
  },

  -- UI Component Library.
  {
    "MunifTanjim/nui.nvim",
    commit = "b81333d12f824dbed5eb231c8a4409a290fdd848",
  },

  ----------------------------------------------------------------------
  --                               Git                                --
  ----------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  {
    "lewis6991/gitsigns.nvim",
    commit = "2c2463dbd82eddd7dbab881c3a62cfbfbe3c67ae",
    event = "VimEnter",
    config = function()
      require "plugins.gitsigns"
    end,
  },

  ----------------------------------------------------------------------
  --                            Keybinding                            --
  ----------------------------------------------------------------------

  -- Neovim plugin that shows a popup with possible keybindings of the command
  -- you started typing.
  {
    "folke/which-key.nvim",
    commit = "4433e5ec9a507e5097571ed55c02ea9658fb268a",
    event = "VeryLazy",
    config = function()
      require "plugins.whichkey"
    end,
  },

  ----------------------------------------------------------------------
  --                         Editing Support                          --
  ----------------------------------------------------------------------

  -- Peek lines in a non-obtrusive way.
  {
    "nacro90/numb.nvim",
    commit = "3f7d4a74bd456e747a1278ea1672b26116e0824d",
    event = "VeryLazy",
    config = function()
      require "plugins.numb"
    end,
  },

  ----------------------------------------------------------------------
  --                             Comment                              --
  ----------------------------------------------------------------------

  -- Adds a comment frame based on the source file.
  {
    "s1n7ax/nvim-comment-frame",
    commit = "7a7d34ee7a236a89ffe5674bf794358ee12a7df8",
    event = "VeryLazy",
    config = function()
      require "plugins.comment-frame"
    end,
  },

  ----------------------------------------------------------------------
  --                            Formatting                            --
  ----------------------------------------------------------------------

  -- A lightweight formatting engine that plays nice with LSP.
  {
    "stevearc/conform.nvim",
    commit = "f882877f03ebd46067c6a5493d259c4b9a9280f0",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require "plugins.conform"
    end,
  },

  ----------------------------------------------------------------------
  --                              Indent                              --
  ----------------------------------------------------------------------

  --  IndentLine replacement in Lua with more features and treesitter support.
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "821a7acd88587d966f7e464b0b3031dfe7f5680c",
    event = "VimEnter",
    config = function()
      require "plugins.indent-blankline"
    end,
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
