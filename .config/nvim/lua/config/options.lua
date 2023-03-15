-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- vim.opt.autochdir = true

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_remember_window_size = true
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_mode = "torpedo"
  vim.g.neovide_cursor_vfx_mode = "ripple"
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_fullscreen = false
  vim.o.guifont = "Hack Nerd Font:h11:#e-subpixelantialias:#h-none"
end
