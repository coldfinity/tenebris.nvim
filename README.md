# tenebris.nvim

> *tenebris* — Latin for **darkness, shadow, obscurity**

A dark, minimal Neovim colorscheme built around pure blacks and grey highlights. Designed to feel clean and precise without distraction.

---

## Palette

| Role | Hex |
|------|-----|
| Background (deep) | `#070707` |
| Background (main) | `#0c0c0c` |
| Background (sidebar) | `#111111` |
| Cursorline | `#181818` |
| Foreground | `#c8c8c8` |
| Foreground (dim) | `#787878` |
| Accent (light) | `#d8d8d8` |
| Accent (mid) | `#b0b0b0` |
| Strings | `#a8a4a0` |
| Borders | `#222222` |

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

- **Treesitter** — full semantic highlight groups
- **LSP diagnostics** — errors, warnings, hints, virtual text, signs
- **Telescope**
- **nvim-tree** / **neo-tree**
- **nvim-cmp**
- **which-key**
- **indent-blankline** (ibl)
- **Noice** / **nvim-notify**
- **flash.nvim**
- **mini.nvim** (statusline, cursorword, jump)
- **snacks.nvim** (picker, dashboard)
- **lazy.nvim**
- **Gitsigns** + diff highlighting

---

## License

MIT
