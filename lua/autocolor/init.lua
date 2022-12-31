local M = {}
vim.cmd [[let g:colors = getcompletion('','color')]]

function ChangeColor(values)
    vim.cmd("colorscheme " .. values.theme)
    if values.transparent then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end
function M.setup(config)

end

return M
