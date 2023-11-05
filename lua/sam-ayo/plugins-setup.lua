-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- command to install missing plugins
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	print("Cannot find packer")
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	-- color scheme
	use("rafi/awesome-vim-colorschemes")
	use("embark-theme/vim")
	use("srcery-colors/srcery-vim")
	use("sainnhe/everforest")
	use("hardhackerlabs/theme-vim")

	use("christoomey/vim-tmux-navigator") -- terminal navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	use("numToStr/Comment.nvim") -- comment lines with gc

	use("nvim-tree/nvim-tree.lua") -- directory structure in neovim

	-- vim icons
	use("nvim-tree/nvim-web-devicons")
	use("ryanoasis/vim-devicons")

	use("nvim-lualine/lualine.nvim") -- status bar at the bottom

	use("matze/vim-move") -- move lines of code

	-- fuzzy finder for files
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	-- in buffer terminal

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	-- formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")

	-- tree sitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- autotags
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	use("tpope/vim-fugitive")

	use("ThePrimeagen/vim-be-good")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
