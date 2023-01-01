# Autocolor

![autocolor](./Example.mov)

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
        language = "*.default", -- default means any filetype not declared on setup
        transparent = true, -- if you want no background (default false)
        theme = "nightfox" --theme name 
    },
    {
        language = "*.lua", -- file extension
        theme = "lunar"
    },
    {
        language = {"*.js","*.html","*.astro"},  -- you can also pass tables with file entensions
        theme = "lunar"
        -- you can leave the transparent variable out
    },
    {
        language = "*.cpp",
        theme = "gruvbox"
    }
})

```

## Important notes 
- All themes declared in setup must be installed 

