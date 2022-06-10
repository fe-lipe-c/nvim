local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- local hide_in_width = function()
-- 	return vim.fn.winwidth(0) > 80
-- end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	colored = false,
	update_in_insert = false,
}

local diff = {
	"diff",
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	-- cond = hide_in_width
	diff_color = { added = { fg = "#76ff7a" }, modified = { fg = "#ff8c00" }, removed = { fg = "#d7141e" } },
}
local mode = {
	"mode",
	fmt = function(str)
		return str
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	color = { fg = "#bcff14" },
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
	color = { gui = "bold" },
}

local location = {
	"location",
	padding = 0,
}
local filename = {
	"filename",
	--file_status = true,
	path = 1,
	color = {},
}

local python_env = {
	function()
		if vim.bo.filetype == "python" then
			local venv = os.getenv("CONDA_DEFAULT_ENV")
			if venv then
				return string.format("[%s]", venv)
			end
			venv = os, getenv("VIRTUAL_ENV")
			if venv then
				return string.format("[%s]", venv)
			end
			return ""
		end
		return ""
	end,
	color = { fg = "#bcff14" },
}

local treesitter = {
	function()
		local b = vim.api.nvim_get_current_buf()
		if next(vim.treesitter.highlighter.active[b]) then
			return ""
		end
		return ""
	end,
	color = { fg = "green" },
}

local lsp = {
	function(msg)
		msg = msg or "LS Inactive"
		local buf_clients = vim.lsp.buf_get_clients()
		if next(buf_clients) == nil then
			-- TODO: clean up this if statement
			if type(msg) == "boolean" or #msg == 0 then
				return "LS Inactive"
			end
			return msg
		end
		local buf_ft = vim.bo.filetype
		local buf_client_names = {}
		-- add client
		for _, client in pairs(buf_clients) do
			if client.name ~= "null-ls" then
				table.insert(buf_client_names, client.name)
			end
		end
		return table.concat(buf_client_names, ", ")
	end,
	color = { fg = "green", gui = "bold" },
}
-- 		-- add formatter
-- 		local formatters = require("lvim.lsp.null-ls.formatters")
-- 		local supported_formatters = formatters.list_registered(buf_ft)
-- 		vim.list_extend(buf_client_names, supported_formatters)
-- 		-- add linter
-- 		local linters = require("lvim.lsp.null-ls.linters")
-- 		local supported_linters = linters.list_registered(buf_ft)
-- 		vim.list_extend(buf_client_names, supported_linters)
--
-- 		return "[" .. table.concat(buf_client_names, ", ") .. "]"
-- 	end,
-- }

-- cool function for progress
local progress2 = { "progress", color = {} }
-- local progress = function()
-- 	local current_line = vim.fn.line(".")
-- 	local total_lines = vim.fn.line("$")
-- 	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
-- 	local line_ratio = current_line / total_lines
-- 	local index = math.ceil(line_ratio * #chars)
-- 	return chars[index]
-- end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "ayu_dark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		--disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diff },
		lualine_c = { filename },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { treesitter, filetype, python_env },
		lualine_y = { lsp, diagnostics },
		lualine_z = { progress2 },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
