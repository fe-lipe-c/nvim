local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

npairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'", "$"},
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
})

local Rule = require('nvim-autopairs.rule')

npairs.add_rule(Rule("$$","$$","tex"))
npairs.add_rule(Rule("$$","$$","markdown"))
npairs.add_rule(Rule("$$","$$","vimwiki"))
npairs.add_rule(Rule("$","$","vimwiki"))

-- you can use some built-in conditions

-- local cond = require('nvim-autopairs.conds')
-- print(vim.inspect(cond))
--
-- npairs.add_rules({
--   Rule("$", "$",{"tex", "latex"})
--     -- don't add a pair if the next character is %
--     :with_pair(cond.not_after_regex("%%"))
--     -- don't add a pair if  the previous character is xxx
--     :with_pair(cond.not_before_regex("xxx", 3))
--     -- don't move right when repeat character
--     :with_move(cond.none())
--     -- don't delete if the next character is xx
--     :with_del(cond.not_after_regex("xx"))
--     -- disable adding a newline when you press <cr>
--     :with_cr(cond.none())
--   },
--   -- disable for .vim files, but it work for another filetypes
--   Rule("a","a","-vim")
-- )
--
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
