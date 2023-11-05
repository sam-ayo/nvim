local gitsigns_setup, gitsigns = pcall(require, "gitsigns")

if not gitsigns_setup then
	print("Cannot find gitsigns")
	return
end

gitsigns.setup()
