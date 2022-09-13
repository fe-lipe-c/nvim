-- :help options

local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to acess the system clipboard
	completeopt = { "menuone", "noselect" },
	cursorline = true, -- highlight the current line
	--list= true,
	--foldmethod = "expr",
	number = true, -- set numbered lines
	-- expandtab = false,														-- convert tabs to spaces
	relativenumber = true, -- set relative numbered lines
	scrolloff = 18, -- centers the screen
	sidescrolloff = 8, -- centers the screen
	shiftwidth = 2,
	showtabline = 2, -- always show tabs
	signcolumn = "yes", -- always show the sign column
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go the right of current window
	tabstop = 2, -- inserts 2 spaces for a tab
	termguicolors = true, -- set term gui colors
	timeoutlen = 100,
	wrap = true, -- display lines as one long line
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

--vim.opt.listchars:append("eol:↴")
--vim.opt.listchars:append("space:⋅")

-- vim script
vim.cmd([[set iskeyword+=-]]) -- characters connected by "-" are treated as one word

-- Plugins Setups --
require("colorizer").setup()
vim.cmd("let g:vimwiki_list = [{'auto_diary_index':1}]")
vim.cmd("let g:magma_automatically_open_output = v:false")
vim.notify = require("notify")

local id = vim.api.nvim_create_augroup("highlight_yank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		require("vim.highlight").on_yank({ timeout = 400 })
	end,
	group = id,
})
