require("ibl").setup {
  exclude = {
    filetypes = {
      "help",
      "terminal",
      "dashboard",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
    }
  },
  scope = {
    enabled = false
  }
}

