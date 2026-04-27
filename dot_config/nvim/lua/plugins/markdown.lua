return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },   -- only loads when you open a markdown file
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },

  opts = {
    render_modes = { "n", "c" },     -- render in normal mode, not insert
    anti_conceal = { enabled = true },  -- reveals syntax under cursor so you can edit it

    heading = {
      sign = false,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },

    bullet = {
      icons = { "●", "○", "◆", "◇" },
    },

    checkbox = {
      unchecked = { icon = "󰄱 " },
      checked   = { icon = "󰱒 " },
    },

    code = {
      sign = false,
      width = "block",
      border = "thick",
    },

    dash = { width = 40 },

    pipe_table = { preset = "heavy" },
  },
}
