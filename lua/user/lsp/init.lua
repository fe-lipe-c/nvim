local status_ok, _ = pcall(require, "lspconfig") --nvim-lspconfig
if not status_ok then
	vim.notify("LSP not working!")
	return
end

--require("user.lsp.lsp-installer")
require("user.lsp.config")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
