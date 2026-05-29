-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs", "typescript", "typescriptreact", "javascript", "javascriptreact" },
  group = vim.api.nvim_create_augroup("DapProjectConfig", { clear = true }),
  callback = function()
    local root = vim.fs.root(0, function(name) return name:match("%.sln$") end)
        or vim.fs.root(0, function(name) return name:match("%.csproj$") end)
    if root then
      local config_path = root .. "/dap.configurations.lua"
      if vim.fn.filereadable(config_path) == 1 then
        dofile(config_path)
      end
    end
  end,
})

