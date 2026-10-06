return {
  "lervag/vimtex",
  ft = { "tex", "bib" },
  init = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      executable = "latexmk",
      options = {
        "-lualatex",
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-outdir=build",
      },
    }
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_fold_enabled = 1
    vim.opt.conceallevel = 2
  end,
  keys = {},
}
