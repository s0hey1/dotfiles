MyConfig = {}
MyConfig.mt = {}
setmetatable(MyConfig, MyConfig.mt)
MyConfig.mt.__index = function(table, key)
    table[key] = {}
    setmetatable(table[key], table.mt)
    return table[key]
end
