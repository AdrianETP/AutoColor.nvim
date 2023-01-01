# Autocolor

- This is a plugin made to change neovim themes based on what filetype you are on

## install 
### for vimplug 

```
Plug 'Adrian-007391/AutoColor'
```
### for packer 

```lua
use('Adrian-007391/AutoColor')
```

## Setup 

```lua
local ok , autocolor = pcall(require, 'autoColor')
if not ok then 
    return 
end 
autocolor.setup({})

```
- The setup function will contain a table that modifies the colorscheme based on the filetype

### Example 

```lua 
local ok , autocolor = pcall(require , "autoColor") 

if not ok then 
    return 
end

autocolor.setup({
    {
        language = ".default", -- default means any filetype not declared on setup
        transparent = true, -- if you want no background (default false)
        theme = "nightfox" --theme name 
    },
    {
        language = ".js", -- the extension of the filetype (in this case, Javascript)
        theme = "lunar"
        -- you can leave the transparent variable out
    },
    {
        language = ".lua",
        theme = "lunar"
    },
    {
        language = ".cpp",
        theme = "gruvbox"
    }
})

```

## Important notes 
- All themes declared in setup must be installed 
- Plugins such as [Telescope](https://github.com/nvim-telescope/telescope.nvim) or [Harpoon](https://github.com/ThePrimeagen/harpoon) will default to the default theme
    - any floating window plugin

