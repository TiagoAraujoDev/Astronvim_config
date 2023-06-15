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
  { import = "astrocommunity.pack.go" },

  -- Utilities
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.utility.transparent-nvim" },

  -- Editing support
  { import = "astrocommunity.editing-support.nvim-ts-rainbow" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },

  -- Motion
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.leap-nvim" },

  -- Markdown and latex
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },

  -- Project
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.project.nvim-spectre" },

  -- Colorscheme
  { import = "astrocommunity.colorscheme.catppuccin",            enabled = false },
  { import = "astrocommunity.colorscheme.kanagawa-nvim",         enabled = true },
  { import = "astrocommunity.colorscheme.oxocarbon-nvim",        enabled = false },
  { import = "astrocommunity.colorscheme.tokyonight-nvim",       enabled = false },
  { import = "astrocommunity.colorscheme.gruvbox-nvim",          enabled = false },
  { import = "astrocommunity.colorscheme.everforest-nvim",       enabled = false },
  { import = "astrocommunity.colorscheme.nightfox-nvim",         enabled = true },
  { import = "astrocommunity.colorscheme.onigiri-nvim",          enabled = false },
  { import = "astrocommunity.colorscheme.vscode-nvim",           enabled = true },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim",       enabled = true },

  -- Extra configuration for the community plugins
  {
    "todo-comments.nvim",
    keys = {
      { "<leader>fT", "<cmd>TodoTelescope<cr>", desc = "Find ToDo Comments" },
    },
  },
  {
    "onedarkpro.nvim",
    opts = {
      styles = {
        types = "italic",
        methods = "bold,italic",
        comments = "italic",
        virtual_text = "bold",
      },
      options = {
        highlight_inactive_windows = false,
        cursorline = false,
      },
    },
  },
  {
    "project.nvim",
    keys = {
      { "<leader>fp", "<cmd>Telescope projects initial_mode=normal<cr>", desc = "Find projects" },
    },
  },
  {
    "glow.nvim",
    keys = {
      { "<leader>m", "<cmd>Glow<cr>", desc = "Preview markdown" },
    },
  },
}
