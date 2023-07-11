return {
  n = {
    ["<leader>a"] = { "<cmd>enew<cr>", desc = "new file" },
    ["<leader>n"] = { "<cmd>lua require('notify').dismiss()<cr>", desc = "dismiss notification" },

    -- run libgdx
    -- ["<leader><f4>"] = { "<cmd>!./gradlew run<cr>", desc = "run libgdx" },
  },
  v = {
    -- Better paste
    ["p"] = { '"_dP', desc = "Better paste" },
  },
}
