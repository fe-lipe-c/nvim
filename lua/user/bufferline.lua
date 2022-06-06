
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	vim.notify("Plugin Bufferline not working!")
	return
end

bufferline.setup{
	options = {
		mode = "buffers",
		diagnostics = true,
	},
}
