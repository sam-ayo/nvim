---@diagnostic disable: param-type-mismatch
local g = vim.g

-- Everforest configurations
g.everforest_background = "soft"
g.everforest_better_performance = 1
g.everforest_enable_italic = 1
g.everforest_diagnostic_text_highlight = 1

local theme = "deus"
local command = string.format("colorscheme %s", theme)
local status = pcall(vim.cmd, command)
if not status then
	local error = string.format("Cannot find %s", theme)
	print(error)
	return
end
