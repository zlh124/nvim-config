# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a Neovim configuration using **lazy.nvim** as the plugin manager. The configuration follows a modular structure:

- `init.lua` - Entry point that loads config modules in order: options → lazy → keymaps
- `lua/config/` - Core configuration (options, keymaps, lazy setup, wrap behavior)
- `lua/plugins/` - Plugin specifications (each file returns a lazy.nvim plugin spec)

### Plugin Loading

Lazy.nvim automatically loads all plugin specs from `lua/plugins/*.lua`. Each plugin file returns a table with plugin configurations. The plugin manager handles installation, lazy-loading, and dependency management.

### Configuration Flow

1. `options.lua` sets up editor behavior (leader key, line numbers, tabs, folding, diagnostics)
2. `lazy.lua` bootstraps lazy.nvim and loads all plugins from `lua/plugins/`
3. `keymaps.lua` defines global keybindings (requires DAP to be loaded first)
4. `wrap.lua` is loaded via autocmd - enables line wrapping only for text-based filetypes

## Key Components

### LSP Setup
- **Mason** (`mason.lua`) - LSP/DAP/linter installer, auto-installs pyright and lua_ls
- **LSP Config** (`lsp.lua`) - Configures pyright and lua_ls with nvim-cmp capabilities
- Uses the new `vim.lsp.config()` and `vim.lsp.enable()` API (Neovim 0.11+)

### Completion
- **nvim-cmp** (`cmp.lua`) - Completion engine with LSP, buffer, and path sources
- Integrates with nvim-autopairs for auto-closing brackets after completion

### Debugging
- **nvim-dap** (`dap.lua`) - Debug Adapter Protocol support
- **nvim-dap-ui** - Automatic UI that opens/closes with debug sessions
- **nvim-dap-python** - Python debugging configured to use system `python`
- Keybindings defined in `keymaps.lua`: F5 (continue), F10 (step over), F11 (step into), F12 (step out), `<leader>b` (breakpoint)

### Formatting
- **conform.nvim** (`format.lua`) - Formatter with format-on-save enabled
- Python: ruff_format → black (fallback chain)
- Lua: stylua
- JSON: jq
- Markdown: prettier
- Keybinding: `<leader>f` for manual format

### File Navigation
- **Oil.nvim** (`oil.lua`) - Buffer-based file explorer, keybinding: `<leader>e`
- **Telescope** (`telescope.lua`) - Fuzzy finder for files/grep/buffers/help
  - `<leader>ss` - find files
  - `<leader>sg` - live grep
  - `<leader>sb` - buffers
  - `<leader>sh` - help tags

### Git Integration
- **Neogit** (`git.lua`) - Magit-like Git interface, keybinding: `<leader>g`
- Depends on plenary.nvim and diffview.nvim

### Terminal
- **ToggleTerm** (`terminal.lua`) - Integrated terminal
- `<C-\>` toggles terminal (works in normal and terminal mode)
- `<leader>tf` opens floating terminal
- Includes lazygit integration (function `_LAZYGIT_TOGGLE()` available)

### Syntax & UI
- **Treesitter** (`treesitter.lua`) - Syntax highlighting and code understanding
  - Parsers: lua, python, c, cpp, bash, json, markdown, java, yaml
  - Used for folding (`foldmethod=expr`, `foldexpr=nvim_treesitter#foldexpr()`)
- **Barbecue** (`header.lua`) - Breadcrumb navigation in winbar using LSP
- **indent-blankline** (`indent.lua`) - Indentation guides with scope highlighting
- **render-markdown** (`markdown.lua`) - Live markdown rendering, toggle with `<leader>md`
- **tokyonight** (`colorscheme.lua`) - Color scheme with custom popup menu colors

## Important Behaviors

### Working Directory Management
On VimEnter, the config automatically sets the working directory:
- If no arguments: sets to home directory
- If directory argument: sets to that directory
- If file argument: sets to parent directory
- Handles oil.nvim URIs by stripping `oil://` prefix

### Text Wrapping
Wrap is disabled by default (for code). Auto-enabled for markdown, text, gitcommit, and typst files with linebreak and breakindent.

### Diagnostics
Inline virtual text enabled with `●` prefix, 4-space spacing. Signs, underline, and severity sorting enabled.

### Leader Key
Space (`" "`) is the leader key.

## Common Keybindings

- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>e` - Open Oil file explorer
- `gd` - Go to definition (LSP)
- `gD` - Go to declaration (LSP)
- `<leader>f` - Format buffer
- `<leader>g` - Open Neogit
- `<leader>md` - Toggle markdown rendering

## Adding New Plugins

Create a new file in `lua/plugins/` that returns a lazy.nvim plugin spec:

```lua
return {
  {
    "author/plugin-name",
    dependencies = { "other/plugin" },
    config = function()
      require("plugin-name").setup({})
    end,
  },
}
```

Lazy.nvim will automatically detect and load it on next restart.

## Language Support

Currently configured for:
- **Python** - LSP (pyright), formatting (ruff_format/black), debugging (dap-python)
- **Lua** - LSP (lua_ls), formatting (stylua)

To add a new language:
1. Add LSP server to `mason.lua` ensure_installed list
2. Add server name to `lsp.lua` servers table
3. Add formatter to `format.lua` formatters_by_ft
4. Add treesitter parser to `treesitter.lua` ensure_installed
