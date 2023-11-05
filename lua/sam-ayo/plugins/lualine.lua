local setup, lualine = pcall(require, "lualine")
if not setup then
	print("Cannot find lualine")
	return
end

lualine.setup()
