# switcher.nvim

A simple and lightweight Neovim plugin to switch keywords.

Ever found yourself wanting to quickly swap `true` for `false`, or `==` for `!=`? `switcher.nvim` does just that. Place your cursor on a supported word, press a key, and watch the magic happen.

## ✨ Features

- Switch boolean values (`true` ↔ `false`, `True` ↔ `False`, etc.).
- Switch comparison operators (`==` ↔ `!=`).
- Simple and easy to configure.
- Lightweight and focused.

## 💾 Installation

Install the plugin with your favorite plugin manager.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    'lucas-garcia-rubio/switcher.nvim',
    opts = {
        keymap = '<leader>z',
    }
}
```

## 🚧 TODO List

- [ ] Custom configuration of your own switches
- [ ] Alternate every boolean word in multiple lines

## 💡 Inspiration

Inspired by [rmagatti/alternate-toggler](https://github.com/rmagatti/alternate-toggler). Thanks for the simple idea that motivated me on writing my very first public plugin.
