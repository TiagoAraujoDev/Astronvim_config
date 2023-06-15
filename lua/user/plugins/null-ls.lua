return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- NOTE: config variable is the default configuration table for the setup function call

    local null_ls = require "null-ls"

    -- NOTE: Check supported formatters and linters

    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting

    config.sources = {
      formatting.stylua,
      diagnostics.luacheck,
    }
    return config -- return final config table
  end,
}
