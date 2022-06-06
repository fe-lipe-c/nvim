
local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	vim.notify("Indent_Blankline not working!")
	return
end


--vim.cmd("let g:latex_to_unicode_tab = 'off'")


indent_blankline.setup {show_current_context = true,show_current_context_start = true,space_char_blankline = "-"}
