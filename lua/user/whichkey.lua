local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

whichkey.setup({
	window = { border = "single" },
})

local opts = { noremap = true, silent = true, mode = "n" } --, {noremap = true, silent = true , mode = "v"}}

local mappings = {
	["<leader>"] = {
		f = {
			name = "Files", -- Manage Files
			f = { "<cmd>Telescope find_files path_display={'truncate'}<CR>", "Find File" },
			o = { "<cmd>Telescope oldfiles path_display={'truncate'}<CR>", "Recent Files" },
			g = { "<cmd>Telescope live_grep path_display={'truncate'}<CR>", "Live Grep" },
		},
		b = {
			name = "Buffers", -- Manage Buffers
			l = { "<cmd>Telescope buffers path_display={'truncate'}<CR>", "Buffer List" },
			k = { "<cmd>bw<CR>", "Kill Buffer" },
		},
		j = {
			name = "Jupyter", -- Jupyter Notebook
			i = { ":MagmaInit<CR>", "Start Kernel" },
			l = { "<cmd>MagmaEvaluateLine<CR>", "Run Line" },
			d = { "<cmd>MagmaDelete<CR>", "Delete Cell" },
			r = { "<cmd>MagmaReevaluateCell<CR>", "ReRun Cell" },
			x = { "<cmd>MagmaInterrupt<CR>", "Interrupt Kernel" },
			z = { "<cmd>MagmaRestart<CR>", "Restart Kernel" },
			s = { "<cmd>MagmaSave<CR>", "Save" },
			q = { "<cmd>MagmaLoad<CR>", "Load" },
			o = { "<cmd>MagmaShowOutput<CR>", "Show Output" },
			e = {"<cmd>noautocmd MagmaEnterOutput<CR>","Enter Output"},
			a = {"<cmd>lua require'swenv.api'.pick_venv()<CR>","Enviroments"}
		},
		--m = { name = "Key Bindings",																										-- Key Bindings
		--r = { "<cmd>WhichKey \"<CR>", "\" Registers" },
		--v = { "<cmd>v<CR>", "Visual Mode" },
		--z = { "<cmd>z<CR>", "z" },
		--g = { "<cmd>g<CR>", "g" },
		--},
		-- h = {
		-- 	name = "Hop To", -- Hop Bindings
		-- 	w = { "<cmd>HopWord<CR>", "Word" },
		-- 	l = { "<cmd>HopLine<CR>", "Line" },
		-- 	c = { "<cmd>HopChar1<CR>", "Character" },
		-- 	k = { "<cmd>HopChar2<CR>", "Character w/ a bigram" },
		-- },
		h = { "<cmd>HopWord<CR>", "Hop to Word" }, -- Hop Bindings
		p = { "<cmd>HopChar1<CR>", "Hop to Character" }, -- Hop Bindings
		k = { "<cmd>HopChar2<CR>", "Hop to 2Character" }, -- Hop Bindings
		-- d = {
		-- 	name = "Definition", -- Definition Bindings
		-- 	d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition" },
		-- 	i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation" },
		-- 	c = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close Windows" },
		-- 	r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "Reference" },
		d = {
			name = "Dap", -- Dap Bindings
			b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
			e = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
			i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
			v = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
			o = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
			r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "REPL" },
			l = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
			u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
			-- u = { "<cmd>lua require'dapui'.open()<cr>", "UI" },
			t = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
			m = { "<cmd>lua require'dap-python'.test_method()<cr>", "Test Method" },
			c = { "<cmd>lua require'dap-python'.test_class()<cr>", "Test Class" },
		},
		q = {
			name = "Diagnostics", -- Diagnostics Bindings
			d = { ":Trouble document_diagnostics<cr>", "Document Diagnostics" },
			w = { ":Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
			c = { ":TroubleClose<cr>", "Close Diagnostics" },
		},
		g = {
			name = "GitSigns", -- Gitsigns Bindings
			h = { ":Gitsigns prev_hunk<cr>", "Prev Hunk" },
			p = { ":Gitsigns preview_hunk<cr>", "Preview Hunk" },
			b = { ":Gitsigns blame_line<cr>", "Blame Line" },
		},
		-- r = { "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", "Format" },
		c = { "<cmd>Calendar<cr>", "Calendar" },
		m = { "<cmd>MarkdownPreview<cr>", "Markdown Preview" },
	},
}

whichkey.register(mappings, opts)

local opts = { noremap = true, silent = true, mode = "v" } --, {noremap = true, silent = true , mode = "v"}}

local mappings = {
	["<leader>"] = {
		j = {
			name = "Jupyter", -- Jupyter Notebook
			r = { ":<C-u>MagmaEvaluateVisual<CR>", "Run Selection" },
		},
		d = {
			name = "Dap", -- 
			s = { "<cmd>lua require'dap-python'.debug_selection()<cr>", "Debug Selection" },
		},
		g = {
			name = "GitSigns", -- Gitsigns Bindings
			s = { ":Gitsigns stage_hunk<cr>", "Stage Hunk" },
			u = { ":Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
		},
	},
}

whichkey.register(mappings, opts)
