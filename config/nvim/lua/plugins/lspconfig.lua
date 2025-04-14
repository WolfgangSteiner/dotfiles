return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").ccls.setup({
      cmd = { "ccls" },  -- optional, default is fine
    })
  end,
}
