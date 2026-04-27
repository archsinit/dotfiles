return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,        -- load before all other plugins
  lazy = false,           -- load at startup, not on event

  opts = {
    flavour = "mocha",

    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      cmp = true,
      gitsigns = true,
      telescope = false,
      fzf = true,
      mason = true,
      which_key = true,
      indent_blankline = { enabled = true },
      mini = { enabled = true },
    },

    styles = {
      comments = { "italic" },
      keywords = { "bold" },
      functions = {},
      variables = {},
    },

    color_overrides = {},

    custom_highlights = function(colors)
      return {
        -- slightly more visible current line
        CursorLine = { bg = colors.surface0 },
        -- make folded text less distracting
        Folded = { fg = colors.overlay1, bg = colors.base },
      }
    end,
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
