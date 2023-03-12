return {
  "nvim-zh/colorful-winsep.nvim",
  lazy = true,
  config = function()
    require("colorful-winsep").setup({})
  end,
  event = { "WinNew" },
}
