-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local getPath = function(path, folder, sep)
  local sep = sep or "/"
  local dir_path = path:match("(.*" .. sep .. folder .. sep .. ")")
  if #folder == 0 or dir_path == nil then
    return path:match("(.*" .. sep .. ")")
  else
    return dir_path
  end
end

vim.api.nvim_create_user_command("CD", function(ctx)
  local path = getPath(vim.api.nvim_buf_get_name(0), ctx.args, "/")
  vim.api.nvim_set_current_dir(path)
end, { nargs = "?" })

if vim.g.neovide then
  local opts = {}
  opts.silent = opts.silent ~= false
  opts.desc = "fullscreen neovide"
  vim.keymap.set({ "n", "i" }, "<A-Enter>", function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
  end, opts)
end

vim.api.nvim_create_user_command("WriteQuit", function()
  local confirmed = vim.fn.confirm("Do you really want to quit?", "&Yes\n&No", 2)
  vim.cmd.wa()
  if confirmed == 1 then
    vim.cmd.quit()
  end
end, {})
vim.api.nvim_create_user_command("Quit", function()
  local confirmed = vim.fn.confirm("Do you really want to quit?", "&Yes\n&No", 2)
  if confirmed == 1 then
    vim.cmd.quit()
  end
end, {})
vim.cmd.cnoreabbrev("<buffer>", "q", "Quit")
vim.cmd.cnoreabbrev("<buffer>", "wq", "WriteQuit")
