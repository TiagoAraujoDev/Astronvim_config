return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- Packs
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.python" },

  -- Utilities
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.utility.transparent-nvim" },
  { import = "astrocommunity.editing-support.nvim-ts-rainbow" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { "glow.nvim",
    keys = {
      { "<leader>m", "<cmd>Glow<cr>", desc = "Preview markdown" }
    }
  },

  -- Project
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.project.nvim-spectre" },

  -- Themes
  { import = "astrocommunity.colorscheme.catppuccin", enabled = false },
  { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.oxocarbon-nvim", enabled = false },
  { import = "astrocommunity.colorscheme.tokyonight-nvim", enabled = false },
  { import = "astrocommunity.colorscheme.gruvbox-nvim", enabled = false },
  { import = "astrocommunity.colorscheme.everforest-nvim", enabled = false },
  { import = "astrocommunity.colorscheme.nightfox-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.onigiri-nvim", enabled = false },
  { import = "astrocommunity.colorscheme.vscode-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim", enabled = true },
  { "onedarkpro.nvim",
    opts = {
      options = {
        highlight_inactive_windows = false,
      },
    },
  },
}
