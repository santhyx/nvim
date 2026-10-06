return {
  "nickjvandyke/opencode.nvim",
  -- Defaults to "main", supporting OpenCode v2.
  -- Uncomment to pull the latest stable release, supporting OpenCode v1.
  -- version = "*",
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any; goto definition on the type for details
    }

    -- Recommended/example keymaps
    vim.keymap.set({ "n", "x" }, "<C-a>", function()
      require("opencode").ask("@this: ")
    end, { desc = "Ask OpenCode…" })
    vim.keymap.set({ "n", "x" }, "<C-x>", function()
      require("opencode").select()
    end, { desc = "Select OpenCode…" })
    vim.keymap.set({ "n", "x" }, "go", function()
      return require("opencode").operator("@this")
    end, { desc = "Send range to OpenCode", expr = true })
    vim.keymap.set({ "n" }, "goo", function()
      return require("opencode").operator("@this") .. "_"
    end, { desc = "Send line to OpenCode", expr = true })
    vim.keymap.set({ "n", "x", "t" }, "<C-,>", function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local name = vim.api.nvim_buf_get_name(buf)
        if name:match("term://.*opencode") then
          vim.api.nvim_win_close(win, false)
          return
        end
      end
      -- reuse ukrytego bufora jeśli istnieje
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(buf) then
          local name = vim.api.nvim_buf_get_name(buf)
          if name:match("term://.*opencode") then
            vim.cmd("botright vsplit")
            vim.api.nvim_win_set_buf(0, buf)
            vim.cmd("startinsert")
            return
          end
        end
      end
      vim.cmd("botright vsplit term://opencode")
      vim.cmd("startinsert")
    end, { desc = "Toggle OpenCode on right" })
  end,
}
