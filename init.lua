local isVsCode = vim.g.vscode
if isVsCode then
  require("sam-ayo.vscode.keymaps")
else
  require("sam-ayo.plugins-setup")
  require("sam-ayo.core.options")
  require("sam-ayo.core.keymaps")
  require("sam-ayo.core.colorscheme")
  require("sam-ayo.plugins.comment")
  require("sam-ayo.plugins.lualine")
  require("sam-ayo.plugins.nvim-tree")
  require("sam-ayo.plugins.telescope")
  require("sam-ayo.plugins.lsp.lsp")
  require("sam-ayo.plugins.lsp.null-ls")
  require("sam-ayo.plugins.autopairs")
  -- ordinary Neovim
end
