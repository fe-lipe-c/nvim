require("nvim-lsp-installer").setup({ ensure_installed = { "lua_ls" } })
local lspconfig = require("lspconfig")

local opts = {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
	autostart = true,
}

-- tsserver --
local tsserver_opts = require("user.lsp.settings.tsserver")
tsserver_opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
lspconfig.tsserver.setup({ tsserver_opts })
-- tsserver --

-- sumneko_lua --
local sumneko_opts = require("user.lsp.settings.lua_ls")
sumneko_opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
lspconfig.sumneko_lua.setup({ sumneko_opts })
-- sumneko_lua --

-- pyright --
local pyright_opts = require("user.lsp.settings.pyright")
pyright_opts = vim.tbl_deep_extend("force", pyright_opts, opts)
lspconfig.pyright.setup({ pyright_opts })
-- pyright --

-- -- ltex-ls --
-- local ltex_opts = require("user.lsp.settings.ltex")
-- ltex_opts = vim.tbl_deep_extend("force", ltex_opts, opts)
-- lspconfig.ltex.setup({ ltex_opts })
-- -- ltex-ls --
--
--
-- marksman --
local marksman_opts = require("user.lsp.settings.marksman")
marksman_opts = vim.tbl_deep_extend("force", marksman_opts, opts)
lspconfig.marksman.setup({ marksman_opts })
-- marksman --

local servers = { "lua_ls", "pyright", "tsserver", "marksman" }

for _, lsp_server in ipairs(servers) do
	lspconfig[lsp_server].setup({})
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
