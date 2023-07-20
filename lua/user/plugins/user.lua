return {
  -- christoomey/vim-tmux-navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- max397574/better-escape.nvim
  {
    "max397574/better-escape.nvim",
    event = "User AstroFile",
    config = function()
      require("better_escape").setup {
        mapping = { "kj" },
        timeout = vim.o.timeoutlen,
        clear_empty_lines = false,
        keys = "<Esc>",
      }
    end,
  },
  -- base16 colorscheme
  {
    "RRethy/nvim-base16",
  },
  -- karb94/neoscroll.nvim
  {
    "karb94/neoscroll.nvim",
    event = "User AstroFile",
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = false, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
      }
      local t = {}
      t["<c-p>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
      t["<c-n>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }

      require("neoscroll.config").set_mappings(t)
    end,
  },
}
