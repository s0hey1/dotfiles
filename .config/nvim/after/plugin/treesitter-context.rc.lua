local status, ts_ctx = pcall(require, 'treesitter-context')
if not status then return end

ts_ctx.setup()
