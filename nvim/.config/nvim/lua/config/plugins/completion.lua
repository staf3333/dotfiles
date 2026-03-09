return {
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      "giuxtaposition/blink-cmp-copilot",
    },

    version = '*',

    opts = {
      keymap = { preset = 'default' },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              local copilot_kind_idx

              -- Find the index of "Copilot" in CompletionItemKind
              for idx, kind in ipairs(CompletionItemKind) do
                if kind == "Copilot" then
                  copilot_kind_idx = idx
                  break
                end
              end

              -- Ensure kind_idx is found
              if not copilot_kind_idx then
                -- print("Error: 'Copilot' kind not found in CompletionItemKind")
                copilot_kind_idx = #CompletionItemKind + 1
                CompletionItemKind[copilot_kind_idx] = "Copilot"
                CompletionItemKind["Copilot"] = copilot_kind_idx
              end

              -- print("copilot_kind_idx:", copilot_kind_idx)
              -- print("CompletionItemKind:", vim.inspect(CompletionItemKind))

              for _, item in ipairs(items) do
                item.kind = copilot_kind_idx
              end
              return items
            end,
          },
        },
      },
      signature = { enabled = true },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
        -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
        kind_icons = {
          Copilot = "",
          Text = '󰉿',
          Method = '󰊕',
          Function = '󰊕',
          Constructor = '󰒓',

          Field = '󰜢',
          Variable = '󰆦',
          Property = '󰖷',

          Class = '󱡠',
          Interface = '󱡠',
          Struct = '󱡠',
          Module = '󰅩',

          Unit = '󰪚',
          Value = '󰦨',
          Enum = '󰦨',
          EnumMember = '󰦨',

          Keyword = '󰻾',
          Constant = '󰏿',

          Snippet = '󱄽',
          Color = '󰏘',
          File = '󰈔',
          Reference = '󰬲',
          Folder = '󰉋',
          Event = '󱐋',
          Operator = '󰪚',
          TypeParameter = '󰬛',
        }
      },
    },
  }
}
