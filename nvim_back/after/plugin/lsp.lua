local lsp = require("lsp-zero").preset({
	manage_nvim_cmp = {
		set_sources = "recommended",
	},
})

lsp.setup()
lsp.nvim_workspace()

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<leader>od", function()
		vim.diagnostic.open_float()
	end, opts)
end)
require("lspconfig").pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				flake8 = {
					enabled = true,
					maxLineLength = 120,
					indentSize = 4,
				},
				black = {
					enabled = true,
					line_length = 120,
				},
			},
		},
	},
})

local util = require("lspconfig/util")
require("lspconfig").gopls.setup({
	cmd = { "gopls", "serve" },
	on_attach = on_attach,
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			completeUnimported = true,
			usePlaceholders = true,
		},
	},
	dap_debug = true,
	dap_debug_gui = true,
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local lspkind = require('lspkind')
-- cmp.setup({
--     window = {
--         completion = cmp.config.window.bordered(),
--         documentation = cmp.config.window.bordered(),
--     },
--     sources = {
--         { name = "vim-dadbod-completion" },
--     },
--     formatting = {
--         format = function(entry, vim_item)
--             vim_item.menu = ({
--                 rg = '[Rg]',
--                 buffer = '[Buffer]',
--                 nvim_lsp = '[LSP]',
--                 vsnip = '[Snippet]',
--                 tags = '[Tag]',
--                 path = '[Path]',
--                 orgmode = '[Org]',
--                 ['vim-dadbod-completion'] = '[DB]',
--             })[entry.source.name]
--             return vim_item
--         end,
--     }
-- })
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
	end,
})
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").html.setup({
	capabilities = capabilities,
})

require("lspconfig").lua_ls.setup({})
local root_pattern = require("lspconfig.util").root_pattern
require("lspconfig").astro.setup({
	capabilities = capabilities,
	root_dir = root_pattern("package.json", "tsconfig.json", "jsonconfig.json", ".git"),
})