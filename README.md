# tenebris.nvim

> *tenebris* — Latin for **darkness, shadow, obscurity**

A dark, moody Neovim colorscheme built around deep charcoal blacks and purposeful purple/pink accents. Designed to feel editorial and precise without being harsh.

---

## Palette

| Role | Hex | |
|------|-----|---|
| Background (deep) | `#0d0d0f` | ![](https://via.placeholder.com/12/0d0d0f/0d0d0f) |
| Background (main) | `#111114` | ![](https://via.placeholder.com/12/111114/111114) |
| Foreground | `#c8c5d4` | |
| Purple (primary) | `#c09af0` | keywords, functions |
| Purple (secondary) | `#a07dd8` | types, constructors |
| Pink (primary) | `#e8a0c0` | strings |
| Pink (secondary) | `#d07898` | specials, returns |
| Grey | `#7a7585` | operators, punctuation |

---

## Installation

### [vim.pack](https://neovim.io/doc/user/vim.pack.html) (Neovim 0.12+ built-in)

Add to your `init.lua` **before** any `require("tenebris")` calls:

```lua
vim.pack.add({
  "https://github.com/yourusername/tenebris.nvim",
})
require("tenebris").load()
```

`vim.pack.add()` installs the plugin on first run and loads it on every subsequent start. No separate setup step needed.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "yourusername/tenebris.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tenebris").load()
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "yourusername/tenebris.nvim",
  config = function()
    require("tenebris").load()
  end
}
```

### Manual

Copy `lua/tenebris.lua` into your Neovim config:

```
~/.config/nvim/lua/tenebris.lua
```

Then in your `init.lua`:

```lua
require("tenebris").load()
```

---

## Lualine Integration

```lua
local colors = require("tenebris").get_colors()

require("lualine").setup {
  options = {
    theme = {
      normal   = { a = { fg = colors.bg1, bg = colors.purple1, gui = "bold" },
                   b = { fg = colors.fg2, bg = colors.bg2 },
                   c = { fg = colors.fg3, bg = colors.bg1 } },
      insert   = { a = { fg = colors.bg1, bg = colors.pink1,   gui = "bold" } },
      visual   = { a = { fg = colors.bg1, bg = colors.purple2, gui = "bold" } },
      command  = { a = { fg = colors.bg1, bg = colors.pink2,   gui = "bold" } },
      inactive = { a = { fg = colors.fg3, bg = colors.bg0 },
                   b = { fg = colors.fg3, bg = colors.bg0 },
                   c = { fg = colors.fg3, bg = colors.bg0 } },
    },
  },
}
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
