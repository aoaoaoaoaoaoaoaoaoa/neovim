# Neovim Config

Minimal Neovim setup focused on simplicity and speed.

## Installation

Clone the repository:

```bash
git clone https://github.com/aoaoaoaoaoaoaoaoaoa/neovim ~/.config/nvim
```

## First Launch

1. Start Neovim:

```bash
nvim
```

2. Install plugins:

```
:Lazy sync
```

3. Restart Neovim or press:

```
Shift + S
```

## LSP & Tools

Open Mason to install language servers and tools:

```
:Mason
```

Install what you need (e.g. Python, Lua, etc.)

## Requirements

Some features may require additional tools:

* `fd` (for fast file searching)

To verify your setup:

```
:checkhealth
```

## File Locations

Neovim uses the following directories:

```
~/.config/nvim        → config files
~/.local/share/nvim   → plugins and data
~/.local/state/nvim   → logs and state
```

## Notes

* Minimal configuration by design
* Add only what you actually need
* Keep it clean, keep it fast

---
