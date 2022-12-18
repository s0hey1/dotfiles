local tmux_status, tmux = pcall(require, 'tmux')
if not tmux_status then return end

tmux.setup()

--keybindings must be added in ~/.tmux.conf
