return {
  -- goolord/alpha-nvim
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      local headers = require "user.header"
      opts.section.header.val = headers.main

      -- customize the buttons
      local button = require("astronvim.utils").alpha_button
      opts.section.buttons.val = {
        button("LDR n", "  New File"),
        button("LDR f p", "  Find Projects"),
        button("LDR f f", "  Find File"),
        button("LDR f o", "  Recents"),
        button("LDR f w", "  Find Word"),
        button("LDR S l", "  Last Session"),
      }

      return opts
    end,
  },
  -- hrsh7th/nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    commit = "a9c701fa7e12e9257b3162000e5288a75d280c28", -- https://github.com/hrsh7th/nvim-cmp/issues/1382
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-emoji",
    },
    event = "InsertEnter",
    opts = function()
      local cmp = require "cmp"
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      local lspkind_status_ok, lspkind = pcall(require, "lspkind")
      if not snip_status_ok then return end
      local border_opts = {
        border = "single",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      }

      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      return {
        enabled = function()
          if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then return false end
          return vim.g.cmp_enabled
        end,
        preselect = cmp.PreselectMode.None,
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = lspkind_status_ok and lspkind.cmp_format(astronvim.lspkind) or nil,
        },
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        duplicates = {
          nvim_lsp = 1,
          luasnip = 1,
          cmp_tabnine = 1,
          buffer = 1,
          path = 1,
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        window = {
          completion = cmp.config.window.bordered(border_opts),
          documentation = cmp.config.window.bordered(border_opts),
        },
        mapping = {
          ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
          ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
          ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-y>"] = cmp.config.disable,
          ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750 },
          { name = "buffer",   priority = 500 },
          { name = "path",     priority = 250 },
          { name = "emoji",    priority = 700 },
        },
      }
    end,
  },
  -- windwp/nvim-autopairs
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "plugins.configs.nvim-autopairs" (plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
          -- don't add a pair if the next character is %
              :with_pair(cond.not_after_regex "%%")
          -- don't add a pair if  the previous character is xxx
              :with_pair(
                cond.not_before_regex("xxx", 3)
              )
          -- don't move right when repeat character
              :with_move(cond.none())
          -- don't delete if the next character is xx
              :with_del(cond.not_after_regex "xx")
          -- disable adding a newline when you press <cr>
              :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  -- nvim-telescope/telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return {
        defaults = {
          prompt_prefix = "  ",
          selection_caret = " ",
        },
      }
    end,
    keys = {
      { "<leader>fH", "<cmd>Telescope highlights<cr>", desc = "Find highlights"}
    },
    -- the first parameter is the plugin specification
    -- the second is the table of options as set up in Lazy with the `opts` key
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require "plugins.configs.telescope" (plugin, opts)

      -- require telescope and load extensions as necessary
      local telescope = require "telescope"
      telescope.load_extension "projects"
    end,
  },
  -- rebelot/heirline.nvim
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"

      opts.winbar = {
        -- create custom winbar
        -- store the current buffer number
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false, -- pick the correct winbar based on condition
        -- inactive winbar
        {
          condition = function() return not status.condition.is_active() end,
          -- show the path to the file relative to the working directory
          status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
          -- add the file name and icon
          status.component.file_info {
            file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbarnc", true),
            surround = false,
            update = "BufEnter",
          },
        },
        -- active winbar
        {
          -- show the path to the file relative to the working directory
          status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
          -- add the file name and icon
          status.component.file_info { -- add file_info to breadcrumbs
            file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
            file_modified = {
              condition = function() return vim.bo.modified end,
              hl = { fg = "white" },
              padding = { left = 1, right = 1 },
            },
            file_read_only = false,
            hl = status.hl.get_attributes("winbar", true),
            surround = false,
            -- update = "BufEnter",
          },
          -- show the breadcrumbs
          status.component.breadcrumbs {
            icon = { hl = true },
            hl = status.hl.get_attributes("winbar", true),
            prefix = true,
            padding = { left = 0 },
            -- depth_limit = 0,
            -- depth_limit_indicator = "..",
          },
        },
      }
      return opts
    end,
  },
  -- onsails/lspkind.nvim
  {
    "onsails/lspkind.nvim",
    opts = function(_, opts)
      -- use codicons preset
      opts.preset = "codicons"
      -- set some missing symbol types
      opts.symbol_map = {
        Array = "",
        Boolean = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        String = "",
      }
      return opts
    end,
  },
  -- noice
  {
    "nvim-notify",
    opts = {
      stages = "slide",
      timeout = 3000,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
    },
  },
}
