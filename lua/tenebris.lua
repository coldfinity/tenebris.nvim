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

M.colors = {
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

	none = "NONE",
}

local c = M.colors

-- Helper
local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

function M.load()
	local cfg = vim.tbl_deep_extend("force", defaults, M.config)

	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "tenebris"
	vim.o.termguicolors = true

	if cfg.transparent then
		c.bg0 = "NONE"
		c.bg1 = "NONE"
		c.bg2 = "NONE"
	end

	-- =========================================================================
	-- Editor UI
	-- =========================================================================
	hi("Normal", { fg = c.fg1, bg = c.bg1 })
	hi("NormalFloat", { fg = c.fg1, bg = c.bg0 })
	hi("NormalNC", { fg = c.fg2, bg = c.bg1 })
	hi("FloatBorder", { fg = c.grey3, bg = c.bg0 })
	hi("FloatTitle", { fg = c.accent1, bg = c.bg0, bold = true })

	hi("Cursor", { fg = c.bg1, bg = c.fg1 })
	hi("CursorLine", { bg = c.bg3 })
	hi("CursorColumn", { bg = c.bg3 })
	hi("CursorLineNr", { fg = c.accent2, bg = c.none, bold = true })
	hi("LineNr", { fg = c.fg3, bg = c.none })
	hi("SignColumn", { fg = c.fg3, bg = c.none })

	hi("Visual", { bg = c.bg4 })
	hi("VisualNOS", { bg = c.bg4 })
	hi("Search", { fg = c.bg1, bg = c.accent2 })
	hi("IncSearch", { fg = c.bg1, bg = c.warm1 })
	hi("CurSearch", { fg = c.bg1, bg = c.warm2 })
	hi("Substitute", { fg = c.bg1, bg = c.warm2 })

	hi("StatusLine", { fg = c.fg2, bg = c.bg2 })
	hi("StatusLineNC", { fg = c.fg3, bg = c.bg2 })
	hi("WinBar", { fg = c.fg2, bg = c.none })
	hi("WinBarNC", { fg = c.fg3, bg = c.none })
	hi("TabLine", { fg = c.fg3, bg = c.bg2 })
	hi("TabLineFill", { fg = c.fg3, bg = c.bg0 })
	hi("TabLineSel", { fg = c.accent1, bg = c.bg3, bold = true })

	hi("Pmenu", { fg = c.fg1, bg = c.bg0 })
	hi("PmenuSel", { fg = c.fg0, bg = c.bg4, bold = true })
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

	hi("MatchParen", { fg = c.warm1, bg = c.none, bold = true, underline = true })

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
	hi("Function", { fg = c.accent1 })

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
	hi("Todo", { fg = c.bg1, bg = c.accent2, bold = true })

	-- =========================================================================
	-- Treesitter
	-- =========================================================================
	hi("@variable", { fg = c.fg1 })
	hi("@variable.builtin", { fg = c.accent2, italic = true })
	hi("@variable.parameter", { fg = c.fg1, italic = true })
	hi("@variable.member", { fg = c.fg1 })

	hi("@constant", { fg = c.purple })
	hi("@constant.builtin", { fg = c.purple, bold = true })
	hi("@constant.macro", { fg = c.purple })

	hi("@string", { fg = c.purple })
	hi("@string.escape", { fg = c.purple })
	hi("@string.special", { fg = c.purple })
	hi("@string.regexp", { fg = c.purple, italic = true })

	hi("@number", { fg = c.warm2 })
	hi("@number.float", { fg = c.warm2 })
	hi("@boolean", { fg = c.accent1, bold = true })

	hi("@function", { fg = c.accent1 })
	hi("@function.builtin", { fg = c.accent2 })
	hi("@function.call", { fg = c.accent1 })
	hi("@function.macro", { fg = c.warm2 })
	hi("@function.method", { fg = c.accent1 })
	hi("@function.method.call", { fg = c.accent1 })

	hi("@constructor", { fg = c.accent2 })

	hi("@keyword", { fg = c.fg0, bold = cfg.bold_keywords })
	hi("@keyword.function", { fg = c.fg0, bold = cfg.bold_keywords })
	hi("@keyword.operator", { fg = c.grey1 })
	hi("@keyword.import", { fg = c.accent2 })
	hi("@keyword.return", { fg = c.fg0, bold = cfg.bold_keywords })
	hi("@keyword.conditional", { fg = c.fg0, bold = cfg.bold_keywords })
	hi("@keyword.repeat", { fg = c.fg0, bold = cfg.bold_keywords })
	hi("@keyword.exception", { fg = c.fg0, bold = cfg.bold_keywords })

	hi("@type", { fg = c.accent2 })
	hi("@type.builtin", { fg = c.accent2, italic = true })
	hi("@type.qualifier", { fg = c.accent1 })
	hi("@type.definition", { fg = c.accent2 })

	hi("@attribute", { fg = c.warm2 })
	hi("@property", { fg = c.fg1 })

	hi("@operator", { fg = c.grey1 })
	hi("@punctuation.bracket", { fg = c.grey1 })
	hi("@punctuation.delimiter", { fg = c.grey1 })
	hi("@punctuation.special", { fg = c.warm2 })

	hi("@comment", { fg = c.fg2, italic = cfg.italic_comments })
	hi("@comment.todo", { fg = c.bg1, bg = c.accent2, bold = true })
	hi("@comment.warning", { fg = c.bg1, bg = c.orange, bold = true })
	hi("@comment.error", { fg = c.bg1, bg = c.red, bold = true })
	hi("@comment.note", { fg = c.bg1, bg = c.cyan, bold = true })

	hi("@tag", { fg = c.accent1 })
	hi("@tag.attribute", { fg = c.warm1 })
	hi("@tag.delimiter", { fg = c.grey1 })

	hi("@markup.heading", { fg = c.accent1, bold = true })
	hi("@markup.heading.1", { fg = c.accent1, bold = true })
	hi("@markup.heading.2", { fg = c.accent2, bold = true })
	hi("@markup.heading.3", { fg = c.warm1, bold = true })
	hi("@markup.italic", { italic = true })
	hi("@markup.strong", { bold = true })
	hi("@markup.link", { fg = c.cyan, underline = true })
	hi("@markup.link.url", { fg = c.cyan, underline = true })
	hi("@markup.raw", { fg = c.purple })
	hi("@markup.list", { fg = c.accent2 })

	hi("@diff.plus", { fg = c.git_add })
	hi("@diff.minus", { fg = c.git_delete })
	hi("@diff.delta", { fg = c.git_change })

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

	hi("LspReferenceText", { bg = c.bg4 })
	hi("LspReferenceRead", { bg = c.bg4 })
	hi("LspReferenceWrite", { bg = c.bg4, underline = true })
	hi("LspSignatureActiveParameter", { fg = c.warm1, bold = true })
	hi("LspCodeLens", { fg = c.fg3, italic = true })
	hi("LspInlayHint", { fg = c.fg3, bg = c.bg2, italic = true })

	-- =========================================================================
	-- Git
	-- =========================================================================
	hi("DiffAdd", { fg = c.git_add, bg = "#0e1810" })
	hi("DiffChange", { fg = c.git_change, bg = "#161616" })
	hi("DiffDelete", { fg = c.git_delete, bg = "#1a0e0e" })
	hi("DiffText", { fg = c.fg1, bg = "#202020" })

	hi("GitSignsAdd", { fg = c.git_add })
	hi("GitSignsChange", { fg = c.git_change })
	hi("GitSignsDelete", { fg = c.git_delete })

	-- =========================================================================
	-- Plugins
	-- =========================================================================

	-- Telescope
	hi("TelescopeBorder", { fg = c.grey3, bg = c.bg0 })
	hi("TelescopeNormal", { fg = c.fg1, bg = c.bg0 })
	hi("TelescopePromptBorder", { fg = c.accent3, bg = c.bg0 })
	hi("TelescopePromptNormal", { fg = c.fg0, bg = c.bg0 })
	hi("TelescopePromptPrefix", { fg = c.accent1, bg = c.bg0 })
	hi("TelescopePromptTitle", { fg = c.bg0, bg = c.accent1, bold = true })
	hi("TelescopePreviewTitle", { fg = c.bg0, bg = c.warm2, bold = true })
	hi("TelescopeResultsTitle", { fg = c.fg3, bg = c.bg0 })
	hi("TelescopeSelection", { bg = c.bg3 })
	hi("TelescopeSelectionCaret", { fg = c.warm1, bg = c.bg3 })
	hi("TelescopeMatching", { fg = c.warm1, bold = true })

	-- nvim-tree
	hi("NvimTreeNormal", { fg = c.fg1, bg = c.bg0 })
	hi("NvimTreeRootFolder", { fg = c.accent1, bold = true })
	hi("NvimTreeFolderIcon", { fg = c.accent2 })
	hi("NvimTreeFolderName", { fg = c.fg1 })
	hi("NvimTreeOpenedFolderName", { fg = c.accent1 })
	hi("NvimTreeGitDirty", { fg = c.git_change })
	hi("NvimTreeGitNew", { fg = c.git_add })
	hi("NvimTreeGitDeleted", { fg = c.git_delete })
	hi("NvimTreeIndentMarker", { fg = c.fg4 })
	hi("NvimTreeWinSeparator", { fg = c.grey3 })

	-- neo-tree
	hi("NeoTreeNormal", { fg = c.fg1, bg = c.bg0 })
	hi("NeoTreeNormalNC", { fg = c.fg2, bg = c.bg0 })
	hi("NeoTreeRootName", { fg = c.accent1, bold = true })
	hi("NeoTreeDirectoryIcon", { fg = c.accent2 })
	hi("NeoTreeDirectoryName", { fg = c.fg1 })
	hi("NeoTreeGitModified", { fg = c.git_change })
	hi("NeoTreeGitAdded", { fg = c.git_add })
	hi("NeoTreeGitDeleted", { fg = c.git_delete })
	hi("NeoTreeWinSeparator", { fg = c.grey3 })
	hi("NeoTreeDotfile", { fg = c.fg3 })

	-- Which-key
	hi("WhichKey", { fg = c.accent1 })
	hi("WhichKeyGroup", { fg = c.warm1 })
	hi("WhichKeyDesc", { fg = c.fg1 })
	hi("WhichKeySeparator", { fg = c.fg3 })
	hi("WhichKeyFloat", { bg = c.bg0 })
	hi("WhichKeyBorder", { fg = c.grey3, bg = c.bg0 })

	-- indent-blankline
	hi("IblIndent", { fg = c.fg4 })
	hi("IblScope", { fg = c.accent3 })

	-- nvim-cmp
	hi("CmpItemAbbr", { fg = c.fg1 })
	hi("CmpItemAbbrMatch", { fg = c.accent1, bold = true })
	hi("CmpItemAbbrMatchFuzzy", { fg = c.warm1, bold = true })
	hi("CmpItemAbbrDeprecated", { fg = c.fg3, strikethrough = true })
	hi("CmpItemKind", { fg = c.accent2 })
	hi("CmpItemMenu", { fg = c.fg3 })

	-- Noice / notify
	hi("NoiceCmdline", { fg = c.fg1, bg = c.bg0 })
	hi("NoiceCmdlineIcon", { fg = c.accent1 })
	hi("NoiceCmdlineBorder", { fg = c.grey3 })
	hi("NotifyERRORBorder", { fg = c.red })
	hi("NotifyWARNBorder", { fg = c.orange })
	hi("NotifyINFOBorder", { fg = c.cyan })
	hi("NotifyDEBUGBorder", { fg = c.fg3 })
	hi("NotifyERRORTitle", { fg = c.red, bold = true })
	hi("NotifyWARNTitle", { fg = c.orange, bold = true })
	hi("NotifyINFOTitle", { fg = c.cyan, bold = true })

	-- Lualine (semantic token groups, actual lualine config separate)
	hi("LualineNormalA", { fg = c.bg1, bg = c.accent1, bold = true })
	hi("LualineInsertA", { fg = c.bg1, bg = c.warm1, bold = true })
	hi("LualineVisualA", { fg = c.bg1, bg = c.accent2, bold = true })
	hi("LualineCommandA", { fg = c.bg1, bg = c.warm2, bold = true })

	-- mini.nvim
	hi("MiniStatuslineModeNormal", { fg = c.bg1, bg = c.accent1, bold = true })
	hi("MiniStatuslineModeInsert", { fg = c.bg1, bg = c.warm1, bold = true })
	hi("MiniStatuslineModeVisual", { fg = c.bg1, bg = c.accent2, bold = true })
	hi("MiniStatuslineModeCommand", { fg = c.bg1, bg = c.warm2, bold = true })
	hi("MiniStatuslineModeOther", { fg = c.bg1, bg = c.grey1, bold = true })
	hi("MiniStatuslineFilename", { fg = c.fg2, bg = c.bg2 })
	hi("MiniStatuslineFileinfo", { fg = c.fg3, bg = c.bg2 })
	hi("MiniStatuslineInactive", { fg = c.fg3, bg = c.bg0 })
	hi("MiniCursorword", { bg = c.bg4, underline = true })
	hi("MiniCursorwordCurrent", { bg = c.bg4, underline = true })
	hi("MiniJump", { fg = c.warm1, bold = true, underline = true })
	hi("MiniJump2dSpot", { fg = c.warm1, bold = true })

	-- Flash.nvim
	hi("FlashLabel", { fg = c.bg1, bg = c.warm1, bold = true })
	hi("FlashMatch", { fg = c.bg1, bg = c.accent2 })
	hi("FlashCurrent", { fg = c.bg1, bg = c.accent1, bold = true })

	-- Snacks.nvim
	hi("SnacksPickerBorder", { fg = c.grey3, bg = c.bg0 })
	hi("SnacksPickerMatch", { fg = c.warm1, bold = true })
	hi("SnacksDashboardHeader", { fg = c.accent1 })
	hi("SnacksDashboardFooter", { fg = c.fg3, italic = true })
	hi("SnacksDashboardKey", { fg = c.warm1 })
	hi("SnacksDashboardDesc", { fg = c.fg2 })
	hi("SnacksDashboardIcon", { fg = c.accent2 })

	-- Lazy.nvim
	hi("LazyH1", { fg = c.accent1, bold = true })
	hi("LazyButton", { fg = c.fg1, bg = c.bg3 })
	hi("LazyButtonActive", { fg = c.bg1, bg = c.accent1, bold = true })
	hi("LazySpecial", { fg = c.warm1 })

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

-- Expose palette for integrations (lualine theme, etc.)
function M.get_colors()
	return c
end

return M
