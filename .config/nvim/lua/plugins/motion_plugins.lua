return {
  {
    "ggandor/leap.nvim",
    enabled = false,
    opts = function(_, opts)
      opts.max_highlighted_traversal_targets = 60
    end,
  },
  {
    "ggandor/flit.nvim",
    enabled = false,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function(_, opts)
      local hop = require("hop")
      hop.setup({})
      local directions = require("hop.hint").HintDirection
      vim.keymap.set("n", "s", function()
        hop.hint_char1({ direction = nil, current_line_only = false })
      end, { desc = "hop motion" })
      vim.keymap.set("n", "f", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
      end, { remap = true })
      vim.keymap.set("n", "F", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
      end, { remap = true })
      vim.keymap.set("n", "t", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
      end, { remap = true })
      vim.keymap.set("n", "T", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
      end, { remap = true })
    end,
  },
}
