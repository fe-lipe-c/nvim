-- [slate, evening, lipcs]

local colorscheme = "lipcs"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("Colorscheme " .. colorscheme .. " not found! Reset to 'evening'")
	vim.cmd("colorscheme evening")
	return
end
