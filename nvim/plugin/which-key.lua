local nvim_tree_api = require('nvim-tree.api')


require('which-key').setup {
  preset = 'helix',
  spec = {
    {
      "<leader>ts", group = "[T]ree[s]itter",
    },
    { "<leader>fe", function()
      nvim_tree_api.tree.toggle()
      --nvim_tree_api.tree.reload()
      end, desc = "[nvim-tree] toggle [f]ile [e]xplorer"
    },
    {
      "<leader>wh", '<C-w>h', desc = "goto left window"
    },
    {
      "<leader>wj", '<C-w>j', desc = "goto down window"
    },
    {
      "<leader>wk", '<C-w>k', desc = "goto up window"
    },
    {
      "<leader>wl", '<C-w>l', desc = "goto right window"
    },
    {
      "<leader><leader>y", '"+y', mode = 'x', desc = "[y]ank to clipboard"
    },
    {
      "<leader><leader>p", '"+p', mode = 'n', desc = "[p]aste from clipboard"
    },
    {
      "<leader><leader>P", '"+P', mode = 'n', desc = "[P]aste from clipboard after cursor"
    },
  },
  notify = true, -- Warn about mapping issues
  keys = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
}
