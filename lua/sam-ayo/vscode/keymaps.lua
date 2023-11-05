local vscode_setup, vscode = pcall(require, "vscode-neovim")

local keymap = vim.keymap
local opt = vim.opt

if not vscode_setup then
  print("Cannot find vscode-neovim")
  return
end

opt.clipboard:append("unnamedplus")

-- Use another register for deleting
keymap.set("n", "dd", '"_dd')
keymap.set("n", "D", '"_D')

-- Move up and down
keymap.set("n", "<C-[>", "<C-u>zz")
keymap.set("n", "<C-]>", "<C-d>zz")
