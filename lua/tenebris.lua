-- =============================================================================
-- tenebris.nvim
-- A dark, moody colorscheme with purple and pink accents.
-- Author: Yudi Wu
-- License: MIT
-- =============================================================================

local M = {}

local defaults = {
	transparent = false,
	italic_comments = true,
	bold_keywords = true,
	on_colors = nil,
	on_highlights = nil,
}

M.config = {}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", defaults, opts or {})
end

local dark = {
	-- Backgrounds
	bg0 = "#070707", -- deepest bg (floating wins, borders)
	bg1 = "#0c0c0c", -- main editor bg
	bg2 = "#111111", -- sidebar, statusline bg
	bg3 = "#181818", -- cursorline, selection bg
	bg4 = "#202020", -- visual selection, inactive highlights

	-- Foregrounds
	fg0 = "#ebebeb", -- brightest text
	fg1 = "#c8c8c8", -- default text
	fg2 = "#787878", -- comments, subtle text
	fg3 = "#484848", -- line numbers, very muted
	fg4 = "#282828", -- invisible/decorative

	-- Light greys (keywords, functions)
	accent1 = "#d8d8d8", -- near-white grey
	accent2 = "#b0b0b0", -- medium grey
	accent3 = "#686868", -- muted grey

	-- Accent
	purple = "#ae98b8", -- muted lavender (strings, constants)

	-- Warm greys (special, markup)
	warm1 = "#a8a4a0", -- warm grey
	warm2 = "#888480", -- deeper warm grey
	warm3 = "#686460", -- dark warm grey

	-- Neutrals
	grey1 = "#606060", -- operators, punctuation
	grey2 = "#3c3c3c", -- muted operators
	grey3 = "#222222", -- borders, splits

	-- Semantic
	red = "#e07878", -- errors
	orange = "#d4956a", -- warnings
	yellow = "#c8b87a", -- hints
	green = "#88b894", -- ok/added
	cyan = "#80b8c8", -- info, links

	-- Git
	git_add = "#6a9f76",
	git_change = "#888888",
	git_delete = "#a85858",

	-- Derived (pre-blended over bg1, as in the vscode theme)
	cursor = "#c8c8c8", -- cursor block
	search = "#272429", -- search match
	search_cur = "#4e4e4e", -- current search match
	paren_fg = "#e7d7ed", -- matching bracket
	paren_bg = "#201d22",
	ref_weak = "#1c1a1d", -- LSP reference / word highlight
	ref_strong = "#28252a", -- LSP write reference
	diff_add = "#0e1810",
	diff_change = "#161616",
	diff_delete = "#1a0e0e",
	diff_text = "#202020",

	-- Rainbow brackets
	rb1 = "#b99ac8",
	rb2 = "#d5ae87",
	rb3 = "#86bdb0",
	rb4 = "#91a7d8",
	rb5 = "#cb91a4",
	rb6 = "#ced0d5",

	none = "NONE",
}

local light = {
	-- Backgrounds
	bg0 = "#e5e4e9", -- floating wins, inactive tabs
	bg1 = "#f2f2f2", -- main editor bg
	bg2 = "#ebeaee", -- sidebar, statusline bg
	bg3 = "#ebebeb", -- cursorline
	bg4 = "#d3d3d3", -- selection

	-- Foregrounds
	fg0 = "#262626",
	fg1 = "#3d3d3d",
	fg2 = "#707070",
	fg3 = "#a0a0a0",
	fg4 = "#c4c4c4",

	accent1 = "#2e2e2e",
	accent2 = "#4a4a4a",
	accent3 = "#8a8a8a",

	purple = "#7b5d8e",

	warm1 = "#58544f",
	warm2 = "#6e6a66",
	warm3 = "#8a8680",

	grey1 = "#6a6a6a",
	grey2 = "#b8b8b8",
	grey3 = "#cfcdd5",

	red = "#c04646",
	orange = "#b8682e",
	yellow = "#8a7520",
	green = "#3f7f52",
	cyan = "#2f7f96",

	git_add = "#3f7f52",
	git_change = "#6a6a6a",
	git_delete = "#a84444",

	cursor = "#ae98b8",
	search = "#ded9e1",
	search_cur = "#afafaf",
	paren_fg = "#4a2f5a",
	paren_bg = "#e6e1e8",
	ref_weak = "#eae7eb",
	ref_strong = "#e3dfe5",
	diff_add = "#e3f2e6",
	diff_change = "#e8e8e8",
	diff_delete = "#f6e1e1",
	diff_text = "#d3d3d3",

	rb1 = "#8a5fa0",
	rb2 = "#a06a2e",
	rb3 = "#2f8070",
	rb4 = "#4a6aa8",
	rb5 = "#a84a68",
	rb6 = "#6a6e78",

	none = "NONE",
}

