-- Mapping data with "desc" stored directly by vim.keymap.set().

-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "new tab" },
    ["<leader>bd"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "pick to close",
    },
    ["<leader>b"] = { name = "buffers" },
    ["<leader>fp"] = { "<cmd>Telescope projects initial_mode=normal<cr>", desc = "find projects" },

    -- switch buffer
    ["<S-h>"] = { "<plug>(CybuPrev)", desc = "next buffer" },
    ["<S-l>"] = { "<plug>(CybuNext)", desc = "previous buffer" },
    -- noice close notification
    ["<leader>n"] = { "<cmd>lua require('notify').dismiss()<cr>", desc = "dismiss notification" },

    -- run libgdx
    ["<leader><f4>"] = { "<cmd>!./gradlew run<cr>", desc = "run libgdx" },

    -- -- telescope
    --
    --  ["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Todo Comments" },
  },
  v = {
    -- Better paste
    ["p"] = { '"_dP', desc = "Better paste" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
