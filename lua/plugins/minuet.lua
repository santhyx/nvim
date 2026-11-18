return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        -- Free tier: https://aistudio.google.com/apikey
        -- Set GEMINI_API_KEY in your shell environment.
        provider = "gemini",
        request_timeout = 10,
        throttle = 1500,
        debounce = 500,
        provider_options = {
          gemini = {
            model = "gemini-3.1-flash-lite",
            api_key = function()
              local path = vim.fn.stdpath("config") .. "/.dotenv/.opencode.local.env"
              local ok, lines = pcall(vim.fn.readfile, path)
              if ok then
                for _, line in ipairs(lines) do
                  local value = line:match("^%s*GEMINI_API_KEY%s*=%s*(.-)%s*$")
                  if value and value ~= "" then
                    return (value:gsub("^(['\"])(.*)%1$", "%2"))
                  end
                end
              end
              return vim.env.GEMINI_API_KEY
            end,
            optional = {
              generationConfig = {
                maxOutputTokens = 256,
                thinkingConfig = {
                  thinkingLevel = "minimal",
                },
              },
            },
          },
        },
      })
    end,
  },
  {
    "Saghen/blink.cmp",
    opts = {
      keymap = {
        ["<A-y>"] = {
          function(cmp)
            cmp.show({ providers = { "minuet" } })
          end,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "minuet" },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            async = true,
            timeout_ms = 10000,
            score_offset = 50,
          },
        },
      },
      completion = { trigger = { prefetch_on_insert = false } },
    },
  },
}
