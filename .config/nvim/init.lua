require('myconfig.base')
require('myconfig.highlights')
require('myconfig.maps')
require('myconfig.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_linux = has "linux"

if is_mac then
    require('myconfig.macos')
end
if is_win then
    require('myconfig.windows')
end

require('myconfig.myconfig')
