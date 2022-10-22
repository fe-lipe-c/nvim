local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

npairs.setup({
	background_colour = "#2b942a",
})
