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

end

return M
