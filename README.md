# tenebris.nvim

> *tenebris* — Latin for **darkness, shadow, obscurity**

A dark, minimal Neovim colorscheme built around pure blacks and grey highlights. Designed to feel clean and precise without distraction.

---

## Palette

| Role | Dark | Light |
|------|------|-------|
| Background (floats, tabs) | `#070707` | `#e5e4e9` |
| Background (main) | `#0c0c0c` | `#f2f2f2` |
| Background (sidebar, statusline) | `#111111` | `#ebeaee` |
| Cursorline | `#181818` | `#ebebeb` |
| Selection | `#202020` | `#d3d3d3` |
| Foreground | `#c8c8c8` | `#3d3d3d` |
| Comments | `#787878` | `#707070` |
| Functions, keywords | `#ebebeb` | `#262626` |
| Types, imports | `#b0b0b0` | `#4a4a4a` |
| Strings, constants | `#ae98b8` | `#7b5d8e` |
| Numbers | `#888480` | `#6e6a66` |
| Borders | `#222222` | `#cfcdd5` |

### Light variant

Set `vim.o.background = "light"` before `:colorscheme tenebris` (or after, then re-run it) to get Tenebris Light, ported from the VS Code theme: `#f2f2f2` background, `#3d3d3d` text, `#7b5d8e` strings.

---

## Installation

### [vim.pack](https://neovim.io/doc/user/vim.pack.html) (Neovim 0.12+ built-in)

```lua
vim.pack.add({
  "https://github.com/coldfinity/tenebris.nvim",
})
```

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "coldfinity/tenebris.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tenebris").setup()
    vim.cmd("colorscheme tenebris")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "coldfinity/tenebris.nvim",
  config = function()
    require("tenebris").setup()
    vim.cmd("colorscheme tenebris")
  end
}
```

---

## Setup

`setup()` is optional — all options have defaults.

```lua
require("tenebris").setup({
  transparent     = false,  -- remove background colors
  italic_comments = true,   -- italic comments
  bold_keywords   = true,   -- bold keywords

  on_colors = function(c)
    -- override palette colors
    -- c.purple1 = "#ffffff"
  end,

  on_highlights = function(hl, c)
    -- override specific highlight groups
    -- hl.Comment = { fg = c.fg3, italic = false }
  end,
})

vim.cmd("colorscheme tenebris")
```

---

## Lualine

A lualine theme is included. Set `theme = "tenebris"` in your lualine config:

```lua
require("lualine").setup({
  options = { theme = "tenebris" }
})
```

---

## Plugin Support

- **Treesitter** — every standard highlight group
- **LSP diagnostics** — errors, warnings, hints, virtual text, signs
- **Pickers:** Telescope, fzf-lua, Harpoon, flash.nvim, leap.nvim
- **Explorers:** neo-tree, nvim-tree, oil.nvim, mini.files
- **Completion:** blink.cmp, nvim-cmp, LuaSnip, Copilot
- **UI:** Noice, nvim-notify, which-key, Snacks, dashboard-nvim, mason.nvim, lazy.nvim
- **Lines:** bufferline.nvim, lualine, nvim-treesitter-context, mini.statusline / tabline
- **Diagnostics:** Trouble, todo-comments
- **Git:** Gitsigns, Diffview, Neogit, mini.diff
- **Debugging:** nvim-dap, nvim-dap-ui
- **Editing:** indent-blankline, grug-far, vim-illuminate, nvim-ufo, mini.nvim (surround, cursorword, indentscope, jump, hipatterns, clue, notify, files)
- **Writing:** render-markdown, markview, vimtex

Plugin highlights live in `lua/tenebris/plugins.lua`.

---

## License

MIT
