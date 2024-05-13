local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }
}

function M.config()
  local configs = {}

  require("lualine").setup(configs)
end

return M
