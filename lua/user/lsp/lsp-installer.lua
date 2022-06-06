require("nvim-lsp-installer").setup { ensure_installed = { "sumneko_lua" } }
local lspconfig = require("lspconfig")

local opts = {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
	autostart = true,
}

-- tsserver --
local tsserver_opts = require("user.lsp.settings.tsserver")
tsserver_opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
lspconfig.tsserver.setup {tsserver_opts}
-- tsserver --

-- sumneko_lua --
local sumneko_opts = require("user.lsp.settings.sumneko_lua")
sumneko_opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
lspconfig.sumneko_lua.setup {sumneko_opts}
-- sumneko_lua --

-- pyright --
local pyright_opts = require("user.lsp.settings.pyright")
pyright_opts = vim.tbl_deep_extend("force", pyright_opts, opts)
lspconfig.pyright.setup {pyright_opts}
-- pyright --

local servers = { "sumneko_lua", "pyright", "tsserver"} -- "tsserver" 

for _,lsp_server in ipairs(servers) do
	lspconfig[lsp_server].setup {}
end


-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
