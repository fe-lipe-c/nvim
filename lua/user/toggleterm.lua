local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	vim.notify("Toggleterm not working!")
	return
end

toggleterm.setup({
	size = 15,
	direction = "horizontal",
	insert_mappings = true,
	open_mapping = [[<c-t>]],
	start_in_insert = true,
	-- on_open = fun(t: Terminal),
})
