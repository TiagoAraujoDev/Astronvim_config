-- Mapping data with "desc" stored directly by vim.keymap.set().

-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "buffer"
    -- switch buffer
    -- noice close notification
    ["<leader>n"] = { "<cmd>lua require('notify').dismiss()<cr>", desc = "dismiss notification" },

    -- run libgdx
    ["<leader><f4>"] = { "<cmd>!./gradlew run<cr>", desc = "run libgdx" },
  },
  v = {
    -- Better paste
    ["p"] = { '"_dP', desc = "Better paste" },
  },
}
