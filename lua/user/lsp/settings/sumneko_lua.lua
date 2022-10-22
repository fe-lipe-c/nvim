local opts = {
	settings = {
		Lua = {
			diagnostics = {
				enable = true,
				globals = { "vim", "nvim", "packer_plugins" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				--[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				--[vim.fn.stdpath("config") .. "/lua"] = true,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

local lua_dev_loaded, lua_dev = pcall(require, "neodev")
if not lua_dev_loaded then
	return opts
end

local dev_opts = {
	library = {
		vimruntime = true, -- runtime path
		types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
		-- plugins = true, -- installed opt or start plugins in packpath
		-- you can also specify the list of plugins to make available as a workspace library
		plugins = { "plenary.nvim" },
	},
	lspconfig = opts,
}

return lua_dev.setup(dev_opts)
