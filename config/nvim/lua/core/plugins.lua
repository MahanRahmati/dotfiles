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
    commit = "93c6826b16217eaef568ca5c224ea5d0c12bbb82",
  },

  -- Use Neovim as a language server to inject LSP diagnostics, code actions,
  -- and more via Lua.
  {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7",
  },

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  {
    "williamboman/mason.nvim",
    commit = "a51c2d063c5377ee9e58c5f9cda7c7436787be72",
  },

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "2997f467881ac4faa6f8c5e7065e3a672297c8ad",
  },

  -- Extension to mason.nvim that makes it easier to use null-ls with
  -- mason.nvim
  {
    "jayp0521/mason-null-ls.nvim",
    commit = "ae0c5fa57468ac65617f1bf821ba0c3a1e251f0c",
  },

  -- Another lsp progress status for Neovim.
  {
    "linrongbin16/lsp-progress.nvim",
    commit = "972e15ce48d3518d0329c46774b81e5dbfd8c61e",
  },

  ----------------------------------------------------------------------
  --                            Completion                            --
  ----------------------------------------------------------------------

  -- Completion plugin for Neovim
  {
    "hrsh7th/nvim-cmp",
    commit = "51f1e11a89ec701221877532ee1a23557d291dd5",
  },

  -- A nvim-cmp source for Neovim builtin LSP client.
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = "44b16d11215dce86f253ce0c30949813c0a90765",
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

  ----------------------------------------------------------------------
  --                  Programming Languages Support                   --
  ----------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  {
    "akinsho/flutter-tools.nvim",
    commit = "561d85b16d8ca2938820a9c26b2fe74096d89c81",
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
    commit = "2ee71c1a2fa74c10692be10ae420ff0c3a02eb3c",
  },

  ----------------------------------------------------------------------
  --                             Snippet                              --
  ----------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  {
    "L3MON4D3/LuaSnip",
    commit = "c4d6298347f7707e9757351b2ee03d0c00da5c20",
  },

  -- Set of preconfigured snippets for different languages.
  {
    "rafamadriz/friendly-snippets",
    commit = "377d45475b49e37460a902d6d569d2093d4037d0",
  },

  ----------------------------------------------------------------------
  --                           Fuzzy Finder                           --
  ----------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  {
    "nvim-telescope/telescope.nvim",
    commit = "2d92125620417fbea82ec30303823e3cd69e90e8",
  },

  ----------------------------------------------------------------------
  --                          File Explorer                           --
  ----------------------------------------------------------------------

  -- Neo-tree is a Neovim plugin to browse the file system and other tree like
  -- structures in whatever style suits you, including sidebars, floating
  -- windows, netrw split style, or all of them at once.
  {
    "nvim-neo-tree/neo-tree.nvim",
    commit = "70ab62c8cc5d039766c039597c7c33a76d74fd11",
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
    commit = "b573866ef64122119668f375ebb794bcb3b518e2",
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
    commit = "76f28e858f1caae87bfa45fb4fd09e4b053fc45b",
  },

  ----------------------------------------------------------------------
  --                             Startup                              --
  ----------------------------------------------------------------------

  -- A fast and highly customizable greeter for Neovim.
  {
    "goolord/alpha-nvim",
    commit = "7a6b9487dba044a43fde534bf5036f0fda5b6b23",
  },

  ----------------------------------------------------------------------
  --                               Icon                               --
  ----------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  {
    "nvim-tree/nvim-web-devicons",
    commit = "cfc8824cc1db316a276b36517f093baccb8e799a",
  },

  ----------------------------------------------------------------------
  --                             Utility                              --
  ----------------------------------------------------------------------

  -- A fancy, configurable, notification manager for Neovim.
  {
    "rcarriga/nvim-notify",
    commit = "ea9c8ce7a37f2238f934e087c255758659948e0f",
  },

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  {
    "stevearc/dressing.nvim",
    commit = "ee571505f3566f84fd252e76c4ce6df6eaf2fb94",
  },

  -- Display a line as colorcolumn.
  {
    "lukas-reineke/virt-column.nvim",
    commit = "1917bfb519729dea7b4f5d13aa9c810c9579b0ea",
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
    commit = "12cba0a1967b4f3f31903484dec72a6100dcf515",
  },

  ----------------------------------------------------------------------
  --                      Neovim Lua Development                      --
  ----------------------------------------------------------------------

  -- Useful lua functions used by lots of plugins.
  {
    "nvim-lua/plenary.nvim",
    commit = "267282a9ce242bbb0c5dc31445b6d353bed978bb",
  },

  -- UI Component Library.
  {
    "MunifTanjim/nui.nvim",
    commit = "9e3916e784660f55f47daa6f26053ad044db5d6a",
  },

  ----------------------------------------------------------------------
  --                      Dependency management                       --
  ----------------------------------------------------------------------

  -- Rust dependency management for Cargo.toml.
  {
    "Saecki/crates.nvim",
    commit = "d5caf28aba49e81ac4099426231f3cf3c151013a",
  },

  ----------------------------------------------------------------------
  --                               Git                                --
  ----------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  {
    "lewis6991/gitsigns.nvim",
    commit = "749267aaa863c30d721c9913699c5d94e0c07dd3",
  },

  --  Single tabpage interface for easily cycling through diffs for all
  --  modified files for any git rev.
  {
    "sindrets/diffview.nvim",
    commit = "7e5a85c186027cab1e825d018f07c350177077fc",
  },

  ----------------------------------------------------------------------
  --                            Keybinding                            --
  ----------------------------------------------------------------------

  -- Neovim plugin that shows a popup with possible keybindings of the command
  -- you started typing.
  {
    "folke/which-key.nvim",
    commit = "7ccf476ebe0445a741b64e36c78a682c1c6118b7",
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
    commit = "ae5b41ce880a6d850055e262d6dfebd362bb276e",
  },

  -- Rainbow delimiters for Neovim through Tree-sitter
  {
    "HiPhish/nvim-ts-rainbow2",
    commit = "b3120cd5ae9ca524af9cb602f41e12e301fa985f",
  },

  -- Shows floating hover with the current function/block context.
  {
    "nvim-treesitter/nvim-treesitter-context",
    commit = "14856c9ee6eb0ede0ae9b43782c9be5e7bd946e6",
  },

  -- Peek lines in a non-obtrusive way.
  {
    "nacro90/numb.nvim",
    commit = "2c89245d1185e02fec1494c45bc765a38b6b40b3",
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
  --                              Indent                              --
  ----------------------------------------------------------------------

  -- IndentLine replacement in Lua with more features and treesitter support.
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
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
