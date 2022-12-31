local M = {}
vim.cmd [[let g:colors = getcompletion('','color')]]

function ChangeColor(values)
    vim.cmd("colorscheme " .. values.theme)
    if values.transparent then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

function CreateAutoCmd(values)
    if values.language == ".default" then
        vim.api.nvim_create_autocmd({ "VimEnter", "BufLeave" }, {
            callback = function()
                ChangeColor(values)
            end,
            group = "AutoColor"
        })

    else
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
            pattern = "*" .. values.language,
            callback = function()
                ChangeColor(values)
            end,
            group = "AutoColor"
        })

    end
end

function M.setup(config)
    vim.api.nvim_create_augroup("AutoColor", { clear = true })
    if not config then
        return

    else
        for index, value in ipairs(config) do
            if not vim.tbl_contains(vim.g.colors, value.theme) then
                vim.api.nvim_err_writeln("error: theme " .. value.theme .. " does not exist")
            else

                CreateAutoCmd(value)
            end
        end
    end
end

return M
