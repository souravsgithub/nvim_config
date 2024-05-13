local M = {
	"stevearc/oil.nvim",
	opts = {},
}

function M.config()
	require("oil").setup({
		float = {
			max_height = 20,
			max_width = 60,
		},
	})
	vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
end

return M
