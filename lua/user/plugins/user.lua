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
  -- ghillb/cybu.nvim
  {
    "ghillb/cybu.nvim",
    event = "User AstroFile",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
    config = function()
      require("cybu").setup {
        position = {
          relative_to = "win", -- win, editor, cursor
          anchor = "topright", -- topleft, topcenter, topright,
          -- centerleft, center, centerright,
          -- bottomleft, bottomcenter, bottomright
          vertical_offset = 0, -- vertical offset from anchor in lines
          horizontal_offset = 0, -- vertical offset from anchor in columns
          max_win_height = 5, -- height of cybu window in lines
          max_win_width = 0.5, -- integer for absolute in columns
        },
        style = {
          path = "relative", -- absolute, relative, tail (filename only)
          path_abbreviation = "none", -- none, shortened
          border = "single", -- single, double, rounded, none
          padding = 2, -- left & right padding in number of spaces
        },
        display_time = 2500, -- time the cybu window is displayed
      }
    end,
    keys = {
      { "<S-k>", "<Plug>(CybuPrev)", desc = "next buffer" },
      { "<S-j>", "<Plug>(CybuNext)", desc = "previous buffer" },
    },
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
      t["<c-k>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
      t["<c-j>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }

      require("neoscroll.config").set_mappings(t)
    end,
  },
}
