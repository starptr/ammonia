---@mod user.util
---
---@brief [[
---Various utility functions
---@brief ]]

local M = {}

---Notifies the user with the context of the function caller
---@return nil
function M.notify(msg, level, opts)
  local level = level or vim.log.levels.WARN
  local info = debug.getinfo(2, 'S') -- 0 is getinfo itself, 1 is this call site, 2 is the caller of this function
  local source = info.source
  ---Converts a full path to a Lua script source in the nix store to a path relative to the derivation
  ---@return string
  local function strip_source(full_source)
    return full_source:gsub('^@/nix/store/.-/', '', 1)
  end
  local source = strip_source(source)
  vim.notify(source .. ': ' .. msg, level, opts)
end

return M
