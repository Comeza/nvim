local actions = require 'telescope.actions'
local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local sorters = require 'telescope.sorters'

local action_state = require 'telescope.actions.state'

--require 'nvim-web-devicons'.setup({
--    color_icons = false,
--    default = true
--})

local function SetTheme(color)
    if color == nil then return false end

    color = color or 'rose-pine'
    vim.cmd.colorscheme(color)
end

local themes = {
    ['gruvbox'] = function ()
        SetTheme('gruvbox')
    end,
    ['rosé-pine'] = function()
        require('rose-pine').setup({ disable_background = false })
        SetTheme('rose-pine')
    end,
    ['rusticated'] = function ()
        SetTheme('rusticated')
    end,
    ['no-clown-fiesta'] = function()
        require("no-clown-fiesta").setup({
            transparent = false, -- Enable this to disable the bg color
            styles = {
                comments = {},
                keywords = {},
                functions = {},
                variables = {},
                type = { bold = true },
            },
        })
        SetTheme('no-clown-fiesta')
    end
}

local mini = {
    layout_strategies = "vertical",
    layout_config = {
        height = 10,
        width = 0.3,
        prompt_position = "top"
    },
    sorting_strategy = "ascending",
}

local function ThemeNames()
    local names = {}
    local count = 1
    for k, _ in pairs(themes) do
        names[count] = k
        count = count + 1
    end
    return names
end

local opts = {
    finder = finders.new_table(ThemeNames()),
    sorter = sorters.get_generic_fuzzy_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
        map("i", "<CR>", function()
            local selected = action_state.get_selected_entry()
            themes[selected[1]]()
            actions.close(prompt_bufnr)
        end)
        return true
    end
}

local colors = pickers.new(mini, opts)

function SetColor()
    colors:find()
end

themes['no-clown-fiesta']()

vim.api.nvim_create_user_command('Color', SetColor, { nargs = 0 })
