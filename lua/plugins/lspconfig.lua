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
      texlab = {
        settings = {
          texlab = {
            build = { onSave = false },
            forwardSearch = {
              executable = "zathura",
              args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
          },
        },
      },
    },
  },
}
