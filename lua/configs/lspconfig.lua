require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local nvlsp = require "nvchad.configs.lspconfig"

lspconfig.clangd.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  cmd = { "clangd", "--offset-encoding=utf-16" },
})

lspconfig.ltex.setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    root_dir = util.root_pattern("main.tex")
})


lspconfig.omnisharp.setup({
  -- configure omnisharp to fix the semantic tokens bug (really annoying)
  omnisharp = function(_, _)
    require("lazyvim.util").on_attach(function(client, _)
      if client.name == "omnisharp" then
        ---@type string[]
        local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
        for i, v in ipairs(tokenModifiers) do
          tokenModifiers[i] = v:gsub(" ", "_")
        end
        ---@type string[]
        local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
        for i, v in ipairs(tokenTypes) do
          tokenTypes[i] = v:gsub(" ", "_")
        end
      end
    end)
    return false
  end,
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "/home/koen/.local/share/nvim/mason/bin/omnisharp" }
})


-- Workaround for rust-analyzer diagnostic crash (code -32802)
for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
  local default_diagnostic_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, result, context, config)
    if err ~= nil and err.code == -32802 then
      return
    end
    return default_diagnostic_handler(err, result, context, config)
  end
end

local servers = { "html", "cssls", "ts_ls", "pyright", "texlab" }
vim.lsp.enable(servers)
