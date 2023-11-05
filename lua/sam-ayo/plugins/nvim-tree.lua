local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	print("Cannot find nvim-tree")
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup()
