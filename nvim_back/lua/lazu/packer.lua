-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"Mofiqul/dracula.nvim",
		as = "dracula",
		config = function()
			vim.cmd("colorscheme dracula")
		end,
	})
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})
	use("hrsh7th/nvim-cmp")
	use({
		"christoomey/vim-tmux-navigator",
		lazy = false,
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})
	use({ "Djancyp/cheat-sheet" })
	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "pass show chatgpt/nvim",
				openai_params = {
					model = "gpt-3.5-turbo",
					frequency_penalty = 0,
					presence_penalty = 0,
					max_tokens = 1000,
					temperature = 0,
					top_p = 1,
					n = 1,
				},
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
	use({
		"olexsmir/gopher.nvim",
		requires = { -- dependencies
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use("numToStr/Comment.nvim")
	use({
		"rest-nvim/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rest-nvim").setup({
				-- Open request results in a horizontal split
				result_split_horizontal = false,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Encode URL before making request
				encode_url = true,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = true,
					-- show the generated curl command in case you want to launch
					-- the same request via the terminal (can be verbose)
					show_curl_command = false,
					show_http_info = true,
					show_headers = true,
					-- executables or functions for formatting response body [optional]
					-- set them to false if you want to disable them
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						end,
					},
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = ".env",
				custom_dynamic_variables = {},
				yank_dry_run = true,
			})
		end,
	})
	use({
		"kndndrj/nvim-dbee",
		requires = {
			"MunifTanjim/nui.nvim",
		},
		run = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup({
				lazy = true,
			})
		end,
	})
	use({
		"stefanlogue/hydrate.nvim",
		requires = {
			"rcarriga/nvim-notify",
		},
	})
	use("wuelnerdotexe/vim-astro")
	-- use('tpope/vim-dadbod')
	-- use('kristijanhusak/vim-dadbod-ui')
	-- use('kristijanhusak/vim-dadbod-completion')
	-- use('onsails/lspkind.nvim')
	-- use{
	--     'altermo/ultimate-autopair.nvim',
	--     event={'InsertEnter','CmdlineEnter'},
	--     branch='v0.6',
	--     config=function ()
	--         require('ultimate-autopair').setup({
	--             --Config goes here
	--         })
	--     end,
	-- }
	use("mfussenegger/nvim-dap")
	use({
		"leoluz/nvim-dap-go",
		requires = {
			"mfussenegger/nvim-dap",
		},
	})
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")
end)
