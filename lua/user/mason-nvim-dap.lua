local M = {
  "jay-babu/mason-nvim-dap.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
  }
}

function M.config()
  local dap_configs = {
    ensure_installed = { "codelldb" },
    automatic_installation = true,
    handlers = {},
  }

  require("mason-nvim-dap").setup(dap_configs)
end

return M
