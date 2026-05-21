local c = require("tenebris").get_colors()
local cfg = require("tenebris").config

local bg_c = c.bg2
if cfg.transparent then
	bg_c = "NONE"
end

return {
	normal = {
		a = { bg = c.purple1, fg = c.bg1, gui = "bold" },
		b = { bg = c.bg2,     fg = c.purple1 },
		c = { bg = bg_c,      fg = c.fg2 },
	},
	insert = {
		a = { bg = c.pink1,   fg = c.bg1, gui = "bold" },
		b = { bg = c.bg2,     fg = c.pink1 },
		c = { bg = bg_c,      fg = c.fg2 },
	},
	visual = {
		a = { bg = c.purple2, fg = c.bg1, gui = "bold" },
		b = { bg = c.bg2,     fg = c.purple2 },
		c = { bg = bg_c,      fg = c.fg2 },
	},
	replace = {
		a = { bg = c.pink2,   fg = c.bg1, gui = "bold" },
		b = { bg = c.bg2,     fg = c.pink2 },
		c = { bg = bg_c,      fg = c.fg2 },
	},
	command = {
		a = { bg = c.pink2,   fg = c.bg1, gui = "bold" },
		b = { bg = c.bg2,     fg = c.pink2 },
		c = { bg = bg_c,      fg = c.fg2 },
	},
	inactive = {
		a = { bg = bg_c,      fg = c.fg3, gui = "bold" },
		b = { bg = bg_c,      fg = c.fg3 },
		c = { bg = bg_c,      fg = c.fg3 },
	},
}
