-- =============================================================================
-- tenebris.nvim
-- A dark, moody colorscheme with purple and pink accents.
-- Author: Yudi Wu
-- License: MIT
-- =============================================================================

local M = {}

local defaults = {
  transparent      = false,
  italic_comments  = true,
  bold_keywords    = true,
}

M.config = {}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", defaults, opts or {})
end

M.colors = {
  -- Backgrounds
  bg0        = "#0d0d0f",   -- deepest bg (floating wins, borders)
  bg1        = "#111114",   -- main editor bg
  bg2        = "#17171b",   -- sidebar, statusline bg
  bg3        = "#1e1e24",   -- cursorline, selection bg
  bg4        = "#26262e",   -- visual selection, inactive highlights

  -- Foregrounds
  fg0        = "#e2e0e8",   -- brightest text (unused/rare)
  fg1        = "#c8c5d4",   -- default text
  fg2        = "#9994aa",   -- comments, subtle text
  fg3        = "#5e5a6e",   -- line numbers, very muted
  fg4        = "#3a3745",   -- invisible/decorative

  -- Accents: Purple family
  purple1    = "#c09af0",   -- keywords, main purple
  purple2    = "#a07dd8",   -- types, slightly deeper
  purple3    = "#7c5bbf",   -- muted purple, inactive things

  -- Accents: Pink family
  pink1      = "#e8a0c0",   -- strings, warm pink
  pink2      = "#d07898",   -- special, deeper pink
  pink3      = "#a85878",   -- error underlines, dark pink

  -- Neutrals
  grey1      = "#7a7585",   -- operators, punctuation
  grey2      = "#524e60",   -- muted operators
  grey3      = "#2e2b38",   -- borders, splits

  -- Semantic
  red        = "#e07878",   -- errors
  orange     = "#d4956a",   -- warnings
  yellow     = "#c8b87a",   -- hints
  green      = "#88b894",   -- ok/added
  cyan       = "#80b8c8",   -- info, links

  -- Git
  git_add    = "#6a9f76",
  git_change = "#8878b8",
  git_delete = "#a85858",

  none       = "NONE",
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
  hi("Normal",          { fg = c.fg1,     bg = c.bg1 })
  hi("NormalFloat",     { fg = c.fg1,     bg = c.bg0 })
  hi("NormalNC",        { fg = c.fg2,     bg = c.bg1 })
  hi("FloatBorder",     { fg = c.grey3,   bg = c.bg0 })
  hi("FloatTitle",      { fg = c.purple1, bg = c.bg0, bold = true })

  hi("Cursor",          { fg = c.bg1,     bg = c.fg1 })
  hi("CursorLine",      { bg = c.bg3 })
  hi("CursorColumn",    { bg = c.bg3 })
  hi("CursorLineNr",    { fg = c.purple2, bg = c.none, bold = true })
  hi("LineNr",          { fg = c.fg3,     bg = c.none })
  hi("SignColumn",      { fg = c.fg3,     bg = c.none })

  hi("Visual",          { bg = c.bg4 })
  hi("VisualNOS",       { bg = c.bg4 })
  hi("Search",          { fg = c.bg1,     bg = c.purple2 })
  hi("IncSearch",       { fg = c.bg1,     bg = c.pink1 })
  hi("CurSearch",       { fg = c.bg1,     bg = c.pink2 })
  hi("Substitute",      { fg = c.bg1,     bg = c.pink2 })

  hi("StatusLine",      { fg = c.fg2,     bg = c.bg2 })
  hi("StatusLineNC",    { fg = c.fg3,     bg = c.bg2 })
  hi("WinBar",          { fg = c.fg2,     bg = c.none })
  hi("WinBarNC",        { fg = c.fg3,     bg = c.none })
  hi("TabLine",         { fg = c.fg3,     bg = c.bg2 })
  hi("TabLineFill",     { fg = c.fg3,     bg = c.bg0 })
  hi("TabLineSel",      { fg = c.purple1, bg = c.bg3, bold = true })

  hi("Pmenu",           { fg = c.fg1,     bg = c.bg0 })
  hi("PmenuSel",        { fg = c.fg0,     bg = c.bg4, bold = true })
  hi("PmenuSbar",       { bg = c.bg2 })
  hi("PmenuThumb",      { bg = c.purple3 })

  hi("VertSplit",       { fg = c.grey3,   bg = c.none })
  hi("WinSeparator",    { fg = c.grey3,   bg = c.none })
  hi("EndOfBuffer",     { fg = c.fg4 })
  hi("NonText",         { fg = c.fg4 })
  hi("SpecialKey",      { fg = c.fg4 })
  hi("Whitespace",      { fg = c.fg4 })
  hi("Conceal",         { fg = c.fg3 })

  hi("Folded",          { fg = c.fg3,     bg = c.bg3 })
  hi("FoldColumn",      { fg = c.fg3,     bg = c.none })

  hi("MatchParen",      { fg = c.pink1,   bg = c.none, bold = true, underline = true })

  hi("Directory",       { fg = c.purple1 })
  hi("Title",           { fg = c.purple1, bold = true })
  hi("Question",        { fg = c.cyan })
  hi("MoreMsg",         { fg = c.cyan })
  hi("ModeMsg",         { fg = c.fg2 })
  hi("ErrorMsg",        { fg = c.red })
  hi("WarningMsg",      { fg = c.orange })

  hi("SpellBad",        { undercurl = true, sp = c.red })
  hi("SpellCap",        { undercurl = true, sp = c.orange })
  hi("SpellRare",       { undercurl = true, sp = c.purple2 })
  hi("SpellLocal",      { undercurl = true, sp = c.cyan })

  hi("QuickFixLine",    { bg = c.bg4 })
  hi("qfLineNr",        { fg = c.purple2 })

  -- =========================================================================
  -- Syntax
  -- =========================================================================
  hi("Comment",         { fg = c.fg2,     italic = cfg.italic_comments })
  hi("SpecialComment",  { fg = c.fg2,     italic = cfg.italic_comments })

  hi("Constant",        { fg = c.pink1 })
  hi("String",          { fg = c.pink1 })
  hi("Character",       { fg = c.pink2 })
  hi("Number",          { fg = c.pink2 })
  hi("Boolean",         { fg = c.purple1, bold = true })
  hi("Float",           { fg = c.pink2 })

  hi("Identifier",      { fg = c.fg1 })
  hi("Function",        { fg = c.purple1 })

  hi("Statement",       { fg = c.purple1, bold = cfg.bold_keywords })
  hi("Conditional",     { fg = c.purple1, bold = cfg.bold_keywords })
  hi("Repeat",          { fg = c.purple1, bold = cfg.bold_keywords })
  hi("Label",           { fg = c.purple2 })
  hi("Operator",        { fg = c.grey1 })
  hi("Keyword",         { fg = c.purple1, bold = cfg.bold_keywords })
  hi("Exception",       { fg = c.pink2,   bold = cfg.bold_keywords })

  hi("PreProc",         { fg = c.pink2 })
  hi("Include",         { fg = c.purple2 })
  hi("Define",          { fg = c.purple2 })
  hi("Macro",           { fg = c.pink2 })
  hi("PreCondit",       { fg = c.purple2 })

  hi("Type",            { fg = c.purple2 })
  hi("StorageClass",    { fg = c.purple1 })
  hi("Structure",       { fg = c.purple2 })
  hi("Typedef",         { fg = c.purple2 })

  hi("Special",         { fg = c.pink2 })
  hi("SpecialChar",     { fg = c.pink2 })
  hi("Tag",             { fg = c.purple1 })
  hi("Delimiter",       { fg = c.grey1 })

  hi("Underlined",      { fg = c.cyan,    underline = true })
  hi("Bold",            { bold = true })
  hi("Italic",          { italic = true })
  hi("Ignore",          { fg = c.fg4 })
  hi("Error",           { fg = c.red,     bold = true })
  hi("Todo",            { fg = c.bg1,     bg = c.purple2, bold = true })

  -- =========================================================================
  -- Treesitter
  -- =========================================================================
  hi("@variable",                 { fg = c.fg1 })
  hi("@variable.builtin",         { fg = c.purple2, italic = true })
  hi("@variable.parameter",       { fg = c.fg1,     italic = true })
  hi("@variable.member",          { fg = c.fg1 })

  hi("@constant",                 { fg = c.pink1 })
  hi("@constant.builtin",         { fg = c.pink2,   bold = true })
  hi("@constant.macro",           { fg = c.pink2 })

  hi("@string",                   { fg = c.pink1 })
  hi("@string.escape",            { fg = c.pink2 })
  hi("@string.special",           { fg = c.pink2 })
  hi("@string.regexp",            { fg = c.pink2,   italic = true })

  hi("@number",                   { fg = c.pink2 })
  hi("@number.float",             { fg = c.pink2 })
  hi("@boolean",                  { fg = c.purple1, bold = true })

  hi("@function",                 { fg = c.purple1 })
  hi("@function.builtin",         { fg = c.purple2 })
  hi("@function.call",            { fg = c.purple1 })
  hi("@function.macro",           { fg = c.pink2 })
  hi("@function.method",          { fg = c.purple1 })
  hi("@function.method.call",     { fg = c.purple1 })

  hi("@constructor",              { fg = c.purple2 })

  hi("@keyword",                  { fg = c.purple1, bold = cfg.bold_keywords })
  hi("@keyword.function",         { fg = c.purple1, bold = cfg.bold_keywords })
  hi("@keyword.operator",         { fg = c.grey1 })
  hi("@keyword.import",           { fg = c.purple2 })
  hi("@keyword.return",           { fg = c.pink2,   bold = cfg.bold_keywords })
  hi("@keyword.conditional",      { fg = c.purple1, bold = cfg.bold_keywords })
  hi("@keyword.repeat",           { fg = c.purple1, bold = cfg.bold_keywords })
  hi("@keyword.exception",        { fg = c.pink2,   bold = cfg.bold_keywords })

  hi("@type",                     { fg = c.purple2 })
  hi("@type.builtin",             { fg = c.purple2, italic = true })
  hi("@type.qualifier",           { fg = c.purple1 })
  hi("@type.definition",          { fg = c.purple2 })

  hi("@attribute",                { fg = c.pink2 })
  hi("@property",                 { fg = c.fg1 })

  hi("@operator",                 { fg = c.grey1 })
  hi("@punctuation.bracket",      { fg = c.grey1 })
  hi("@punctuation.delimiter",    { fg = c.grey1 })
  hi("@punctuation.special",      { fg = c.pink2 })

  hi("@comment",                  { fg = c.fg2,     italic = cfg.italic_comments })
  hi("@comment.todo",             { fg = c.bg1,     bg = c.purple2, bold = true })
  hi("@comment.warning",          { fg = c.bg1,     bg = c.orange,  bold = true })
  hi("@comment.error",            { fg = c.bg1,     bg = c.red,     bold = true })
  hi("@comment.note",             { fg = c.bg1,     bg = c.cyan,    bold = true })

  hi("@tag",                      { fg = c.purple1 })
  hi("@tag.attribute",            { fg = c.pink1 })
  hi("@tag.delimiter",            { fg = c.grey1 })

  hi("@markup.heading",           { fg = c.purple1, bold = true })
  hi("@markup.heading.1",         { fg = c.purple1, bold = true })
  hi("@markup.heading.2",         { fg = c.purple2, bold = true })
  hi("@markup.heading.3",         { fg = c.pink1,   bold = true })
  hi("@markup.italic",            { italic = true })
  hi("@markup.strong",            { bold = true })
  hi("@markup.link",              { fg = c.cyan,    underline = true })
  hi("@markup.link.url",          { fg = c.cyan,    underline = true })
  hi("@markup.raw",               { fg = c.pink1 })
  hi("@markup.list",              { fg = c.purple2 })

  hi("@diff.plus",                { fg = c.git_add })
  hi("@diff.minus",               { fg = c.git_delete })
  hi("@diff.delta",               { fg = c.git_change })

  -- =========================================================================
  -- LSP
  -- =========================================================================
  hi("DiagnosticError",           { fg = c.red })
  hi("DiagnosticWarn",            { fg = c.orange })
  hi("DiagnosticInfo",            { fg = c.cyan })
  hi("DiagnosticHint",            { fg = c.purple2 })
  hi("DiagnosticOk",              { fg = c.green })

  hi("DiagnosticUnderlineError",  { undercurl = true, sp = c.red })
  hi("DiagnosticUnderlineWarn",   { undercurl = true, sp = c.orange })
  hi("DiagnosticUnderlineInfo",   { undercurl = true, sp = c.cyan })
  hi("DiagnosticUnderlineHint",   { undercurl = true, sp = c.purple2 })

  hi("DiagnosticVirtualTextError",{ fg = c.red,    bg = c.none, italic = true })
  hi("DiagnosticVirtualTextWarn", { fg = c.orange, bg = c.none, italic = true })
  hi("DiagnosticVirtualTextInfo", { fg = c.cyan,   bg = c.none, italic = true })
  hi("DiagnosticVirtualTextHint", { fg = c.purple2,bg = c.none, italic = true })

  hi("DiagnosticSignError",       { fg = c.red })
  hi("DiagnosticSignWarn",        { fg = c.orange })
  hi("DiagnosticSignInfo",        { fg = c.cyan })
  hi("DiagnosticSignHint",        { fg = c.purple2 })

  hi("LspReferenceText",          { bg = c.bg4 })
  hi("LspReferenceRead",          { bg = c.bg4 })
  hi("LspReferenceWrite",         { bg = c.bg4, underline = true })
  hi("LspSignatureActiveParameter", { fg = c.pink1, bold = true })
  hi("LspCodeLens",               { fg = c.fg3,   italic = true })
  hi("LspInlayHint",              { fg = c.fg3,   bg = c.bg2, italic = true })

  -- =========================================================================
  -- Git
  -- =========================================================================
  hi("DiffAdd",                   { fg = c.git_add,    bg = "#0f1f14" })
  hi("DiffChange",                { fg = c.git_change, bg = "#141224" })
  hi("DiffDelete",                { fg = c.git_delete, bg = "#1f0f10" })
  hi("DiffText",                  { fg = c.fg1,        bg = "#1e1640" })

  hi("GitSignsAdd",               { fg = c.git_add })
  hi("GitSignsChange",            { fg = c.git_change })
  hi("GitSignsDelete",            { fg = c.git_delete })

  -- =========================================================================
  -- Plugins
  -- =========================================================================

  -- Telescope
  hi("TelescopeBorder",           { fg = c.grey3,   bg = c.bg0 })
  hi("TelescopeNormal",           { fg = c.fg1,     bg = c.bg0 })
  hi("TelescopePromptBorder",     { fg = c.purple3, bg = c.bg0 })
  hi("TelescopePromptNormal",     { fg = c.fg0,     bg = c.bg0 })
  hi("TelescopePromptPrefix",     { fg = c.purple1, bg = c.bg0 })
  hi("TelescopePromptTitle",      { fg = c.bg0,     bg = c.purple1, bold = true })
  hi("TelescopePreviewTitle",     { fg = c.bg0,     bg = c.pink2,   bold = true })
  hi("TelescopeResultsTitle",     { fg = c.fg3,     bg = c.bg0 })
  hi("TelescopeSelection",        { bg = c.bg3 })
  hi("TelescopeSelectionCaret",   { fg = c.pink1,   bg = c.bg3 })
  hi("TelescopeMatching",         { fg = c.pink1,   bold = true })

  -- nvim-tree
  hi("NvimTreeNormal",            { fg = c.fg1,     bg = c.bg0 })
  hi("NvimTreeRootFolder",        { fg = c.purple1, bold = true })
  hi("NvimTreeFolderIcon",        { fg = c.purple2 })
  hi("NvimTreeFolderName",        { fg = c.fg1 })
  hi("NvimTreeOpenedFolderName",  { fg = c.purple1 })
  hi("NvimTreeGitDirty",          { fg = c.git_change })
  hi("NvimTreeGitNew",            { fg = c.git_add })
  hi("NvimTreeGitDeleted",        { fg = c.git_delete })
  hi("NvimTreeIndentMarker",      { fg = c.fg4 })
  hi("NvimTreeWinSeparator",      { fg = c.grey3 })

  -- neo-tree
  hi("NeoTreeNormal",             { fg = c.fg1,     bg = c.bg0 })
  hi("NeoTreeNormalNC",           { fg = c.fg2,     bg = c.bg0 })
  hi("NeoTreeRootName",           { fg = c.purple1, bold = true })
  hi("NeoTreeDirectoryIcon",      { fg = c.purple2 })
  hi("NeoTreeDirectoryName",      { fg = c.fg1 })
  hi("NeoTreeGitModified",        { fg = c.git_change })
  hi("NeoTreeGitAdded",           { fg = c.git_add })
  hi("NeoTreeGitDeleted",         { fg = c.git_delete })
  hi("NeoTreeWinSeparator",       { fg = c.grey3 })
  hi("NeoTreeDotfile",            { fg = c.fg3 })

  -- Which-key
  hi("WhichKey",                  { fg = c.purple1 })
  hi("WhichKeyGroup",             { fg = c.pink1 })
  hi("WhichKeyDesc",              { fg = c.fg1 })
  hi("WhichKeySeparator",         { fg = c.fg3 })
  hi("WhichKeyFloat",             { bg = c.bg0 })
  hi("WhichKeyBorder",            { fg = c.grey3,   bg = c.bg0 })

  -- indent-blankline
  hi("IblIndent",                 { fg = c.fg4 })
  hi("IblScope",                  { fg = c.purple3 })

  -- nvim-cmp
  hi("CmpItemAbbr",               { fg = c.fg1 })
  hi("CmpItemAbbrMatch",          { fg = c.purple1, bold = true })
  hi("CmpItemAbbrMatchFuzzy",     { fg = c.pink1,   bold = true })
  hi("CmpItemAbbrDeprecated",     { fg = c.fg3,     strikethrough = true })
  hi("CmpItemKind",               { fg = c.purple2 })
  hi("CmpItemMenu",               { fg = c.fg3 })

  -- Noice / notify
  hi("NoiceCmdline",              { fg = c.fg1,     bg = c.bg0 })
  hi("NoiceCmdlineIcon",          { fg = c.purple1 })
  hi("NoiceCmdlineBorder",        { fg = c.grey3 })
  hi("NotifyERRORBorder",         { fg = c.red })
  hi("NotifyWARNBorder",          { fg = c.orange })
  hi("NotifyINFOBorder",          { fg = c.cyan })
  hi("NotifyDEBUGBorder",         { fg = c.fg3 })
  hi("NotifyERRORTitle",          { fg = c.red,     bold = true })
  hi("NotifyWARNTitle",           { fg = c.orange,  bold = true })
  hi("NotifyINFOTitle",           { fg = c.cyan,    bold = true })

  -- Lualine (semantic token groups, actual lualine config separate)
  hi("LualineNormalA",            { fg = c.bg1,     bg = c.purple1, bold = true })
  hi("LualineInsertA",            { fg = c.bg1,     bg = c.pink1,   bold = true })
  hi("LualineVisualA",            { fg = c.bg1,     bg = c.purple2, bold = true })
  hi("LualineCommandA",           { fg = c.bg1,     bg = c.pink2,   bold = true })

  -- mini.nvim
  hi("MiniStatuslineModeNormal",  { fg = c.bg1,     bg = c.purple1, bold = true })
  hi("MiniStatuslineModeInsert",  { fg = c.bg1,     bg = c.pink1,   bold = true })
  hi("MiniStatuslineModeVisual",  { fg = c.bg1,     bg = c.purple2, bold = true })
  hi("MiniStatuslineModeCommand", { fg = c.bg1,     bg = c.pink2,   bold = true })
  hi("MiniStatuslineModeOther",   { fg = c.bg1,     bg = c.grey1,   bold = true })
  hi("MiniStatuslineFilename",    { fg = c.fg2,     bg = c.bg2 })
  hi("MiniStatuslineFileinfo",    { fg = c.fg3,     bg = c.bg2 })
  hi("MiniStatuslineInactive",    { fg = c.fg3,     bg = c.bg0 })
  hi("MiniCursorword",            { bg = c.bg4,     underline = true })
  hi("MiniCursorwordCurrent",     { bg = c.bg4,     underline = true })
  hi("MiniJump",                  { fg = c.pink1,   bold = true, underline = true })
  hi("MiniJump2dSpot",            { fg = c.pink1,   bold = true })

  -- Flash.nvim
  hi("FlashLabel",                { fg = c.bg1,     bg = c.pink1,   bold = true })
  hi("FlashMatch",                { fg = c.bg1,     bg = c.purple2 })
  hi("FlashCurrent",              { fg = c.bg1,     bg = c.purple1, bold = true })

  -- Snacks.nvim
  hi("SnacksPickerBorder",        { fg = c.grey3,   bg = c.bg0 })
  hi("SnacksPickerMatch",         { fg = c.pink1,   bold = true })
  hi("SnacksDashboardHeader",     { fg = c.purple1 })
  hi("SnacksDashboardFooter",     { fg = c.fg3,     italic = true })
  hi("SnacksDashboardKey",        { fg = c.pink1 })
  hi("SnacksDashboardDesc",       { fg = c.fg2 })
  hi("SnacksDashboardIcon",       { fg = c.purple2 })

  -- Lazy.nvim
  hi("LazyH1",                    { fg = c.purple1, bold = true })
  hi("LazyButton",                { fg = c.fg1,     bg = c.bg3 })
  hi("LazyButtonActive",          { fg = c.bg1,     bg = c.purple1, bold = true })
  hi("LazySpecial",               { fg = c.pink1 })

end

-- Expose palette for integrations (lualine theme, etc.)
function M.get_colors()
  return c
end

return M
