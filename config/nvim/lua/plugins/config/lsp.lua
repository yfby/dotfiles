--Language LSP configurations
local servers = {
  lua_ls = {
    Lua = {
      telemetry = { enable = false },
    },
  },
}

--Mason setup
require("mason").setup()
require("mason-lspconfig").setup {
  automatic_installation = true,
}

--Setup neodev docs for configuring neovim
require('neodev').setup()

local on_attach = function(_, bufnr)
  local keymap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  --Telescope
  keymap('<leader>td', require('telescope.builtin').lsp_definitions, 'lsp Goto Definition')
  keymap('<leader>tr', require('telescope.builtin').lsp_references, 'lspG oto References')
  keymap('<leader>ti', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
  keymap('<leader>tt', require('telescope.builtin').lsp_type_definitions, 'Type Definition')
  keymap('<leader>td', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
  keymap('<leader>tw', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

  -- LSP
  keymap('<leader>lh', vim.lsp.buf.hover, 'Hover Documentation')
  keymap('<leader>ls', vim.lsp.buf.signature_help, 'Signature Documentation')
  keymap('<leader>ld', vim.lsp.buf.declaration, 'Goto Declaration')

  keymap('<leader>la', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
  keymap('<leader>lr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
  keymap('<leader>ll', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'Workspace List Folders')

  keymap('<leader>ln', vim.lsp.buf.rename, 'Rename')
  keymap('<leader>la', vim.lsp.buf.code_action, 'Code Action')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}










--configure cmp
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
}
