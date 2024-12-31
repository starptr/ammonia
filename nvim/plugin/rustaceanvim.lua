vim.g.rustaceanvim = {
  -- Plugin configuration
  --tools = {
  --},
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- These keymaps are defined here instead of nvim/ftplugin/rust.lua because of keymap override order
      -- In nvim/plugin/autocommands.lua, we set lsp-specific keybinds on the LspAttach event.
      -- However, when opening a project's rust source file, if we open a rust file as the first file we open (which is typical), then the order of config that nvim reads becomes:
      --   nvim/ftplugin/rust.lua -> LspAttach
      -- (It is unclear if nvim/**after**/ftplugin/rust.lua comes before or after the LspAttach event.)
      -- Thus, we can't override keybinds that are set in the LspAttach event callback.
      -- The body of this function (ie. the on_attach callback) is called once the LSP server is attached. The following code will run *after* the LspAttach autocommand callback, so overriding the keymaps set in the LspAttach callback is done here.

      -- you can also put keymaps in here
      local function desc(description)
        return { noremap = true, silent = true, buffer = bufnr, desc = description }
      end

      vim.keymap.set(
        "n",
        "<leader>la",
        function()
          vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
          -- or vim.lsp.buf.codeAction() if you don't want grouping.
        end,
        desc('[rust] code [a]ction')
      )
      vim.keymap.set(
        "n",
        --"K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
        "<leader>lK", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
        function()
          vim.cmd.RustLsp({ 'hover', 'actions' })
        end,
        desc('[rust] hover')
      )
    end,
    --default_settings = {
    --  -- rust-analyzer language server configuration
    --  ['rust-analyzer'] = {
    --  },
    --},
  },
  -- DAP configuration
  --dap = {
  --},
}
