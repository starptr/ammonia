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
      "<leader><leader>p", '"+p', mode = 'x', desc = "[p]aste from clipboard"
    },
    {
      "<leader><leader>P", '"+P', mode = 'x', desc = "[P]aste from clipboard after cursor"
    },
  },
}
