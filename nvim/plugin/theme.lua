if vim.g.did_load_theme_plugin then
  return
end
vim.g.did_load_theme_plugin = true

local function trim6(s)
   return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)'
end

local res = vim.system({'dark-notify', '--exit'}, { text = true }):wait()

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
