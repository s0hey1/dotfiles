-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.neovide then
  local opts = {}
  opts.silent = opts.silent ~= false
  opts.desc = "fullscreen neovide"
  vim.keymap.set({ "n", "i" }, "<A-Enter>", function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
  end, opts)
end
