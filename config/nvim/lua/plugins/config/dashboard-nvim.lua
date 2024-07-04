require('dashboard').setup {
  config = {
    header ={
      '              ╭━━━╮╭━━━╮╭━━╮╭━━━━╮╭━━━╮╭━━━╮╭╮',
      '              ┃╭━━╯╰╮╭╮┃╰┫┣╯┃╭╮╭╮┃┃╭━╮┃┃╭━╮┃┃┃',
      '╭━━╮╭╮╭╮╭━╮╭━╮┃╰━━╮ ┃┃┃┃ ┃┃ ╰╯┃┃╰╯┃┃ ┃┃┃╰━╯┃┃┃',
      '┃╭╮┃┃┃┃┃┃╭╯┃╭╯┃╭━━╯ ┃┃┃┃ ┃┃   ┃┃  ┃┃ ┃┃┃╭╮╭╯╰╯',
      '┃╰╯┃┃╰╯┃┃┃ ┃┃ ┃╰━━╮╭╯╰╯┃╭┫┣╮  ┃┃  ┃╰━╯┃┃┃┃╰╮╭╮',
      '┃╭━╯╰━━╯╰╯ ╰╯ ╰━━━╯╰━━━╯╰━━╯  ╰╯  ╰━━━╯╰╯╰━╯╰╯',
      '┃┃                     ／l、                  ',
      '╰╯                   （ﾟ､ ｡ ７                ',
      '                       l  ~ヽ                 ',
      '                       じしf_,)ノ             ',
    },
    shortcut = {
      {
        desc = ' Keymaps',
        group = 'DiagnosticHint',
        action = 'WhichKey',
        key = 'k',
      },
      {
        desc = ' Files',
        group = 'Label',
        action = 'NvimTreeOpen',
        key = 'f',
      },
      {
        desc = '󰝒 New File',
        group = 'DiagnosticWarn',
        action = 'ene',
        key = 'e',
      }
    },
    -- project = { enable = false},
    packages = { enable = true },
    footer = {
      "",
      "NEOVIM: " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
    }
  }
}
