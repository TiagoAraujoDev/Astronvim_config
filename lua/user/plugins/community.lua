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
  { import = "astrocommunity.pack.astro" },

  -- Utilities
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.utility.transparent-nvim" },

  -- Editing support
  -- { import = "astrocommunity.editing-support.nvim-ts-rainbow2" },
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
        cursorline = true,
      },
    },
  },
  {
    "project_nvim",
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
  {
    "noice.nvim",
    opts = {
      messages = { enabled = true },
      cmdline = {
        format = {
          filter = { pattern = "^:%s*!", icon = "$ ", ft = "sh" },
          IncRename = {
            pattern = "^:%s*IncRename%s+",
            icon = " ",
            conceal = true,
          },
        },
      },
      views = {
        cmdline_popup = {
          border = { style = "rounded", padding = { 1, 2 } },
          win_options = {
            winblend = 5,
            winhighlight = {
              Normal = "NormalFloat",
              FloatBorder = "NoiceCmdlinePopupBorder",
              IncSearch = "",
              Search = "",
            },
            cursorline = false,
          },
        },
      },
      popupmenu = {
        enabled = true,
      },
      routes = {
        { view = "notify", filter = { event = "msg_showmode" } },
        { filter = { event = "msg_show", find = "%d+L, %d+B" }, view = "mini" },
        {
          view = "cmdline_output",
          filter = { cmdline = "^:", min_height = 5 },
          -- BUG: will be fixed after https://github.com/neovim/neovim/issues/21044 gets merged
        },
        { filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "; before #" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "; after #" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = " lines, " }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "go up one level" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "yanked" }, opts = { skip = false } },
        { filter = { find = "No active Snippet" }, opts = { skip = true } },
        { filter = { find = "waiting for cargo metadata" }, opts = { skip = true } },
      },
      presets = {
        inc_rename = true,
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = "rounded",
      },
    },
  },
}