M.palettes = { dark = dark, light = light }

-- Active palette; mutated in place so integrations holding a reference stay valid
M.colors = {}

local function apply_palette(name)
	for k in pairs(M.colors) do
		M.colors[k] = nil
	end
	for k, v in pairs(M.palettes[name]) do
		M.colors[k] = v
	end
end

local c = M.colors

-- Helper
local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

function M.load()
	local cfg = vim.tbl_deep_extend("force", defaults, M.config)

	local style = vim.o.background == "light" and "light" or "dark"
	apply_palette(style)

	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "tenebris"
	vim.o.termguicolors = true
	vim.o.background = style

	if cfg.transparent then
		c.bg0 = "NONE"
		c.bg1 = "NONE"
		c.bg2 = "NONE"
	end

	-- Terminal ANSI palette (same mapping as the vscode themes)
	local ansi = {
		c.bg0, c.red, c.green, c.yellow, c.cyan, c.purple, c.cyan, c.fg1,
		c.fg3, c.red, c.green, c.yellow, c.cyan, c.purple, c.cyan, c.fg0,
	}
	for i, color in ipairs(ansi) do
		vim.g["terminal_color_" .. (i - 1)] = color
	end

	-- =========================================================================
	-- Editor UI
	-- =========================================================================
	hi("Normal", { fg = c.fg1, bg = c.bg1 })
	hi("NormalFloat", { fg = c.fg1, bg = c.bg0 })
	hi("NormalNC", { fg = c.fg1, bg = c.bg1 })
	hi("FloatBorder", { fg = c.grey3, bg = c.bg0 })
	hi("FloatTitle", { fg = c.accent1, bg = c.bg0, bold = true })

	hi("Cursor", { fg = c.bg1, bg = c.cursor })
	hi("CursorLine", { bg = c.bg3 })
	hi("CursorColumn", { bg = c.bg3 })
	hi("CursorLineNr", { fg = c.accent2, bg = c.none })
	hi("LineNr", { fg = c.fg3, bg = c.none })
	hi("SignColumn", { fg = c.fg3, bg = c.none })

	hi("Visual", { bg = c.bg4 })
	hi("VisualNOS", { bg = c.bg4 })
	-- vscode find match colours, pre-blended over bg1
	hi("Search", { bg = c.search })
	hi("IncSearch", { bg = c.search_cur })
	hi("CurSearch", { bg = c.search_cur })
	hi("Substitute", { bg = c.search_cur })

	hi("StatusLine", { fg = c.fg2, bg = c.bg2 })
	hi("StatusLineNC", { fg = c.fg2, bg = c.bg2 })
	hi("WinBar", { fg = c.fg2, bg = c.none })
	hi("WinBarNC", { fg = c.fg3, bg = c.none })
	hi("TabLine", { fg = c.fg2, bg = c.bg0 })
	hi("TabLineFill", { fg = c.fg3, bg = c.bg0 })
	hi("TabLineSel", { fg = c.fg0, bg = c.bg1 })

	hi("Pmenu", { fg = c.fg1, bg = c.bg0 })
	hi("PmenuSel", { fg = c.fg0, bg = c.bg4 })
	hi("PmenuSbar", { bg = c.bg2 })
	hi("PmenuThumb", { bg = c.accent3 })

	hi("VertSplit", { fg = c.grey3, bg = c.none })
	hi("WinSeparator", { fg = c.grey3, bg = c.none })
	hi("EndOfBuffer", { fg = c.fg4 })
	hi("NonText", { fg = c.fg4 })
	hi("SpecialKey", { fg = c.fg4 })
	hi("Whitespace", { fg = c.fg4 })
	hi("Conceal", { fg = c.fg3 })

	hi("Folded", { fg = c.fg3, bg = c.bg3 })
	hi("FoldColumn", { fg = c.fg3, bg = c.none })

	hi("MatchParen", { fg = c.paren_fg, bg = c.paren_bg })

	hi("Directory", { fg = c.accent1 })
	hi("Title", { fg = c.accent1, bold = true })
	hi("Question", { fg = c.cyan })
	hi("MoreMsg", { fg = c.cyan })
	hi("ModeMsg", { fg = c.fg2 })
	hi("ErrorMsg", { fg = c.red })
	hi("WarningMsg", { fg = c.orange })

	hi("SpellBad", { undercurl = true, sp = c.red })
	hi("SpellCap", { undercurl = true, sp = c.orange })
	hi("SpellRare", { undercurl = true, sp = c.accent2 })
	hi("SpellLocal", { undercurl = true, sp = c.cyan })

	hi("QuickFixLine", { bg = c.bg4 })
	hi("qfLineNr", { fg = c.accent2 })

	-- =========================================================================
	-- Syntax
	-- =========================================================================
	hi("Comment", { fg = c.fg2, italic = cfg.italic_comments })
	hi("SpecialComment", { fg = c.fg2, italic = cfg.italic_comments })

	hi("Constant", { fg = c.purple })
	hi("String", { fg = c.purple })
	hi("Character", { fg = c.purple })
	hi("Number", { fg = c.warm2 })
	hi("Boolean", { fg = c.accent1, bold = true })
	hi("Float", { fg = c.warm2 })

	hi("Identifier", { fg = c.fg1 })
	hi("Function", { fg = c.fg0 })

	hi("Statement", { fg = c.fg0, bold = cfg.bold_keywords })
	hi("Conditional", { fg = c.fg0, bold = cfg.bold_keywords })
	hi("Repeat", { fg = c.fg0, bold = cfg.bold_keywords })
	hi("Label", { fg = c.accent2 })
	hi("Operator", { fg = c.grey1 })
	hi("Keyword", { fg = c.fg0, bold = cfg.bold_keywords })
	hi("Exception", { fg = c.fg0, bold = cfg.bold_keywords })

	hi("PreProc", { fg = c.warm2 })
	hi("Include", { fg = c.accent2 })
	hi("Define", { fg = c.accent2 })
	hi("Macro", { fg = c.warm2 })
	hi("PreCondit", { fg = c.accent2 })

	hi("Type", { fg = c.accent2 })
	hi("StorageClass", { fg = c.fg0 })
	hi("Structure", { fg = c.accent2 })
	hi("Typedef", { fg = c.accent2 })

	hi("Special", { fg = c.warm2 })
	hi("SpecialChar", { fg = c.warm2 })
	hi("Tag", { fg = c.accent1 })
	hi("Delimiter", { fg = c.grey1 })

	hi("Underlined", { fg = c.cyan, underline = true })
	hi("Bold", { bold = true })
	hi("Italic", { italic = true })
	hi("Ignore", { fg = c.fg4 })
	hi("Error", { fg = c.red, bold = true })
	hi("Todo", { fg = c.accent2, bg = c.none, bold = true })

	-- =========================================================================
	-- Treesitter (every group from :h treesitter-highlight-groups)
	-- =========================================================================
	local kw = { fg = c.fg0, bold = cfg.bold_keywords }
	local function kwhi(group, extra)
		hi(group, vim.tbl_extend("force", kw, extra or {}))
	end

	-- Variables
	hi("@variable", { fg = c.fg1 })
	hi("@variable.builtin", { fg = c.accent2, italic = true })
	hi("@variable.parameter", { fg = c.fg1, italic = true })
	hi("@variable.parameter.builtin", { fg = c.accent2, italic = true })
	hi("@variable.member", { fg = c.fg1 })

	-- Constants
	hi("@constant", { fg = c.purple })
	hi("@constant.builtin", { fg = c.purple, bold = true })
	hi("@constant.macro", { fg = c.purple })

	-- Modules and labels
	hi("@module", { fg = c.accent2 })
	hi("@module.builtin", { fg = c.accent2 })
	hi("@label", { fg = c.accent2 })

	-- Strings and characters
	hi("@string", { fg = c.purple })
	hi("@string.documentation", { fg = c.purple })
	hi("@string.regexp", { fg = c.purple, italic = true })
	hi("@string.escape", { fg = c.purple })
	hi("@string.special", { fg = c.purple })
	hi("@string.special.symbol", { fg = c.purple })
	hi("@string.special.path", { fg = c.purple })
	hi("@string.special.url", { fg = c.cyan, underline = true })
	hi("@character", { fg = c.purple })
	hi("@character.special", { fg = c.purple })

	-- Literals
	hi("@boolean", { fg = c.accent1, bold = true })
	hi("@number", { fg = c.warm2 })
	hi("@number.float", { fg = c.warm2 })

	-- Types
	hi("@type", { fg = c.accent2 })
	hi("@type.builtin", { fg = c.accent2 })
	hi("@type.definition", { fg = c.accent2 })
	hi("@type.qualifier", { fg = c.accent1 })

	-- Attributes and properties
	hi("@attribute", { fg = c.warm2 })
	hi("@attribute.builtin", { fg = c.warm2 })
	hi("@property", { fg = c.fg1 })

	-- Functions
	hi("@function", { fg = c.fg0 })
	hi("@function.builtin", { fg = c.accent2 })
	hi("@function.call", { fg = c.fg0 })
	hi("@function.macro", { fg = c.warm2 })
	hi("@function.method", { fg = c.fg0 })
	hi("@function.method.call", { fg = c.fg0 })
	hi("@constructor", { fg = c.accent2 })
	hi("@operator", { fg = c.grey1 })

	-- Keywords
	kwhi("@keyword")
	kwhi("@keyword.coroutine")
	kwhi("@keyword.function")
	kwhi("@keyword.operator") -- word-like operators (and, or, not, sizeof)
	kwhi("@keyword.type") -- struct, enum, class
	kwhi("@keyword.repeat")
	kwhi("@keyword.return")
	kwhi("@keyword.debug")
	kwhi("@keyword.exception")
	kwhi("@keyword.conditional")
	hi("@keyword.conditional.ternary", { fg = c.grey1 })
	hi("@keyword.modifier", { fg = c.accent1 })
	hi("@keyword.import", { fg = c.accent2 })
	hi("@keyword.directive", { fg = c.accent2 })
	hi("@keyword.directive.define", { fg = c.accent2 })

	-- Punctuation
	hi("@punctuation.delimiter", { fg = c.grey1 })
	hi("@punctuation.bracket", { fg = c.grey1 })
	hi("@punctuation.special", { fg = c.warm2 })

	-- Comments
	hi("@comment", { fg = c.fg2, italic = cfg.italic_comments })
	hi("@comment.documentation", { fg = c.fg2, italic = cfg.italic_comments })
	hi("@comment.error", { fg = c.bg1, bg = c.red, bold = true })
	hi("@comment.warning", { fg = c.bg1, bg = c.orange, bold = true })
	hi("@comment.todo", { fg = c.accent2, bold = true })
	hi("@comment.note", { fg = c.bg1, bg = c.cyan, bold = true })

	-- Markup
	hi("@markup.strong", { fg = c.fg0, bold = true })
	hi("@markup.italic", { fg = c.fg1, italic = true })
	hi("@markup.strikethrough", { fg = c.fg2, strikethrough = true })
	hi("@markup.underline", { underline = true })
	hi("@markup.heading", { fg = c.accent1, bold = true })
	for i = 1, 6 do
		hi("@markup.heading." .. i, { fg = c.accent1, bold = true })
	end
	hi("@markup.quote", { fg = c.fg2, italic = true })
	hi("@markup.math", { fg = c.warm2 })
	hi("@markup.link", { fg = c.cyan, underline = true })
	hi("@markup.link.label", { fg = c.cyan })
	hi("@markup.link.url", { fg = c.cyan, underline = true })
	hi("@markup.raw", { fg = c.purple })
	hi("@markup.raw.block", { fg = c.purple })
	hi("@markup.list", { fg = c.accent2 })
	hi("@markup.list.checked", { fg = c.accent2 })
	hi("@markup.list.unchecked", { fg = c.fg3 })

	-- Diff
	hi("@diff.plus", { fg = c.git_add })
	hi("@diff.minus", { fg = c.git_delete })
	hi("@diff.delta", { fg = c.git_change })

	-- Tags
	hi("@tag", { fg = c.accent1 })
	hi("@tag.builtin", { fg = c.accent1 })
	hi("@tag.attribute", { fg = c.warm1 })
	hi("@tag.delimiter", { fg = c.accent1 })

	-- =========================================================================
	-- LSP
	-- =========================================================================
	hi("DiagnosticError", { fg = c.red })
	hi("DiagnosticWarn", { fg = c.orange })
	hi("DiagnosticInfo", { fg = c.cyan })
	hi("DiagnosticHint", { fg = c.accent2 })
	hi("DiagnosticOk", { fg = c.green })

	hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
	hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.orange })
	hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.cyan })
	hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.accent2 })

	hi("DiagnosticVirtualTextError", { fg = c.red, bg = c.none, italic = true })
	hi("DiagnosticVirtualTextWarn", { fg = c.orange, bg = c.none, italic = true })
	hi("DiagnosticVirtualTextInfo", { fg = c.cyan, bg = c.none, italic = true })
	hi("DiagnosticVirtualTextHint", { fg = c.accent2, bg = c.none, italic = true })

	hi("DiagnosticSignError", { fg = c.red })
	hi("DiagnosticSignWarn", { fg = c.orange })
	hi("DiagnosticSignInfo", { fg = c.cyan })
	hi("DiagnosticSignHint", { fg = c.accent2 })

	hi("LspReferenceText", { bg = c.ref_weak })
	hi("LspReferenceRead", { bg = c.ref_weak })
	hi("LspReferenceWrite", { bg = c.ref_strong })
	hi("LspSignatureActiveParameter", { fg = c.warm1, bold = true })
	hi("LspCodeLens", { fg = c.fg3 })
	hi("LspInlayHint", { fg = c.fg3, bg = c.bg2 })

	-- =========================================================================
	-- Git
	-- =========================================================================
	hi("DiffAdd", { fg = c.git_add, bg = c.diff_add })
	hi("DiffChange", { fg = c.git_change, bg = c.diff_change })
	hi("DiffDelete", { fg = c.git_delete, bg = c.diff_delete })
	hi("DiffText", { fg = c.fg1, bg = c.diff_text })

	hi("GitSignsAdd", { fg = c.git_add })
	hi("GitSignsChange", { fg = c.git_change })
	hi("GitSignsDelete", { fg = c.git_delete })

	-- =========================================================================
	-- Plugins (lua/tenebris/plugins.lua)
	-- =========================================================================
	require("tenebris.plugins")(hi, c, cfg)

	if type(cfg.on_colors) == "function" then
		cfg.on_colors(c)
	end

	if type(cfg.on_highlights) == "function" then
		local overrides = {}
		cfg.on_highlights(overrides, c)
		for group, opts in pairs(overrides) do
			hi(group, opts)
		end
	end
end

-- Re-apply the theme when 'background' is toggled while tenebris is active
vim.api.nvim_create_autocmd("OptionSet", {
	group = vim.api.nvim_create_augroup("tenebris_background", { clear = true }),
	pattern = "background",
	callback = function()
		if vim.g.colors_name == "tenebris" then
			vim.schedule(M.load)
		end
	end,
})

-- Expose palette for integrations (lualine theme, etc.)
function M.get_colors()
	return c
end

return M
