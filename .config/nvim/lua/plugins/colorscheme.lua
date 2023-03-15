return {
  "Shatur/neovim-ayu",
  config = function(_, opts)
    -- opts.mirage = false
    require("ayu").setup({
      overrides = function()
        local colors = require("ayu.colors")
        colors.generate(false)

        return {
          Normal = { bg = "#000000" },
          -- Cursor = { fg = colors.fg, bg = colors.bg },
        }
      end,
    })
  end,
}
