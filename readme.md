# tokisuno's Neovim Setup
Neovim 0.10+ configuration

# interesting features
- remapped ; to : for ease of access
- mini.plugins are everywhere
- norg
- autosaving
- lsp
- mason cmp
- snippets

# structure
- `nvim/init.lua`
    - entry point for lua config files
- `nvim/after/ftplugin`
    - filetype specific configurations
- `nvim/lua/config/`
    - opts
    - remaps
    - lazy.nvim setup
- `nvim/lua/plugins/`
    - every single plugin i use
