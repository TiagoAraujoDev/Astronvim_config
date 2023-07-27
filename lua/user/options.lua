return function(local_vim)
  -- OPTS
  local_vim.opt.relativenumber = true
  local_vim.opt.showtabline = 0

  -- Global
  local_vim.g.mapleader = " "
  local_vim.g.autoformat_enabled = true
  local_vim.g.cmp_enabled = true
  local_vim.g.autopairs_enabled = true
  local_vim.g.icons_enabled = true
  local_vim.g.ui_notifications_enabled = true -- disable notifications when toggling UI elements
  local_vim.g.diagnostics_mode = 3 -- (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
  -- local_vim.g.resession_enabled = false

  return local_vim
end
