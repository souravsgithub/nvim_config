local M = {
  "SmiteshP/nvim-navic",
}

function M.config()
  local navic = require("nvim-navic")
  local icons = require("user.icons")

  navic.setup {
    icons = icons.kind,
    lsp = {
      auto_attach = true
    },
    highlight = true,
    click = true,
    separator = " " .. icons.ui.ChevronRight .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  }
end

return M
