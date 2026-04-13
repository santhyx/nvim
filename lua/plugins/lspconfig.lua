return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      omnisharp = { enabled = false },
      gopls = {},
      pyright = {},
      ts_ls = {},
      rust_analyzer = {},
      lua_ls = {},
      jsonls = {},
      yamlls = {},
      biome = {},
    },
  },
}
