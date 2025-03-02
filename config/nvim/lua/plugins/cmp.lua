return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
      },
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "chrisgrieser/cmp-nerdfont",
      "octaltree/cmp-look",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      local icons = require "icons"
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { "~/.config/nvim/snippets/" },
      }

      luasnip.config.setup {}
      luasnip.filetype_extend("blade", { "html" })

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
          and vim.api
              .nvim_buf_get_lines(0, line - 1, line, true)[1]
              :sub(col, col)
              :match "%s"
            == nil
      end

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered {
            scrollbar = false,
          },
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping {
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm {
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = false,
                }
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm { select = true },
            c = cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            },
          },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
              -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
              -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(entry, vim_item)
            vim_item.kind = string.format("%s", icons.kind_icons[vim_item.kind])
            vim_item.menu = ({
              cody = "Cody",
              nvim_lsp_signature_help = "LSP",
              nvim_lsp = "LSP",
              nvim_lua = "Lua",
              luasnip = "Snippet",
              buffer = "Buffer",
              path = "Path",
              nerdfont = "Nerd Font",
              look = "Look",
            })[entry.source.name]
            return vim_item
          end,
        },
        sources = cmp.config.sources {
          { name = "lazydev", group_index = 0 },
          { name = "cody" },
          { name = "nvim_lsp_signature_help" },
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "crates" },
          { name = "calc" },
          { name = "nerdfont" },
          {
            name = "look",
            keyword_length = 2,
            option = {
              convert_case = true,
              loud = true,
              --dict = '/usr/share/dict/words'
            },
          },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
        performance = {
          fetching_timeout = 1000,
        },
      }

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline {
          ["<CR>"] = cmp.mapping {
            i = cmp.mapping.confirm { select = false },
            s = cmp.mapping.confirm { select = false },
            c = cmp.mapping.confirm { select = false },
          },
        },
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
