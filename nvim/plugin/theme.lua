if vim.g.did_load_theme_plugin then
  return
end
vim.g.did_load_theme_plugin = true

local function trim6(s)
   return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)'
end

-- Exit if dark-notify doesn't exist
if vim.g.exe_dark_notify == nil then
  require('user.util').notify("Couldn't detect sys theme", vim.log.levels.WARN)
  require('tokyonight').setup({
    style = 'night',
  })
  vim.cmd.colorscheme('tokyonight')
  return
end

local _is_success, res = pcall(function () return vim.system({vim.g.exe_dark_notify, '--exit'}, { text = true }):wait() end)

if trim6(res.stdout) == 'light' then
  require('tokyonight').setup({
    style = 'day',
    --day_brightness = 0.3, -- doesn't change background
  })
  vim.cmd.colorscheme('tokyonight')
else
  require('tokyonight').setup({
    style = 'night',
  })
  vim.cmd.colorscheme('tokyonight')
end
