local M = {
  "williamboman/mason-lspconfig.nvim",
}

function M.config()
  local servers = { "bashls", "clangd", "jsonls", "tsserver", "lua_ls", "marksman", "eslint" }
  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M
