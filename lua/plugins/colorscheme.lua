return {
  --{ "rebelot/kanagawa.nvim" },--
  { "ellisonleao/gruvbox.nvim" },
  --[[LazyVim{
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      -- your optional config goes here, see below.
    end,
  },]]
  --
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
