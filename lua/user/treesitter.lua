local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	ensure_installed = { "python", "lua", "javascript", "markdown" },                  -- "all", "maintained" or list of languages
	sync_install = false,															-- install languages synchronously
	ignore_install = { "" }, 													-- list of parsers to ignore installing
	autopairs = { enable = true },
	highlight = {
		enable = true,
		disable = { "" }, 															-- list of languages that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		colors = {
          "#ff53b9",
          "#00ff00",
          "#ffffff",
          "#e8ff14",
          "#54f2cb",
          "#ed456b",
          "#6ce58f",
        },
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}
