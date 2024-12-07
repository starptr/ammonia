local nvim_tree_api = require('nvim-tree.api')


require('which-key').setup {
  preset = 'helix',
  spec = {
    { "<leader><leader>e", function()
      nvim_tree_api.tree.toggle()
      --nvim_tree_api.tree.reload()
    end, desc = "[nvim-tree] toggle [e]xplorer" },
  },
}
