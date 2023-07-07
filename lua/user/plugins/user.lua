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
}
