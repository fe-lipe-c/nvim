local pid = vim.fn.getpid()

local omnisharp_bin = "/path/to/omnisharp-repo/run"

return {
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
}
