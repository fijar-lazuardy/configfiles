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
end)
