local function lsp_status_component(lualine)
  local l_status, lsp_status = pcall(require, "lsp-status")
  if not l_status then
    return nil
  end
  local lualine_schduled = false
  local default_config = {
    --spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'},
    --spinner_frames = {'', '', '', '','','','','','','','','','','','','','','','','','','','','','','',''},
    spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
    component_separator = " ",
  }
  local spinner_frame_counter = 1
  local frame_counter = 1
  local config = {}
  config = vim.tbl_extend("force", config, default_config)
  return function()
    local buf_clients = {}
    local client_exist = false
    for _, client in pairs(vim.lsp.buf_get_clients()) do
      buf_clients[client.name] = ""
      -- print(client.name)
      client_exist = true
    end
    if not client_exist then
      return nil
    end
    -- if not client_exist then
    --   return ""
    -- end

    local buf_messages = lsp_status.messages()
    local clients = {}
    local curr_content = nil
    local contents = ""
    for _, msg in pairs(buf_messages) do
      local name = msg.name
      if buf_clients[name] ~= nil and msg.content ~= "idle" then
        if msg.progress or (msg.status and curr_content ~= msg.content) then
          contents = config.spinner_frames[(spinner_frame_counter % #config.spinner_frames) + 1]
          frame_counter = frame_counter + 1
          if frame_counter % 2 == 0 then
            spinner_frame_counter = spinner_frame_counter + 1
          end
          if msg.status then
            curr_content = msg.content
          end
        end
        if #buf_clients[name] == 0 and #contents > 0 then
          buf_clients[name] = contents
        end
      end
    end
    for c, c_c in pairs(buf_clients) do
      if #c_c == 0 then
        buf_clients[c] = { busy = false, name = c }
      else
        buf_clients[c] = { busy = true, name = c, spinner = c_c }
      end
      table.insert(clients, buf_clients[c])
    end
    if #contents > 0 and not lualine_schduled then
      lualine_schduled = true
      vim.defer_fn(function()
        vim.schedule(function()
          lualine_schduled = false
          lualine.refresh()
        end)
      end, 50)
    end
    -- return lsp_status.status()
    return clients
  end

  -- table.insert(section_x, get_lsp_status)
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    options = {
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      -- theme = "ayu-mirage",
    }
    -- dont show the winbar for some filetypes
    opts.options.disabled_filetypes.winbar = { "dashboard", "lazy", "alpha" }
    -- remove navic from the statusline
    local lualine = require("lualine")
    local lsp_status_comp = lsp_status_component(lualine)
    local lsp_active = false
    local lsp_active_time = 0
    local lsp_active_clients = {}
    local timer = vim.loop.new_timer()
    timer:start(50, 50, function()
      lsp_active_time = lsp_active_time + 1
      -- print(lsp_active_time)
    end)
    table.remove(opts.sections.lualine_c)
    table.insert(opts.sections.lualine_x, {
      function()
        local clients = lsp_status_comp()
        local spinner = " "
        lsp_active_clients = {}
        if clients == nil then
          return ""
        else
          for c, c_c in pairs(clients) do
            table.insert(lsp_active_clients, c_c.name)
            if c_c.busy then
              spinner = c_c.spinner
              lsp_active = true
              lsp_active_time = 0
              break
            end
          end
        end
        return spinner
      end,
      on_click = function()
        print("Active_Lsp_servers : [ " .. table.concat(lsp_active_clients, ", ") .. " ]")
      end,
      color = function()
        if lsp_active then
          if lsp_active_time > 5 then
            lsp_active_time = 0
            lsp_active = false
          end
          return { fg = "red" }
        else
          return { fg = "green" }
        end
      end,
      icon = {
        " Lsp",
        align = "left",
      },
      separator = "❖", --"❰", --"", --"", --"⏴⏵", --"◈", --"⏴⏵", --"╱", --" ",
      -- padding = { left = 1, right = 0 },
    })
    table.insert(opts.sections.lualine_x, {
      function()
        return "🌳" --"🌲" --  --""
      end,
      cond = function()
        local buf = vim.api.nvim_get_current_buf()
        local highlighter = require("vim.treesitter.highlighter")
        if highlighter.active[buf] then
          return true
        else
          return false
        end
      end,
      color = { fg = "green" },
      -- separator = "",
      separator = "❖", --"❰", --"", --"", --"⏴⏵", --"◈", --"⏴⏵", --"╱", --" ",
    })
    table.insert(opts.sections.lualine_x, {
      "filetype",
      icon_only = false,
      -- separator = "",
      -- separator = "⌁", --"╱", -- " ",
      separator = "❖", --"❰", --"", --"", --"❰", --"❖", --"☰", --"⏴⏵", --"◈", --"⏴⏵", --"╱", -- " ",
      padding = { left = 1, right = 1 },
    })

    table.insert(opts.sections.lualine_x, {
      "fileformat",
      symbols = {
        unix = "", -- e712
        dos = "", -- e70f
        mac = "", -- e711
      },
    })
    opts.sections.lualine_y[1].separator = " "
    opts.sections.lualine_y[1].padding.right = 1
    opts.sections.lualine_y[1].padding.left = 1
  end,
}
