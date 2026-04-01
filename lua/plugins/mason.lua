return {
  {
    "mason-org/mason.nvim",
    lazy = true,
    config = function()
      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
      })
    end,
    opts = {
      omnisharp = { enabled = false },
    },
  },
}
