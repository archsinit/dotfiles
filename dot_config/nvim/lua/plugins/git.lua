return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },

    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
        untracked    = { text = "▎" },
      },

      on_attach = function(buf)
        local map = function(mode, keys, func, desc)
          vim.keymap.set(mode, keys, func, { buffer = buf, desc = desc })
        end

        local gs = require("gitsigns")

        -- navigation
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "next hunk")

        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "prev hunk")

        -- actions
        map("n", "<leader>gs", gs.stage_hunk,  "stage hunk")
        map("n", "<leader>gr", gs.reset_hunk,  "reset hunk")
        map("n", "<leader>gS", gs.stage_buffer, "stage buffer")
        map("n", "<leader>gR", gs.reset_buffer, "reset buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk, "undo stage hunk")
        map("n", "<leader>gp", gs.preview_hunk, "preview hunk")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "blame line")
        map("n", "<leader>gd", gs.diffthis, "diff this")

        -- visual mode — stage/reset just the selected lines
        map("v", "<leader>gs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "stage selected")
        map("v", "<leader>gr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "reset selected")

        -- text object — lets you do `vih` to select a hunk, `dah` to delete it
        map({ "o", "x" }, "ih", ":<C-u>Gitsigns select_hunk<CR>", "select hunk")
      end,
    },
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },  -- only loads when you actually run a Git command
  },
}
