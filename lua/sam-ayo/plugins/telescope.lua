local setup, telescope = pcall(require, "telescope")
if not setup then
	print("Cannot find telescope")
	return
end

local builtin = require('telescope.builtin')

vim.keymap.set("n", "<C-p>", builtin.current_buffer_fuzzy_find, {}) 

telescope.load_extension("fzf")
