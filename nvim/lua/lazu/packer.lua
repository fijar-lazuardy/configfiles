-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use ({
	    'Mofiqul/dracula.nvim',
	    as = 'dracula',
	    config = function()
		    vim.cmd('colorscheme dracula')
	    end
    })
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		{'neovim/nvim-lspconfig'},             -- Required
		{                                      -- Optional
		    'williamboman/mason.nvim',
		    run = function()
			    pcall(vim.cmd, 'MasonUpdate')
		    end,
	    },
	        {'williamboman/mason-lspconfig.nvim'}, -- Optional

	        -- Autocompletion
	        {'hrsh7th/nvim-cmp'},     -- Required
	        {'hrsh7th/cmp-nvim-lsp'}, -- Required
	        {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
    use('hrsh7th/nvim-cmp')
    use {
        'christoomey/vim-tmux-navigator',
        lazy=false
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use {"Djancyp/cheat-sheet"}
    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup({
                api_key_cmd = "pass show chatgpt/nvim",
            })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })
    use {
        "olexsmir/gopher.nvim",
        requires = { -- dependencies
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
end)
