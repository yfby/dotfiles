-- File Explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    side = "right",
    width = 25,
    cursorline = true,
    number = false,
  },
  renderer = {
    group_empty = true,
    add_trailing = true,
    indent_markers = {
      enable = true
    },
  },
  filters = {
    dotfiles = false,
  },
  -- actions = {
  --   open_file = {
  --     quit_on_open = true,
  --   },
  -- },
})

