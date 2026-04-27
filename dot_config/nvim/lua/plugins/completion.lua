return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = "*",
  dependencies = {
    "rafamadriz/friendly-snippets",  -- a large collection of pre-built snippets
  },

  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"]   = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<CR>"]    = { "accept", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"]   = { "cancel", "fallback" },
      ["<C-d>"]   = { "scroll_documentation_down", "fallback" },
      ["<C-u>"]   = { "scroll_documentation_up", "fallback" },
    },

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    completion = {
      accept = {
        auto_brackets = { enabled = true },  -- adds closing bracket on accept
      },
      menu = {
        border = "rounded",
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "rounded" },
      },
      ghost_text = { enabled = true },  -- shows completion inline as you type
    },

    signature = { enabled = true },     -- shows function signature while typing args
  },
}
