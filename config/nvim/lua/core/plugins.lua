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
  --                               Mini                               --
  ----------------------------------------------------------------------

  -- Library of 35+ independent Lua modules improving overall Neovim
  -- experience with minimal effort
  {
    "echasnovski/mini.nvim",
    commit = "e578f353d0b1d9f21a9640458d8e506c0c9acf5e",
  },

  ----------------------------------------------------------------------
  --                               LSP                                --
  ----------------------------------------------------------------------

  -- Quickstart configurations for the Neovim LSP client.
  {
    "neovim/nvim-lspconfig",
    commit = "ce0e625df61be77abe1340fbc9afe9ad39b31dd8",
  },

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  {
    "williamboman/mason.nvim",
    commit = "a09da6ac634926a299dd439da08bdb547a8ca011",
  },

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "56e435e09f8729af2d41973e81a0db440f8fe9c9",
  },

  -- Another lsp progress status for Neovim.
  {
    "linrongbin16/lsp-progress.nvim",
    commit = "cabf7fde50cc0dad367a03a1542d9670d1118bd0",
  },

  ----------------------------------------------------------------------
  --                            Completion                            --
  ----------------------------------------------------------------------

  -- Completion plugin for Neovim
  {
    "hrsh7th/nvim-cmp",
    commit = "538e37ba87284942c1d76ed38dd497e54e65b891",
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
    commit = "817f1f36e4c43f82e8e1cdfa4cf978dffa037255",
  },

  ----------------------------------------------------------------------
  --                  Programming Languages Support                   --
  ----------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  {
    "akinsho/flutter-tools.nvim",
    commit = "b65ad58462116785423d81aeb2ee6c8c16f78679",
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
    commit = "0da349ed303bea955942f409d29059cdb89dbe2c",
  },

  ----------------------------------------------------------------------
  --                             Snippet                              --
  ----------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  {
    "L3MON4D3/LuaSnip",
    commit = "8ae1dedd988eb56441b7858bd1e8554dfadaa46d",
  },

  -- Set of preconfigured snippets for different languages.
  {
    "rafamadriz/friendly-snippets",
    commit = "53d3df271d031c405255e99410628c26a8f0d2b0",
  },

  ----------------------------------------------------------------------
  --                           Fuzzy Finder                           --
  ----------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  {
    "nvim-telescope/telescope.nvim",
    commit = "8b56e9bb2d0b8750c2f8cd4efe9738e3c066889b",
  },

  ----------------------------------------------------------------------
  --                          File Explorer                           --
  ----------------------------------------------------------------------

  -- Neo-tree is a Neovim plugin to browse the file system and other tree like
  -- structures in whatever style suits you, including sidebars, floating
  -- windows, netrw split style, or all of them at once.
  {
    "nvim-neo-tree/neo-tree.nvim",
    commit = "396ff81e6bb384b0ef12ae427346cbf97d08f808",
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
    commit = "85855b38011114929f4058efc97af1059ab3e41d",
  },

  ----------------------------------------------------------------------
  --                           Colorscheme                            --
  ----------------------------------------------------------------------

  -- Warm mid-tone dark theme to show off your vibrant self! with support for
  -- native LSP, Tree-sitter, and more 🍨!
  {
    "catppuccin/nvim",
    commit = "5e36ca599f4aa41bdd87fbf2c5aae4397ac55074",
  },

  ----------------------------------------------------------------------
  --                            Statusline                            --
  ----------------------------------------------------------------------

  -- A blazing fast and easy to configure Neovim statusline.
  {
    "nvim-lualine/lualine.nvim",
    commit = "566b7036f717f3d676362742630518a47f132fff",
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
    commit = "29074eeb869a6cbac9ce1fbbd04f5f5940311b32",
  },

  ----------------------------------------------------------------------
  --                               Icon                               --
  ----------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  {
    "nvim-tree/nvim-web-devicons",
    commit = "3e24abe1ae66532135cec911562f553fe247cb56",
  },

  ----------------------------------------------------------------------
  --                             Utility                              --
  ----------------------------------------------------------------------

  -- A fancy, configurable, notification manager for Neovim.
  {
    "rcarriga/nvim-notify",
    commit = "1576123bff3bed67bc673a3076e591abfe5d8ca9",
  },

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  {
    "stevearc/dressing.nvim",
    commit = "94b0d24483d56f3777ee0c8dc51675f21709318c",
  },

  -- Display a line as colorcolumn.
  {
    "lukas-reineke/virt-column.nvim",
    commit = "b62b4ef0774d19452d4ed18e473e824c7a756f2f",
  },

  -- Delete Neovim buffers without losing window layout.
  {
    "famiu/bufdelete.nvim",
    commit = "0b9c0f182b09c51170bb9f252f15de7695e4d507",
  },

  ----------------------------------------------------------------------
  --                       Terminal Integration                       --
  ----------------------------------------------------------------------

  -- A Neovim Lua plugin to help easily manage multiple terminal windows.
  {
    "akinsho/toggleterm.nvim",
    commit = "e3805fed94d487b81e9c21548535cc820f62f840",
  },

  ----------------------------------------------------------------------
  --                      Neovim Lua Development                      --
  ----------------------------------------------------------------------

  -- Useful lua functions used by lots of plugins.
  {
    "nvim-lua/plenary.nvim",
    commit = "55d9fe89e33efd26f532ef20223e5f9430c8b0c0",
  },

  -- UI Component Library.
  {
    "MunifTanjim/nui.nvim",
    commit = "80445d015d2b5f9af0d9e8bce63d303bc86eda8a",
  },

  ----------------------------------------------------------------------
  --                               Git                                --
  ----------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  {
    "lewis6991/gitsigns.nvim",
    commit = "d195f0c35ced5174d3ecce1c4c8ebb3b5bc23fa9",
  },

  ----------------------------------------------------------------------
  --                            Keybinding                            --
  ----------------------------------------------------------------------

  -- Neovim plugin that shows a popup with possible keybindings of the command
  -- you started typing.
  {
    "folke/which-key.nvim",
    commit = "4433e5ec9a507e5097571ed55c02ea9658fb268a",
  },

  ----------------------------------------------------------------------
  --                         Editing Support                          --
  ----------------------------------------------------------------------

  -- Rainbow delimiters for Neovim through Tree-sitter
  {
    "HiPhish/nvim-ts-rainbow2",
    commit = "b3120cd5ae9ca524af9cb602f41e12e301fa985f",
  },

  -- Shows floating hover with the current function/block context.
  {
    "nvim-treesitter/nvim-treesitter-context",
    commit = "652ec514d6ba8bc4a3c2de76c855fe668e2c7196",
  },

  -- Peek lines in a non-obtrusive way.
  {
    "nacro90/numb.nvim",
    commit = "3f7d4a74bd456e747a1278ea1672b26116e0824d",
  },

  ----------------------------------------------------------------------
  --                             Comment                              --
  ----------------------------------------------------------------------

  -- Highlight, list and search todo comments in your projects.
  {
    "folke/todo-comments.nvim",
    commit = "4a6737a8d70fe1ac55c64dfa47fcb189ca431872",
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
    commit = "c4b2efb8aee4af0ef179a9b49ba401de3c4ef5d2",
  },

  ----------------------------------------------------------------------
  --                              Indent                              --
  ----------------------------------------------------------------------

  --  IndentLine replacement in Lua with more features and treesitter support.
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "3c8a185da4b8ab7aef487219f5e001b11d4b6aaf",
    event = "VimEnter",
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
