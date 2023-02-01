local pid = vim.fn.getpid()
--
local omnisharp_bin = "/path/to/omnisharp-repo/run"
--
return {
 	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
}

-- Mono
-- local omnisharp_bin = "mono /home/felipe/.local/share/nvim/lsp_servers/omnisharp/omnisharp"
--
-- -- Roslyn
--   -- local omnisharp_bin = "/home/linux/.local/omnisharp_roslyn/run"
--   -- https://neovim.discourse.group/t/setting-up-omnisharp-via-nvim-lspconfig-and-nvim-lspinstall/531/2 
--
-- local pid = vim.fn.getpid()
-- local util = require 'lspconfig/util'
--
-- return {
--     -- https://github.com/williamboman/nvim-lsp-installer/issues/479#issuecomment-1128840405
--     use_mono = true,
--
--     cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
--   ...
-- }
