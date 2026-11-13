-- =============================================================================
-- tenebris.nvim: plugin highlight groups
-- Called from tenebris.load() after the core groups are set.
-- =============================================================================

return function(hi, c, cfg)
	local function link(group, target)
		hi(group, { link = target })
	end

	-- Shared look for floating windows
	local float = { fg = c.fg1, bg = c.bg0 }
	local border = { fg = c.grey3, bg = c.bg0 }

	-- =========================================================================
	-- Pickers / finders
	-- =========================================================================

	-- Telescope
	hi("TelescopeNormal", float)
	hi("TelescopeBorder", border)
	hi("TelescopeTitle", { fg = c.accent1, bold = true })
	hi("TelescopePromptNormal", { fg = c.fg0, bg = c.bg0 })
	hi("TelescopePromptBorder", { fg = c.accent3, bg = c.bg0 })
	hi("TelescopePromptPrefix", { fg = c.accent1, bg = c.bg0 })
	hi("TelescopePromptTitle", { fg = c.bg0, bg = c.accent1, bold = true })
	hi("TelescopePromptCounter", { fg = c.fg3 })
	hi("TelescopePreviewNormal", float)
	hi("TelescopePreviewBorder", border)
	hi("TelescopePreviewTitle", { fg = c.bg0, bg = c.warm2, bold = true })
	hi("TelescopePreviewLine", { bg = c.bg3 })
	hi("TelescopePreviewMatch", { bg = c.search })
	hi("TelescopeResultsNormal", float)
	hi("TelescopeResultsBorder", border)
	hi("TelescopeResultsTitle", { fg = c.fg3, bg = c.bg0 })
	hi("TelescopeResultsComment", { fg = c.fg2 })
	hi("TelescopeResultsLineNr", { fg = c.fg3 })
	hi("TelescopeResultsDiffAdd", { fg = c.git_add })
	hi("TelescopeResultsDiffChange", { fg = c.git_change })
	hi("TelescopeResultsDiffDelete", { fg = c.git_delete })
	hi("TelescopeResultsDiffUntracked", { fg = c.fg2 })
	hi("TelescopeSelection", { fg = c.fg0, bg = c.bg4 })
	hi("TelescopeSelectionCaret", { fg = c.purple, bg = c.bg4 })
	hi("TelescopeMultiSelection", { fg = c.purple })
	hi("TelescopeMultiIcon", { fg = c.purple })
	hi("TelescopeMatching", { fg = c.purple })

	-- fzf-lua
	hi("FzfLuaNormal", float)
	hi("FzfLuaBorder", border)
	hi("FzfLuaTitle", { fg = c.accent1, bg = c.bg0, bold = true })
	hi("FzfLuaCursor", { fg = c.bg1, bg = c.cursor })
	hi("FzfLuaCursorLine", { bg = c.bg4 })
	hi("FzfLuaPreviewNormal", float)
	hi("FzfLuaPreviewBorder", border)
	hi("FzfLuaPreviewTitle", { fg = c.bg0, bg = c.warm2, bold = true })
	hi("FzfLuaHeaderText", { fg = c.fg3 })
	hi("FzfLuaHeaderBind", { fg = c.warm1 })
	hi("FzfLuaPathLineNr", { fg = c.fg3 })
	hi("FzfLuaPathColNr", { fg = c.fg3 })
	hi("FzfLuaLivePrompt", { fg = c.accent1 })
	hi("FzfLuaScrollBorderFull", { fg = c.grey3 })
	hi("FzfLuaScrollFloatFull", { bg = c.accent3 })

	-- Harpoon
	hi("HarpoonWindow", float)
	hi("HarpoonBorder", border)
	hi("HarpoonActive", { fg = c.accent1, bold = true })
	hi("HarpoonInactive", { fg = c.fg2 })
	hi("HarpoonNumberActive", { fg = c.purple })
	hi("HarpoonNumberInactive", { fg = c.fg3 })

	-- Flash.nvim
	hi("FlashBackdrop", { fg = c.fg3 })
	hi("FlashLabel", { fg = c.bg1, bg = c.warm1, bold = true })
	hi("FlashMatch", { fg = c.fg1, bg = c.search })
	hi("FlashCurrent", { fg = c.fg0, bg = c.search_cur, bold = true })

	-- Leap
	hi("LeapBackdrop", { fg = c.fg3 })
	hi("LeapMatch", { fg = c.fg0, bg = c.search_cur, bold = true })
	hi("LeapLabel", { fg = c.bg1, bg = c.warm1, bold = true })

	-- =========================================================================
	-- File explorers
	-- =========================================================================

	-- neo-tree
	hi("NeoTreeNormal", { fg = c.fg1, bg = c.bg2 })
	hi("NeoTreeNormalNC", { fg = c.fg1, bg = c.bg2 })
	hi("NeoTreeEndOfBuffer", { fg = c.bg2, bg = c.bg2 })
	hi("NeoTreeSignColumn", { fg = c.fg3, bg = c.bg2 })
	hi("NeoTreeWinSeparator", { fg = c.grey3, bg = c.none })
	hi("NeoTreeVertSplit", { fg = c.grey3, bg = c.none })
	hi("NeoTreeStatusLine", { fg = c.fg2, bg = c.bg2 })
	hi("NeoTreeStatusLineNC", { fg = c.fg2, bg = c.bg2 })
	hi("NeoTreeCursorLine", { bg = c.bg3 })
	hi("NeoTreeRootName", { fg = c.accent1, bold = true })
	hi("NeoTreeTitleBar", { fg = c.bg0, bg = c.accent1, bold = true })
	hi("NeoTreeFloatNormal", float)
	hi("NeoTreeFloatBorder", border)
	hi("NeoTreeFloatTitle", { fg = c.accent1, bg = c.bg0, bold = true })
	hi("NeoTreeDirectoryIcon", { fg = c.accent2 })
	hi("NeoTreeDirectoryName", { fg = c.fg1 })
	hi("NeoTreeFileName", { fg = c.fg1 })
	hi("NeoTreeFileNameOpened", { fg = c.accent1 })
	hi("NeoTreeFileIcon", { fg = c.accent2 })
	hi("NeoTreeFileStats", { fg = c.fg3 })
	hi("NeoTreeFileStatsHeader", { fg = c.fg2, bold = true })
	hi("NeoTreeSymbolicLinkTarget", { fg = c.cyan })
	hi("NeoTreeIndentMarker", { fg = c.fg4 })
	hi("NeoTreeExpander", { fg = c.fg3 })
	hi("NeoTreeDotfile", { fg = c.fg3 })
	hi("NeoTreeDimText", { fg = c.fg3 })
	hi("NeoTreeFadeText1", { fg = c.fg3 })
	hi("NeoTreeFadeText2", { fg = c.fg4 })
	hi("NeoTreeHiddenByName", { fg = c.fg3 })
	hi("NeoTreeMessage", { fg = c.fg3, italic = true })
	hi("NeoTreeFilterTerm", { fg = c.warm1, bold = true })
	hi("NeoTreeModified", { fg = c.orange })
	hi("NeoTreeBufferNumber", { fg = c.fg3 })
	hi("NeoTreeGitAdded", { fg = c.git_add })
	hi("NeoTreeGitModified", { fg = c.git_change })
	hi("NeoTreeGitDeleted", { fg = c.git_delete })
	hi("NeoTreeGitConflict", { fg = c.red, bold = true })
	hi("NeoTreeGitIgnored", { fg = c.fg3 })
	hi("NeoTreeGitRenamed", { fg = c.cyan })
	hi("NeoTreeGitStaged", { fg = c.git_add })
	hi("NeoTreeGitUnstaged", { fg = c.git_change })
	hi("NeoTreeGitUntracked", { fg = c.git_add })
	hi("NeoTreeTabActive", { fg = c.fg0, bg = c.bg1, bold = true })
	hi("NeoTreeTabInactive", { fg = c.fg2, bg = c.bg0 })
	hi("NeoTreeTabSeparatorActive", { fg = c.bg1, bg = c.bg1 })
	hi("NeoTreeTabSeparatorInactive", { fg = c.bg0, bg = c.bg0 })

	-- nvim-tree
	hi("NvimTreeNormal", { fg = c.fg1, bg = c.bg2 })
	hi("NvimTreeNormalNC", { fg = c.fg1, bg = c.bg2 })
	hi("NvimTreeRootFolder", { fg = c.accent1, bold = true })
	hi("NvimTreeFolderIcon", { fg = c.accent2 })
	hi("NvimTreeFolderName", { fg = c.fg1 })
	hi("NvimTreeOpenedFolderName", { fg = c.accent1 })
	hi("NvimTreeEmptyFolderName", { fg = c.fg3 })
	hi("NvimTreeSymlink", { fg = c.cyan })
	hi("NvimTreeGitDirty", { fg = c.git_change })
	hi("NvimTreeGitNew", { fg = c.git_add })
	hi("NvimTreeGitDeleted", { fg = c.git_delete })
	hi("NvimTreeGitIgnored", { fg = c.fg3 })
	hi("NvimTreeIndentMarker", { fg = c.fg4 })
	hi("NvimTreeWinSeparator", { fg = c.grey3 })
	hi("NvimTreeCursorLine", { bg = c.bg3 })

	-- oil.nvim
	hi("OilDir", { fg = c.accent1 })
	hi("OilDirIcon", { fg = c.accent2 })
	hi("OilDirHidden", { fg = c.fg3 })
	hi("OilFile", { fg = c.fg1 })
	hi("OilFileHidden", { fg = c.fg3 })
	hi("OilHidden", { fg = c.fg3 })
	hi("OilEmpty", { fg = c.fg3 })
	hi("OilLink", { fg = c.cyan })
	hi("OilLinkHidden", { fg = c.fg3 })
	hi("OilLinkTarget", { fg = c.fg3 })
	hi("OilLinkTargetHidden", { fg = c.fg4 })
	hi("OilOrphanLink", { fg = c.red })
	hi("OilOrphanLinkHidden", { fg = c.fg3 })
	hi("OilOrphanLinkTarget", { fg = c.red })
	hi("OilOrphanLinkTargetHidden", { fg = c.fg3 })
	hi("OilSocket", { fg = c.warm2 })
	hi("OilSocketHidden", { fg = c.fg3 })
	hi("OilCreate", { fg = c.green })
	hi("OilCopy", { fg = c.cyan })
	hi("OilMove", { fg = c.orange })
	hi("OilChange", { fg = c.orange })
	hi("OilDelete", { fg = c.red })
	hi("OilPurge", { fg = c.red, bold = true })
	hi("OilRestore", { fg = c.green })
	hi("OilTrash", { fg = c.orange })
	hi("OilTrashSourcePath", { fg = c.fg3 })
	hi("OilVtext", { fg = c.fg3, italic = true })

	-- mini.files
	hi("MiniFilesNormal", float)
	hi("MiniFilesBorder", border)
	hi("MiniFilesBorderModified", { fg = c.orange, bg = c.bg0 })
	hi("MiniFilesTitle", { fg = c.accent2, bg = c.bg0 })
	hi("MiniFilesTitleFocused", { fg = c.accent1, bg = c.bg0, bold = true })
	hi("MiniFilesDirectory", { fg = c.accent1 })
	hi("MiniFilesFile", { fg = c.fg1 })
	hi("MiniFilesCursorLine", { bg = c.bg3 })

	-- =========================================================================
	-- Completion / snippets
	-- =========================================================================

	-- nvim-cmp
	hi("CmpItemAbbr", { fg = c.fg1 })
	hi("CmpItemAbbrMatch", { fg = c.purple })
	hi("CmpItemAbbrMatchFuzzy", { fg = c.purple })
	hi("CmpItemAbbrDeprecated", { fg = c.fg3, strikethrough = true })
	hi("CmpItemKind", { fg = c.accent2 })
	hi("CmpItemMenu", { fg = c.fg3 })

	-- blink.cmp
	hi("BlinkCmpMenu", float)
	hi("BlinkCmpMenuBorder", border)
	hi("BlinkCmpMenuSelection", { fg = c.fg0, bg = c.bg4 })
	hi("BlinkCmpScrollBarThumb", { bg = c.accent3 })
	hi("BlinkCmpScrollBarGutter", { bg = c.bg2 })
	hi("BlinkCmpLabel", { fg = c.fg1 })
	hi("BlinkCmpLabelMatch", { fg = c.purple })
	hi("BlinkCmpLabelDeprecated", { fg = c.fg3, strikethrough = true })
	hi("BlinkCmpLabelDetail", { fg = c.fg3 })
	hi("BlinkCmpLabelDescription", { fg = c.fg3 })
	hi("BlinkCmpSource", { fg = c.fg3 })
	hi("BlinkCmpGhostText", { fg = c.fg3 })
	hi("BlinkCmpDoc", float)
	hi("BlinkCmpDocBorder", border)
	hi("BlinkCmpDocSeparator", { fg = c.grey3, bg = c.bg0 })
	hi("BlinkCmpDocCursorLine", { bg = c.bg3 })
	hi("BlinkCmpSignatureHelp", float)
	hi("BlinkCmpSignatureHelpBorder", border)
	hi("BlinkCmpSignatureHelpActiveParameter", { fg = c.warm1, bold = true })
	hi("BlinkCmpKind", { fg = c.accent2 })
	local kinds = {
		Text = c.fg1, Method = c.fg0, Function = c.fg0, Constructor = c.accent2,
		Field = c.fg1, Variable = c.fg1, Class = c.accent2, Interface = c.accent2,
		Module = c.accent2, Property = c.fg1, Unit = c.warm2, Value = c.warm2,
		Enum = c.accent2, Keyword = c.fg0, Snippet = c.warm1, Color = c.purple,
		File = c.fg1, Reference = c.fg1, Folder = c.accent1, EnumMember = c.purple,
		Constant = c.purple, Struct = c.accent2, Event = c.warm1, Operator = c.grey1,
		TypeParameter = c.accent2, Copilot = c.cyan,
	}
	for kind, color in pairs(kinds) do
		hi("BlinkCmpKind" .. kind, { fg = color })
	end

	-- LuaSnip
	hi("LuasnipChoiceNodeActive", { fg = c.orange })
	hi("LuasnipChoiceNodePassive", { fg = c.fg3 })
	hi("LuasnipInsertNodeActive", { fg = c.accent1 })
	hi("LuasnipInsertNodePassive", { fg = c.fg3 })

	-- Copilot
	hi("CopilotSuggestion", { fg = c.fg3 })
	hi("CopilotAnnotation", { fg = c.fg3 })

	-- =========================================================================
	-- UI / messages
	-- =========================================================================

	-- Noice
	hi("NoiceCmdline", { fg = c.fg1, bg = c.bg0 })
	hi("NoiceCmdlineIcon", { fg = c.accent1 })
	hi("NoiceCmdlineIconSearch", { fg = c.warm1 })
	hi("NoiceCmdlinePrompt", { fg = c.accent1 })
	hi("NoiceCmdlinePopup", float)
	hi("NoiceCmdlinePopupBorder", border)
	hi("NoiceCmdlinePopupBorderSearch", { fg = c.warm1, bg = c.bg0 })
	hi("NoiceCmdlinePopupTitle", { fg = c.accent1, bg = c.bg0, bold = true })
	hi("NoiceCmdlineBorder", { fg = c.grey3 })
	hi("NoicePopup", float)
	hi("NoicePopupBorder", border)
	hi("NoicePopupmenu", float)
	hi("NoicePopupmenuBorder", border)
	hi("NoicePopupmenuMatch", { fg = c.purple })
	hi("NoicePopupmenuSelected", { fg = c.fg0, bg = c.bg4 })
	hi("NoiceConfirm", float)
	hi("NoiceConfirmBorder", border)
	hi("NoiceMini", { fg = c.fg2, bg = c.bg2 })
	hi("NoiceSplit", { fg = c.fg1, bg = c.bg2 })
	hi("NoiceSplitBorder", { fg = c.grey3 })
	hi("NoiceVirtualText", { fg = c.fg3 })
	hi("NoiceScrollbarThumb", { bg = c.accent3 })
	hi("NoiceLspProgressTitle", { fg = c.fg2 })
	hi("NoiceLspProgressClient", { fg = c.accent2 })
	hi("NoiceLspProgressSpinner", { fg = c.accent1 })
	hi("NoiceFormatProgressDone", { fg = c.bg1, bg = c.accent2 })
	hi("NoiceFormatProgressTodo", { fg = c.fg3, bg = c.bg3 })
	hi("NoiceFormatTitle", { fg = c.accent1, bold = true })
	hi("NoiceFormatKind", { fg = c.fg3 })
	hi("NoiceFormatDate", { fg = c.fg3 })
	hi("NoiceFormatEvent", { fg = c.fg3 })
	hi("NoiceFormatConfirm", { fg = c.fg1, bg = c.bg3 })
	hi("NoiceFormatConfirmDefault", { fg = c.bg1, bg = c.accent2 })

	-- nvim-notify
	hi("NotifyBackground", { bg = c.bg0 })
	local levels = {
		ERROR = c.red, WARN = c.orange, INFO = c.cyan, DEBUG = c.fg3, TRACE = c.purple,
	}
	for level, color in pairs(levels) do
		hi("Notify" .. level .. "Border", { fg = color, bg = c.bg0 })
		hi("Notify" .. level .. "Icon", { fg = color })
		hi("Notify" .. level .. "Title", { fg = color, bold = true })
		hi("Notify" .. level .. "Body", { fg = c.fg1, bg = c.bg0 })
	end
	hi("NotifyLogTime", { fg = c.fg3 })
	hi("NotifyLogTitle", { fg = c.fg2 })

	-- mini.notify
	hi("MiniNotifyNormal", float)
	hi("MiniNotifyBorder", border)
	hi("MiniNotifyTitle", { fg = c.accent1, bg = c.bg0, bold = true })

	-- which-key
	hi("WhichKey", { fg = c.accent1 })
	hi("WhichKeyNormal", float)
	hi("WhichKeyFloat", { bg = c.bg0 })
	hi("WhichKeyBorder", border)
	hi("WhichKeyTitle", { fg = c.accent1, bg = c.bg0, bold = true })
	hi("WhichKeyGroup", { fg = c.warm1 })
	hi("WhichKeyDesc", { fg = c.fg1 })
	hi("WhichKeyValue", { fg = c.fg3 })
	hi("WhichKeySeparator", { fg = c.fg3 })
	hi("WhichKeyIcon", { fg = c.accent2 })
	hi("WhichKeyIconAzure", { fg = c.cyan })
	hi("WhichKeyIconBlue", { fg = c.cyan })
	hi("WhichKeyIconCyan", { fg = c.cyan })
	hi("WhichKeyIconGreen", { fg = c.green })
	hi("WhichKeyIconGrey", { fg = c.fg3 })
	hi("WhichKeyIconOrange", { fg = c.orange })
	hi("WhichKeyIconPurple", { fg = c.purple })
	hi("WhichKeyIconRed", { fg = c.red })
	hi("WhichKeyIconYellow", { fg = c.yellow })

	-- mini.clue
	hi("MiniClueBorder", border)
	hi("MiniClueTitle", { fg = c.accent1, bg = c.bg0, bold = true })
	hi("MiniClueDescSingle", { fg = c.fg1 })
	hi("MiniClueDescGroup", { fg = c.warm1 })
	hi("MiniClueNextKey", { fg = c.accent1 })
	hi("MiniClueNextKeyWithPostkeys", { fg = c.purple })
	hi("MiniClueSeparator", { fg = c.fg3 })

	-- Dashboards
	hi("DashboardHeader", { fg = c.accent1 })
	hi("DashboardFooter", { fg = c.fg3, italic = true })
	hi("DashboardDesc", { fg = c.fg2 })
	hi("DashboardKey", { fg = c.warm1 })
	hi("DashboardIcon", { fg = c.accent2 })
	hi("DashboardShortCut", { fg = c.warm1 })
	hi("DashboardShortCutIcon", { fg = c.warm1 })
	hi("DashboardFiles", { fg = c.fg1 })
	hi("DashboardProjectTitle", { fg = c.accent1, bold = true })
	hi("DashboardProjectTitleIcon", { fg = c.accent2 })
	hi("DashboardProjectIcon", { fg = c.accent2 })
	hi("DashboardMruTitle", { fg = c.accent1, bold = true })
	hi("DashboardMruIcon", { fg = c.accent2 })
	hi("SnacksDashboardHeader", { fg = c.accent1 })
	hi("SnacksDashboardFooter", { fg = c.fg3, italic = true })
	hi("SnacksDashboardKey", { fg = c.warm1 })
	hi("SnacksDashboardDesc", { fg = c.fg2 })
	hi("SnacksDashboardIcon", { fg = c.accent2 })
	hi("SnacksDashboardTitle", { fg = c.accent1, bold = true })
	hi("SnacksDashboardDir", { fg = c.fg3 })
	hi("SnacksDashboardFile", { fg = c.fg1 })
	hi("SnacksDashboardSpecial", { fg = c.purple })
	hi("MiniStarterHeader", { fg = c.accent1 })
	hi("MiniStarterFooter", { fg = c.fg3, italic = true })
	hi("MiniStarterSection", { fg = c.accent2, bold = true })
	hi("MiniStarterItem", { fg = c.fg1 })
	hi("MiniStarterItemPrefix", { fg = c.warm1 })
	hi("MiniStarterItemBullet", { fg = c.fg3 })
	hi("MiniStarterQuery", { fg = c.purple })

	-- Snacks
	hi("SnacksNormal", float)
	hi("SnacksWinBar", { fg = c.fg2, bg = c.bg0 })
	hi("SnacksBackdrop", { bg = "#000000" })
	hi("SnacksIndent", { fg = c.fg4 })
	hi("SnacksIndentScope", { fg = c.accent3 })
	hi("SnacksNotifierBorderError", { fg = c.red, bg = c.bg0 })
	hi("SnacksNotifierBorderWarn", { fg = c.orange, bg = c.bg0 })
	hi("SnacksNotifierBorderInfo", { fg = c.cyan, bg = c.bg0 })
	hi("SnacksNotifierBorderDebug", { fg = c.fg3, bg = c.bg0 })
	hi("SnacksNotifierBorderTrace", { fg = c.purple, bg = c.bg0 })
	hi("SnacksNotifierTitleError", { fg = c.red, bold = true })
	hi("SnacksNotifierTitleWarn", { fg = c.orange, bold = true })
	hi("SnacksNotifierTitleInfo", { fg = c.cyan, bold = true })
	hi("SnacksNotifierTitleDebug", { fg = c.fg3, bold = true })
	hi("SnacksNotifierTitleTrace", { fg = c.purple, bold = true })
	hi("SnacksInputBorder", border)
	hi("SnacksInputTitle", { fg = c.accent1, bg = c.bg0, bold = true })
	hi("SnacksPickerBorder", border)
	hi("SnacksPickerMatch", { fg = c.purple })
	hi("SnacksPickerDir", { fg = c.fg3 })
	hi("SnacksPickerPathHidden", { fg = c.fg3 })
	hi("SnacksPickerPathIgnored", { fg = c.fg3 })
	hi("SnacksPickerSelected", { fg = c.purple })
	hi("SnacksPickerTotals", { fg = c.fg3 })

	-- Mason
	hi("MasonNormal", float)
	hi("MasonBackdrop", { bg = c.bg0 })
	hi("MasonHeader", { fg = c.bg1, bg = c.accent1, bold = true })
	hi("MasonHeaderSecondary", { fg = c.bg1, bg = c.warm1, bold = true })
	hi("MasonHeading", { fg = c.accent1, bold = true })
	hi("MasonHighlight", { fg = c.purple })
	hi("MasonHighlightBlock", { fg = c.bg1, bg = c.purple })
	hi("MasonHighlightBlockBold", { fg = c.bg1, bg = c.purple, bold = true })
	hi("MasonHighlightSecondary", { fg = c.warm1 })
	hi("MasonHighlightBlockSecondary", { fg = c.bg1, bg = c.warm1 })
	hi("MasonHighlightBlockBoldSecondary", { fg = c.bg1, bg = c.warm1, bold = true })
	hi("MasonMuted", { fg = c.fg3 })
	hi("MasonMutedBlock", { fg = c.fg2, bg = c.bg3 })
	hi("MasonMutedBlockBold", { fg = c.fg2, bg = c.bg3, bold = true })
	hi("MasonLink", { fg = c.cyan })
	hi("MasonError", { fg = c.red })
	hi("MasonWarning", { fg = c.orange })

	-- Lazy.nvim
	hi("LazyNormal", float)
	hi("LazyH1", { fg = c.accent1, bold = true })
	hi("LazyH2", { fg = c.accent2, bold = true })
	hi("LazyButton", { fg = c.fg1, bg = c.bg3 })
	hi("LazyButtonActive", { fg = c.bg1, bg = c.accent1, bold = true })
	hi("LazySpecial", { fg = c.warm1 })
	hi("LazyProp", { fg = c.fg3 })
	hi("LazyDimmed", { fg = c.fg3 })
	hi("LazyReasonPlugin", { fg = c.accent1 })

	-- =========================================================================
	-- Tabline / statusline
	-- =========================================================================

	-- bufferline.nvim: selected = active tab, others = inactive tab
	local bl_bg = { [""] = c.bg0, Visible = c.bg0, Selected = c.bg1 }
	local function bl(name, fg, extra)
		for state, bg in pairs(bl_bg) do
			local fgc = fg
			if type(fg) == "table" then
				fgc = fg[state] or fg[""]
			end
			hi("BufferLine" .. name .. state, vim.tbl_extend("force", { fg = fgc, bg = bg }, extra or {}))
		end
	end
	hi("BufferLineFill", { bg = c.bg0 })
	hi("BufferLineBackground", { fg = c.fg2, bg = c.bg0 })
	hi("BufferLineBufferVisible", { fg = c.fg1, bg = c.bg0 })
	hi("BufferLineBufferSelected", { fg = c.fg0, bg = c.bg1, bold = true })
	local fg_states = { [""] = c.fg2, Visible = c.fg1, Selected = c.fg0 }
	bl("CloseButton", { [""] = c.fg3, Visible = c.fg3, Selected = c.fg2 })
	bl("Numbers", fg_states)
	bl("Duplicate", { [""] = c.fg3, Visible = c.fg3, Selected = c.fg2 }, { italic = true })
	bl("Modified", c.orange)
	bl("Separator", c.bg0)
	hi("BufferLineSeparatorSelected", { fg = c.bg0, bg = c.bg1 })
	hi("BufferLineIndicatorVisible", { fg = c.bg0, bg = c.bg0 })
	hi("BufferLineIndicatorSelected", { fg = c.purple, bg = c.bg1 })
	hi("BufferLineTab", { fg = c.fg2, bg = c.bg0 })
	hi("BufferLineTabSelected", { fg = c.fg0, bg = c.bg1, bold = true })
	hi("BufferLineTabSeparator", { fg = c.bg0, bg = c.bg0 })
	hi("BufferLineTabSeparatorSelected", { fg = c.bg1, bg = c.bg1 })
	hi("BufferLineTabClose", { fg = c.fg3, bg = c.bg0 })
	hi("BufferLineTruncMarker", { fg = c.fg3, bg = c.bg0 })
	hi("BufferLineOffsetSeparator", { fg = c.grey3, bg = c.bg2 })
	bl("Pick", c.red, { bold = true, italic = true })
	hi("BufferLinePick", { fg = c.red, bg = c.bg0, bold = true, italic = true })
	local diag = { Error = c.red, Warning = c.orange, Info = c.cyan, Hint = c.accent2 }
	for name, color in pairs(diag) do
		bl(name, color)
		bl(name .. "Diagnostic", color)
	end

	-- mini.tabline
	hi("MiniTablineCurrent", { fg = c.fg0, bg = c.bg1, bold = true })
	hi("MiniTablineVisible", { fg = c.fg1, bg = c.bg0 })
	hi("MiniTablineHidden", { fg = c.fg2, bg = c.bg0 })
	hi("MiniTablineModifiedCurrent", { fg = c.orange, bg = c.bg1, bold = true })
	hi("MiniTablineModifiedVisible", { fg = c.orange, bg = c.bg0 })
	hi("MiniTablineModifiedHidden", { fg = c.orange, bg = c.bg0 })
	hi("MiniTablineFill", { bg = c.bg0 })
	hi("MiniTablineTabpagesection", { fg = c.bg1, bg = c.accent1, bold = true })

	-- lualine (mode groups; the full theme lives in lualine/themes/tenebris.lua)
	hi("LualineNormalA", { fg = c.bg1, bg = c.accent1, bold = true })
	hi("LualineInsertA", { fg = c.bg1, bg = c.warm1, bold = true })
	hi("LualineVisualA", { fg = c.bg1, bg = c.accent2, bold = true })
	hi("LualineCommandA", { fg = c.bg1, bg = c.warm2, bold = true })

	-- mini.statusline
	hi("MiniStatuslineModeNormal", { fg = c.bg1, bg = c.accent1, bold = true })
	hi("MiniStatuslineModeInsert", { fg = c.bg1, bg = c.warm1, bold = true })
	hi("MiniStatuslineModeVisual", { fg = c.bg1, bg = c.accent2, bold = true })
	hi("MiniStatuslineModeCommand", { fg = c.bg1, bg = c.warm2, bold = true })
	hi("MiniStatuslineModeReplace", { fg = c.bg1, bg = c.orange, bold = true })
	hi("MiniStatuslineModeOther", { fg = c.bg1, bg = c.grey1, bold = true })
	hi("MiniStatuslineDevinfo", { fg = c.fg2, bg = c.bg3 })
	hi("MiniStatuslineFilename", { fg = c.fg2, bg = c.bg2 })
	hi("MiniStatuslineFileinfo", { fg = c.fg3, bg = c.bg2 })
	hi("MiniStatuslineInactive", { fg = c.fg3, bg = c.bg0 })

	-- nvim-treesitter-context
	hi("TreesitterContext", { bg = c.bg2 })
	hi("TreesitterContextLineNumber", { fg = c.fg3, bg = c.bg2 })
	hi("TreesitterContextBottom", { underline = true, sp = c.grey3 })
	hi("TreesitterContextLineNumberBottom", { underline = true, sp = c.grey3 })
	hi("TreesitterContextSeparator", { fg = c.grey3 })

	-- =========================================================================
	-- Diagnostics / lists
	-- =========================================================================

	-- Trouble
	hi("TroubleNormal", { fg = c.fg1, bg = c.bg2 })
	hi("TroubleNormalNC", { fg = c.fg1, bg = c.bg2 })
	hi("TroubleText", { fg = c.fg1 })
	hi("TroubleCount", { fg = c.purple, bg = c.bg3 })
	hi("TroublePos", { fg = c.fg3 })
	hi("TroubleSource", { fg = c.fg3 })
	hi("TroubleCode", { fg = c.fg3 })
	hi("TroubleDirectory", { fg = c.fg2 })
	hi("TroubleFilename", { fg = c.accent1 })
	hi("TroubleBasename", { fg = c.accent1 })
	hi("TroublePreview", { bg = c.bg4 })
	hi("TroubleIndent", { fg = c.fg4 })
	hi("TroubleIndentFoldOpen", { fg = c.fg3 })
	hi("TroubleIndentFoldClosed", { fg = c.fg3 })

	-- todo-comments
	hi("TodoBgTODO", { fg = c.bg1, bg = c.accent2, bold = true })
	hi("TodoBgFIX", { fg = c.bg1, bg = c.red, bold = true })
	hi("TodoBgHACK", { fg = c.bg1, bg = c.orange, bold = true })
	hi("TodoBgWARN", { fg = c.bg1, bg = c.orange, bold = true })
	hi("TodoBgPERF", { fg = c.bg1, bg = c.purple, bold = true })
	hi("TodoBgNOTE", { fg = c.bg1, bg = c.cyan, bold = true })
	hi("TodoBgTEST", { fg = c.bg1, bg = c.purple, bold = true })
	hi("TodoFgTODO", { fg = c.accent2 })
	hi("TodoFgFIX", { fg = c.red })
	hi("TodoFgHACK", { fg = c.orange })
	hi("TodoFgWARN", { fg = c.orange })
	hi("TodoFgPERF", { fg = c.purple })
	hi("TodoFgNOTE", { fg = c.cyan })
	hi("TodoFgTEST", { fg = c.purple })
	hi("TodoSignTODO", { fg = c.accent2 })
	hi("TodoSignFIX", { fg = c.red })
	hi("TodoSignHACK", { fg = c.orange })
	hi("TodoSignWARN", { fg = c.orange })
	hi("TodoSignPERF", { fg = c.purple })
	hi("TodoSignNOTE", { fg = c.cyan })
	hi("TodoSignTEST", { fg = c.purple })

	-- mini.hipatterns
	hi("MiniHipatternsFixme", { fg = c.bg1, bg = c.red, bold = true })
	hi("MiniHipatternsHack", { fg = c.bg1, bg = c.orange, bold = true })
	hi("MiniHipatternsTodo", { fg = c.bg1, bg = c.accent2, bold = true })
	hi("MiniHipatternsNote", { fg = c.bg1, bg = c.cyan, bold = true })

	-- =========================================================================
	-- Editing helpers
	-- =========================================================================

	-- indent-blankline
	hi("IblIndent", { fg = c.fg4 })
	hi("IblWhitespace", { fg = c.fg4 })
	hi("IblScope", { fg = c.accent3 })

	-- mini.indentscope
	hi("MiniIndentscopeSymbol", { fg = c.accent3 })
	hi("MiniIndentscopePrefix", { nocombine = true })

	-- mini.surround / cursorword / jump / pairs / trailspace / operators
	hi("MiniSurround", { fg = c.bg1, bg = c.warm1 })
	hi("MiniCursorword", { bg = c.ref_weak })
	hi("MiniCursorwordCurrent", { bg = c.ref_weak })
	hi("MiniJump", { fg = c.warm1, bold = true, underline = true })
	hi("MiniJump2dSpot", { fg = c.warm1, bold = true })
	hi("MiniJump2dSpotAhead", { fg = c.fg3 })
	hi("MiniJump2dDim", { fg = c.fg3 })
	hi("MiniTrailspace", { bg = c.red })
	hi("MiniOperatorsExchangeFrom", { bg = c.search })

	-- vim-illuminate
	hi("IlluminatedWordText", { bg = c.ref_weak })
	hi("IlluminatedWordRead", { bg = c.ref_weak })
	hi("IlluminatedWordWrite", { bg = c.ref_strong })

	-- nvim-ufo
	hi("UfoFoldedBg", { bg = c.bg3 })
	hi("UfoFoldedFg", { fg = c.fg2 })
	hi("UfoFoldedEllipsis", { fg = c.fg3 })
	hi("UfoPreviewSbar", { bg = c.accent3 })
	hi("UfoPreviewThumb", { bg = c.accent3 })

	-- grug-far.nvim
	hi("GrugFarInputLabel", { fg = c.accent2 })
	hi("GrugFarInputPlaceholder", { fg = c.fg3, italic = true })
	hi("GrugFarHelpHeader", { fg = c.fg2 })
	hi("GrugFarHelpHeaderKey", { fg = c.warm1 })
	hi("GrugFarHelpWinHeader", { fg = c.accent1, bold = true })
	hi("GrugFarHelpWinActionKey", { fg = c.warm1 })
	hi("GrugFarHelpWinActionPrefix", { fg = c.fg3 })
	hi("GrugFarHelpWinActionText", { fg = c.fg1 })
	hi("GrugFarHelpWinActionDescription", { fg = c.fg2 })
	hi("GrugFarResultsHeader", { fg = c.accent1, bold = true })
	hi("GrugFarResultsCmdHeader", { fg = c.fg3 })
	hi("GrugFarResultsStats", { fg = c.fg2 })
	hi("GrugFarResultsActionMessage", { fg = c.cyan })
	hi("GrugFarResultsPath", { fg = c.accent1 })
	hi("GrugFarResultsLineNr", { fg = c.fg3 })
	hi("GrugFarResultsLineColumn", { fg = c.fg3 })
	hi("GrugFarResultsColumnNr", { fg = c.fg3 })
	hi("GrugFarResultsCursorLineNo", { fg = c.accent2, bold = true })
	hi("GrugFarResultsNumberLabel", { fg = c.fg3 })
	hi("GrugFarResultsNumbersSeparator", { fg = c.fg4 })
	hi("GrugFarResultsLongLineStr", { fg = c.fg3 })
	hi("GrugFarResultsMatch", { bg = c.search_cur })
	hi("GrugFarResultsMatchAdded", { fg = c.git_add, bg = c.diff_add })
	hi("GrugFarResultsMatchRemoved", { fg = c.git_delete, bg = c.diff_delete })
	hi("GrugFarResultsAddIndicator", { fg = c.git_add })
	hi("GrugFarResultsChangeIndicator", { fg = c.git_change })
	hi("GrugFarResultsRemoveIndicator", { fg = c.git_delete })
	hi("GrugFarResultsDiffSeparatorIndicator", { fg = c.fg3 })
	hi("GrugFarCurrentMatch", { bg = c.search_cur })
	hi("GrugFarVisualBufrange", { bg = c.bg4 })

	-- =========================================================================
	-- Git
	-- =========================================================================

	-- gitsigns
	hi("GitSignsAdd", { fg = c.git_add })
	hi("GitSignsChange", { fg = c.git_change })
	hi("GitSignsDelete", { fg = c.git_delete })
	hi("GitSignsChangedelete", { fg = c.git_change })
	hi("GitSignsTopdelete", { fg = c.git_delete })
	hi("GitSignsUntracked", { fg = c.git_add })
	hi("GitSignsAddNr", { fg = c.git_add })
	hi("GitSignsChangeNr", { fg = c.git_change })
	hi("GitSignsDeleteNr", { fg = c.git_delete })
	hi("GitSignsAddLn", { bg = c.diff_add })
	hi("GitSignsChangeLn", { bg = c.diff_change })
	hi("GitSignsDeleteLn", { bg = c.diff_delete })
	hi("GitSignsAddInline", { bg = c.diff_add })
	hi("GitSignsChangeInline", { bg = c.diff_text })
	hi("GitSignsDeleteInline", { bg = c.diff_delete })
	hi("GitSignsAddLnInline", { bg = c.diff_add })
	hi("GitSignsChangeLnInline", { bg = c.diff_text })
	hi("GitSignsDeleteLnInline", { bg = c.diff_delete })
	hi("GitSignsAddPreview", { fg = c.git_add, bg = c.diff_add })
	hi("GitSignsDeletePreview", { fg = c.git_delete, bg = c.diff_delete })
	hi("GitSignsAddVirtLn", { bg = c.diff_add })
	hi("GitSignsChangeVirtLn", { bg = c.diff_change })
	hi("GitSignsDeleteVirtLn", { bg = c.diff_delete })
	hi("GitSignsCurrentLineBlame", { fg = c.fg3, italic = true })
	hi("GitSignsVirtLnum", { fg = c.fg3 })

	-- mini.diff
	hi("MiniDiffSignAdd", { fg = c.git_add })
	hi("MiniDiffSignChange", { fg = c.git_change })
	hi("MiniDiffSignDelete", { fg = c.git_delete })
	hi("MiniDiffOverAdd", { bg = c.diff_add })
	hi("MiniDiffOverChange", { bg = c.diff_text })
	hi("MiniDiffOverContext", { bg = c.diff_change })
	hi("MiniDiffOverDelete", { bg = c.diff_delete })

	-- diffview.nvim
	hi("DiffviewNormal", { fg = c.fg1, bg = c.bg1 })
	hi("DiffviewFilePanelTitle", { fg = c.accent1, bold = true })
	hi("DiffviewFilePanelCounter", { fg = c.purple, bold = true })
	hi("DiffviewFilePanelRootPath", { fg = c.accent1, bold = true })
	hi("DiffviewFilePanelFileName", { fg = c.fg1 })
	hi("DiffviewFilePanelPath", { fg = c.fg3 })
	hi("DiffviewFilePanelInsertions", { fg = c.git_add })
	hi("DiffviewFilePanelDeletions", { fg = c.git_delete })
	hi("DiffviewFilePanelSelected", { fg = c.fg0, bg = c.bg4 })
	hi("DiffviewFolderName", { fg = c.accent1 })
	hi("DiffviewFolderSign", { fg = c.accent2 })
	hi("DiffviewDim1", { fg = c.fg3 })
	hi("DiffviewStatusAdded", { fg = c.git_add })
	hi("DiffviewStatusUntracked", { fg = c.git_add })
	hi("DiffviewStatusModified", { fg = c.git_change })
	hi("DiffviewStatusRenamed", { fg = c.cyan })
	hi("DiffviewStatusCopied", { fg = c.cyan })
	hi("DiffviewStatusTypeChanged", { fg = c.orange })
	hi("DiffviewStatusUnmerged", { fg = c.orange })
	hi("DiffviewStatusUnknown", { fg = c.red })
	hi("DiffviewStatusDeleted", { fg = c.git_delete })
	hi("DiffviewStatusBroken", { fg = c.red })
	hi("DiffviewStatusIgnored", { fg = c.fg3 })
	hi("DiffviewDiffAddAsDelete", { bg = c.diff_delete })
	hi("DiffviewDiffDelete", { fg = c.fg4 })
	hi("DiffviewDiffDeleteDim", { fg = c.fg4 })

	-- neogit
	hi("NeogitNormal", float)
	hi("NeogitBranch", { fg = c.accent1, bold = true })
	hi("NeogitRemote", { fg = c.cyan, bold = true })
	hi("NeogitHunkHeader", { fg = c.fg1, bg = c.bg3 })
	hi("NeogitHunkHeaderHighlight", { fg = c.fg0, bg = c.bg4 })
	hi("NeogitDiffContext", { fg = c.fg2 })
	hi("NeogitDiffContextHighlight", { fg = c.fg1, bg = c.bg3 })
	hi("NeogitDiffAdd", { fg = c.git_add, bg = c.diff_add })
	hi("NeogitDiffAddHighlight", { fg = c.git_add, bg = c.diff_add })
	hi("NeogitDiffDelete", { fg = c.git_delete, bg = c.diff_delete })
	hi("NeogitDiffDeleteHighlight", { fg = c.git_delete, bg = c.diff_delete })
	hi("NeogitSectionHeader", { fg = c.accent1, bold = true })
	hi("NeogitChangeModified", { fg = c.git_change })
	hi("NeogitChangeAdded", { fg = c.git_add })
	hi("NeogitChangeDeleted", { fg = c.git_delete })
	hi("NeogitChangeRenamed", { fg = c.cyan })
	hi("NeogitChangeNewFile", { fg = c.git_add })
	hi("NeogitCursorLine", { bg = c.bg3 })

	-- =========================================================================
	-- Debugging
	-- =========================================================================

	-- nvim-dap
	hi("DapBreakpoint", { fg = c.red })
	hi("DapBreakpointCondition", { fg = c.orange })
	hi("DapBreakpointRejected", { fg = c.fg3 })
	hi("DapLogPoint", { fg = c.cyan })
	hi("DapStopped", { fg = c.green })
	hi("DapStoppedLine", { bg = c.diff_add })
	hi("NvimDapVirtualText", { fg = c.fg3, italic = true })
	hi("NvimDapVirtualTextChanged", { fg = c.orange, italic = true })
	hi("NvimDapVirtualTextError", { fg = c.red, italic = true })
	hi("NvimDapVirtualTextInfo", { fg = c.cyan, italic = true })

	-- nvim-dap-ui
	hi("DapUINormal", { fg = c.fg1, bg = c.bg2 })
	hi("DapUIEndofBuffer", { fg = c.bg2 })
	hi("DapUIFloatNormal", float)
	hi("DapUIFloatBorder", border)
	hi("DapUIDecoration", { fg = c.grey3 })
	hi("DapUIScope", { fg = c.accent1, bold = true })
	hi("DapUIType", { fg = c.accent2 })
	hi("DapUIValue", { fg = c.fg1 })
	hi("DapUIVariable", { fg = c.fg1 })
	hi("DapUIModifiedValue", { fg = c.orange, bold = true })
	hi("DapUISource", { fg = c.accent2 })
	hi("DapUILineNumber", { fg = c.warm2 })
	hi("DapUIFrameName", { fg = c.fg1 })
	hi("DapUICurrentFrameName", { fg = c.accent1, bold = true })
	hi("DapUIThread", { fg = c.green })
	hi("DapUIStoppedThread", { fg = c.accent1, bold = true })
	hi("DapUIWatchesEmpty", { fg = c.red })
	hi("DapUIWatchesValue", { fg = c.green })
	hi("DapUIWatchesError", { fg = c.red })
	hi("DapUIBreakpointsPath", { fg = c.accent1 })
	hi("DapUIBreakpointsInfo", { fg = c.green })
	hi("DapUIBreakpointsCurrentLine", { fg = c.accent1, bold = true })
	hi("DapUIBreakpointsLine", { fg = c.warm2 })
	hi("DapUIBreakpointsDisabledLine", { fg = c.fg3 })
	hi("DapUIPlayPause", { fg = c.green })
	hi("DapUIRestart", { fg = c.green })
	hi("DapUIStop", { fg = c.red })
	hi("DapUIStepOver", { fg = c.cyan })
	hi("DapUIStepInto", { fg = c.cyan })
	hi("DapUIStepOut", { fg = c.cyan })
	hi("DapUIStepBack", { fg = c.cyan })
	hi("DapUIUnavailable", { fg = c.fg3 })
	hi("DapUIWinSelect", { fg = c.accent1, bold = true })

	-- =========================================================================
	-- Writing / markdown / LaTeX
	-- =========================================================================

	-- render-markdown.nvim
	for i = 1, 6 do
		hi("RenderMarkdownH" .. i, { fg = c.accent1, bold = true })
		hi("RenderMarkdownH" .. i .. "Bg", { bg = c.bg3 })
	end
	hi("RenderMarkdownCode", { bg = c.bg2 })
	hi("RenderMarkdownCodeInline", { fg = c.purple, bg = c.bg3 })
	hi("RenderMarkdownBullet", { fg = c.accent2 })
	hi("RenderMarkdownQuote", { fg = c.fg2 })
	hi("RenderMarkdownDash", { fg = c.grey3 })
	hi("RenderMarkdownLink", { fg = c.cyan })
	hi("RenderMarkdownChecked", { fg = c.green })
	hi("RenderMarkdownUnchecked", { fg = c.fg3 })
	hi("RenderMarkdownTableHead", { fg = c.accent1, bold = true })
	hi("RenderMarkdownTableRow", { fg = c.fg2 })
	hi("RenderMarkdownSuccess", { fg = c.green })
	hi("RenderMarkdownInfo", { fg = c.cyan })
	hi("RenderMarkdownHint", { fg = c.accent2 })
	hi("RenderMarkdownWarn", { fg = c.orange })
	hi("RenderMarkdownError", { fg = c.red })

	-- markview.nvim
	for i = 1, 6 do
		hi("MarkviewHeading" .. i, { fg = c.accent1, bg = c.bg3, bold = true })
		hi("MarkviewHeading" .. i .. "Sign", { fg = c.accent1 })
	end
	hi("MarkviewCode", { bg = c.bg2 })
	hi("MarkviewCodeInfo", { fg = c.fg3, bg = c.bg2 })
	hi("MarkviewInlineCode", { fg = c.purple, bg = c.bg3 })
	hi("MarkviewListItemPlus", { fg = c.accent2 })
	hi("MarkviewListItemMinus", { fg = c.accent2 })
	hi("MarkviewListItemStar", { fg = c.accent2 })
	hi("MarkviewBlockQuoteDefault", { fg = c.fg2 })
	hi("MarkviewHyperlink", { fg = c.cyan, underline = true })
	hi("MarkviewTableHeader", { fg = c.accent1, bold = true })
	hi("MarkviewTableBorder", { fg = c.grey3 })

	-- vimtex
	hi("texMathZone", { fg = c.warm2 })
	hi("texMathCmd", { fg = c.accent2 })
	hi("texCmd", { fg = c.accent2 })
	hi("texCmdEnv", { fg = c.fg0, bold = cfg.bold_keywords })
	hi("texEnvName", { fg = c.accent1 })
	hi("texSection", { fg = c.accent1, bold = true })
	hi("texRefArg", { fg = c.purple })
	hi("texCite", { fg = c.cyan })

	-- Aerial / symbol outlines
	hi("AerialLine", { bg = c.bg4 })
	hi("AerialGuide", { fg = c.fg4 })
	hi("AerialNormal", { fg = c.fg1 })

	-- Undotree (links into core groups so it follows the palette)
	link("UndotreeSavedBig", "DiagnosticOk")
	link("UndotreeSavedSmall", "Comment")
	link("UndotreeCurrent", "Title")
	link("UndotreeNext", "Special")
	link("UndotreeBranch", "Delimiter")
	link("UndotreeSeq", "Number")
end
