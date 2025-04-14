return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
      },
      "MahanRahmati/blink-nerdfont.nvim",
      "mikavilpas/blink-ripgrep.nvim",
      "xzbdmw/colorful-menu.nvim",
    },
    opts = function()
      local icons = require "icons"

      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { "~/.config/nvim/snippets/" },
      }

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      return {
        keymap = {
          preset = "none",
          ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
          ["<C-e>"] = { "hide", "fallback" },
          ["<CR>"] = { "accept", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
          ["<Tab>"] = { "select_next", "fallback" },
          ["<Up>"] = { "select_prev", "fallback" },
          ["<Down>"] = { "select_next", "fallback" },
          ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
          ["<C-n>"] = { "select_next", "fallback_to_mappings" },
          ["<C-b>"] = { "scroll_documentation_up", "fallback" },
          ["<C-f>"] = { "scroll_documentation_down", "fallback" },
          ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
        },
        snippets = { preset = "luasnip" },
        completion = {
          trigger = {
            prefetch_on_insert = true,
            show_in_snippet = true,
            show_on_keyword = true,
            show_on_trigger_character = true,
          },
          list = {
            max_items = 200,
            selection = {
              preselect = false,
              auto_insert = true,
            },
            cycle = {
              from_bottom = true,
              from_top = true,
            },
          },
          accept = {
            dot_repeat = true,
            create_undo_point = true,
            auto_brackets = {
              enabled = true,
            },
          },
          menu = {
            border = "rounded",
            winhighlight = "Normal:BlinkCmpMenu,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
            scrollbar = false,
            draw = {
              treesitter = { "lsp" },
              -- We don't need label_description now because label and
              -- label_description are already
              -- combined together in label by colorful-menu.nvim.
              columns = {
                { "label", gap = 1 },
                { "kind_icon", "kind" },
              },
              components = {
                label = {
                  text = function(ctx)
                    return require("colorful-menu").blink_components_text(ctx)
                  end,
                  highlight = function(ctx)
                    return require("colorful-menu").blink_components_highlight(
                      ctx
                    )
                  end,
                },
              },
            },
          },
          documentation = {
            auto_show = true,
            window = {
              border = "rounded",
              winhighlight = "Normal:BlinkCmpDoc,FloatBorder:FloatBorder,EndOfBuffer:BlinkCmpDoc",
              scrollbar = false,
            },
          },
          ghost_text = {
            enabled = true,
          },
        },
        signature = {
          enabled = true,
          window = {
            border = "rounded",
            winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:FloatBorder",
            scrollbar = false,
            treesitter_highlighting = true,
            show_documentation = true,
          },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        sources = {
          default = {
            "codecompanion",
            "lsp",
            "lazydev",
            "snippets",
            "buffer",
            "path",
            "nerdfont",
            "ripgrep",
          },
          providers = {
            codecompanion = {
              name = "CodeCompanion",
              module = "codecompanion.providers.completion.blink",
              score_offset = 106,
              transform_items = function(_, items)
                for _, item in ipairs(items) do
                  item.kind_icon = icons.bot
                end
                return items
              end,
            },
            lsp = {
              name = "LSP",
              module = "blink.cmp.sources.lsp",
              score_offset = 105,
            },
            lazydev = {
              name = "LazyDev",
              module = "lazydev.integrations.blink",
              score_offset = 104,
              transform_items = function(_, items)
                for _, item in ipairs(items) do
                  item.kind_icon = icons.lazy
                end
                return items
              end,
            },
            buffer = {
              name = "Buffer",
              module = "blink.cmp.sources.buffer",
              score_offset = 103,
            },
            path = {
              name = "Path",
              module = "blink.cmp.sources.path",
              score_offset = 102,
            },
            nerdfont = {
              module = "blink-nerdfont",
              name = "Nerd Fonts",
              score_offset = 101,
              opts = { insert = true },
              transform_items = function(_, items)
                for _, item in ipairs(items) do
                  item.kind_icon = icons.smiley
                end
                return items
              end,
            },
            ripgrep = {
              module = "blink-ripgrep",
              name = "Ripgrep",
              score_offset = 100,
              opts = {
                prefix_min_len = 3,
                context_size = 5,
                max_filesize = "3M",
                project_root_marker = ".git",
                project_root_fallback = true,
                search_casing = "--smart-case",
                additional_rg_options = {},
                fallback_to_regex_highlighting = true,
                ignore_paths = {},
                additional_paths = { "/usr/share/dict/words" },
              },
              transform_items = function(_, items)
                for _, item in ipairs(items) do
                  item.kind_icon = icons.find
                end
                return items
              end,
            },
          },
        },
        appearance = {
          nerd_font_variant = "normal",
          kind_icons = icons.kind_icons,
        },
      }
    end,
    opts_extend = { "sources.default" },
  },
}
