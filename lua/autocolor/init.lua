-- final table
local M = {}

-- get list of available themes
vim.cmd [[let g:colors = getcompletion('','color')]]

-- call lualine
local ok, lualine = pcall(require, "lualine")

-- check if current window is a floating window
function IsFloating()
    -- if relative = '' -> window is not a floating window
    local conf = vim.api.nvim_win_get_config(0).relative
    if conf ~= '' then
        return true
    else
        return false
    end

end

-- change color function
function ChangeColor(values)
    -- check if current window is a floating window
    if IsFloating() == false then
        -- change colorscheme
        vim.cmd("colorscheme " .. values.theme)
        -- set transparent window
        if values.transparent then
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
        -- reset lualine if installed
        if ok then
            lualine.setup()
        end
    end
end

-- create autocommand for files
function CreateAutoCmd(values)
    -- check if language is default
    if values.language == "*.default" then
        -- autocommand without patterns
        vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
            callback = function()
                ChangeColor(values)
            end,
            group = "AutoColor"
        })

    else
        -- autocommand with patterns
        vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
            pattern = values.language,
            callback = function()
                ChangeColor(values)
            end,
            group = "AutoColor"
        })

    end
end

function M.setup(config)
    -- autogroup
    vim.api.nvim_create_augroup("AutoColor", { clear = true })
    -- if there is no config
    if not config then
        return

    else
        -- check tables of config
        for index, value in ipairs(config) do
            -- if theme is not installed
            if not vim.tbl_contains(vim.g.colors, value.theme) then
                vim.api.nvim_err_writeln("error: theme " .. value.theme .. " is not installed")
            else
                -- make autocommand based on variables
                CreateAutoCmd(value)
            end
        end
    end
end

return M
