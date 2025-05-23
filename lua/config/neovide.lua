local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'
local conf = require 'telescope.config'

local font_mod = ":h12"

local fonts = {
    "0xProto Nerd Font",
    "JetBrainsMono Nerd Font",
    "CaskaydiaCove Nerd Font"
}

if not vim.g.neovide then return end

print("detected neovide environment")

vim.opt.clipboard = "unnamedplus"

-- vim.opt.guifont =
vim.opt.guifont = fonts[1] .. font_mod
-- vim.opt.guifont = { "JetBrains Mono NF", "h18" }
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_opacity = 0.8
vim.g.neovide_fullscreen = false


local SCALE_FACTOR = 0.1
Map({ "n", "i" }, "<F11>", function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end)

-- dynamic scaling
Map({ "n", "i" }, "<C-+>", function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + SCALE_FACTOR end)
Map({ "n", "i" }, "<C-->", function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - SCALE_FACTOR end)

Map({ "n", "i" }, "<A-+>", function() vim.g.neovide_opacity = vim.g.neovide_transparency + SCALE_FACTOR end)
Map({ "n", "i" }, "<A-->", function() vim.g.neovide_opacity = vim.g.neovide_transparency - SCALE_FACTOR end)

Map({ "n", "i" }, "<C-0>", function() vim.g.neovide_scale_factor = 1 end)

local select_font = function(opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "Fonts",
        finder = finders.new_table {
            results = fonts
        },
        sorter = conf.values.generic_sorter(opts),
        attach_mappings = function(bufnr, _)
            actions.select_default:replace(function()
                actions.close(bufnr)
                local selection = action_state.get_selected_entry()
                vim.opt.guifont = selection[1] .. font_mod
            end)
            return true
        end,
    }):find()
end

Map('n', "<leader>o", select_font)
