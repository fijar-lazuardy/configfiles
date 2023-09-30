-- local dap_go = require("dap-go")
-- dap_go.setup()
--
-- vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
-- vim.keymap.set("n", "<leader>dus", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	local sidebar = widgets.sidebar(widgets.scopes)
-- 	sidebar.open()
-- end)
--
-- vim.keymap.set("n", "<leader>dgt", function()
-- 	dap_go.debug_test()
-- end)
-- vim.keymap.set("n", "<leader>dgl", function()
-- 	dap_go.debug_last()
-- end)
--
require("go").setup({
	run_in_floaterm = true,
})

-- Run gofmt + goimport on save

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})

vim.keymap.set("n", "<leader>gie", "<cmd> GoIfErr <CR>")
vim.keymap.set("n", "<leader>gtj", "<cmd> GoTagAdd json <CR>")
vim.keymap.set("n", "<leader>gtd", "<cmd> GoTagAdd db <CR>")
vim.keymap.set("n", "<leader>gcmt", "<cmd> GoCmt <CR>")
