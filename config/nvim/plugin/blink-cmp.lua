vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    vim.pack.add {
      {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range "1",
      },
      "https://github.com/rafamadriz/friendly-snippets",
      "https://github.com/xzbdmw/colorful-menu.nvim",
      "https://github.com/joelazar/blink-calc",
      "https://github.com/MahanRahmati/blink-nerdfont.nvim",
      "https://github.com/mikavilpas/blink-ripgrep.nvim",
    }

    local icons = require "icons"

    require("blink.cmp").setup {
      keymap = {
        preset = "none",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = {
          function(cmp)
            if vim.fn["llama#is_fim_hint_shown"]() then
              vim.schedule(function()
                vim.fn["llama#fim_accept"] "full"
              end)
              return true
            end
            if cmp.is_visible() then
              return cmp.select_next()
            end
          end,
          "fallback",
        },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      },
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
          scrollbar = false,
          treesitter_highlighting = true,
          show_documentation = true,
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      sources = {
        default = {
          "lsp",
          "snippets",
          "buffer",
          "path",
          "calc",
          "nerdfont",
          "ripgrep",
        },
        providers = {
          calc = {
            name = "Calc",
            module = "blink-calc",
            score_offset = 105,
          },
          lsp = {
            name = "LSP",
            module = "blink.cmp.sources.lsp",
            score_offset = 104,
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
              project_root_marker = ".git",
              fallback_to_regex_highlighting = true,
              backend = {
                use = "ripgrep",
                customize_icon_highlight = true,
                ripgrep = {
                  context_size = 5,
                  max_filesize = "1M",
                  project_root_fallback = true,
                  search_casing = "--smart-case",
                  additional_rg_options = {},
                  ignore_paths = {},
                  additional_paths = { "/usr/share/dict/words" },
                },
              },
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
})
