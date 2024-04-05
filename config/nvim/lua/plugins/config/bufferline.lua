--File Tabs
require("bufferline").setup{
  options = {
    --separator_style = "slope",--"slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
    --enforce_regular_tabs = false | true,
    --always_show_bufferline = false,
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_tab_indicators = true,

    get_element_icon = function()
      local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(vim.filetype, { default = false })
      return icon, hl
    end,

    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },

    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'underline',
    },
  }
}
