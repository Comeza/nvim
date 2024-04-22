local M = {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
}

--#region HERE BEGINS MADNESS
--for some reason i thought "you know what, this one-time use needs a builder pattern"

---@alias Component { type: "button"|"text"|"group", val: string | table<number, Component>, opts: table }
---@alias Position "left"|"right"|"center"

---Creates a new default button
---@param text string|nil
local function new_button(text)
    ---@class ButtonBuilder
    local ButtonBuilder = {
        data = {
            type = "button",
            val = text,
            on_press = function() end
        }
    }

    ---What the button should do
    ---@param fn function
    ---@return ButtonBuilder
    function ButtonBuilder:on_press(fn)
        self.data.on_press = fn
        return self
    end

    ---Text of the Button
    ---@param content string
    ---@return ButtonBuilder
    function ButtonBuilder:text(content)
        self.data.val = content
        return self
    end

    ---Sets options for the button
    ---@param opts ButtonOptionBuilder|table
    ---@return ButtonBuilder
    function ButtonBuilder:options(opts)
        if type(opts.build) == "function" then
            self.data.opts = opts:build()
        else
            self.data.opts = opts
        end
        return self
    end

    ---Returns the Button
    ---@return Component
    function ButtonBuilder:build()
        return self.data
    end

    return ButtonBuilder
end

local function button_options()
    ---@class ButtonOptionBuilder
    local ButtonOptionBuilder = {
        data = {}
    }

    ---Text content of the button
    ---@param text string
    ---@return ButtonOptionBuilder
    function ButtonOptionBuilder:text(text)
        self.data.text = text
        return self
    end

    ---Position of the Button
    ---@param pos Position
    ---@return ButtonOptionBuilder
    function ButtonOptionBuilder:position(pos)
        self.data.position = pos
        return self
    end

    ---Adds a keymap for the button
    ---@param mode 'n','i'
    ---@param key string
    ---@param action string|function
    ---@param opts table|nil
    ---@return ButtonOptionBuilder
    function ButtonOptionBuilder:keymap(mode, key, action, opts)
        opts = opts or {}
        self.data.keymap = { mode, key, action, opts }
        return self
    end

    ---Sets the Shortcut
    ---@param shortcut string
    function ButtonOptionBuilder:shortcut(shortcut)
        self.data.shortcut = shortcut
        return self
    end

    ---Alignment of the Shortcut
    ---@param alignment 'left'|'right'
    function ButtonOptionBuilder:shortcut_alignment(alignment)
        self.data.align_shortcut = alignment
        return self
    end

    ---Sets the highlight group of the text
    ---@param hl string
    function ButtonOptionBuilder:text_hl(hl)
        self.data.hl = hl
        return self
    end

    ---Sets the highlight group of the Shortcut
    ---@param hl string
    function ButtonOptionBuilder:shortcut_hl(hl)
        self.data.hl_shortcut = hl
        return self
    end

    ---Sets the cursor position
    ---@param val number
    function ButtonOptionBuilder:cursor(val)
        self.data.cursor = val
        return self
    end

    ---How wide to pad the Button
    ---@param val number
    function ButtonOptionBuilder:width(val)
        self.data.width = val
        return self
    end

    ---Shrink Margin
    ---@param val boolean
    function ButtonOptionBuilder:shrink_margin(val)
        self.data.shrink_margin = val
        return self
    end

    ---comment
    ---@return table
    function ButtonOptionBuilder:build()
        return self.data
    end

    return ButtonOptionBuilder
end

---Text Builder
---@param text string|nil
---@return TextBuilder
local function text_builder(text)
    ---@class TextBuilder
    local TextBuilder = {
        data = {
            val = text,
            type = "text",
            opts = {}
        }
    }

    ---Build the final Text component
    ---@return Component
    function TextBuilder:build()
        return self.data
    end

    ---Set the text
    ---@param content any
    ---@return TextBuilder
    function TextBuilder:text(content)
        self.data.val = content
        return self
    end

    ---Sets the position of the text
    ---@param position Position
    function TextBuilder:position(position)
        self.data.opts.position = position
        return self
    end

    ---Sets the hl group of the text
    ---@param hl_group string
    ---@return TextBuilder
    function TextBuilder:hl_text(hl_group)
        self.data.opts.hl = hl_group
        return self
    end

    return TextBuilder
end

local function group_builer()
    ---@class GroupBuilder
    local GroupBuilder = { data = { type = "group", val = {}, opts = {} } }

    ---@return Component
    function GroupBuilder:build()
        return self.data
    end

    ---Adds an element to the Group
    ---@param element Component
    function GroupBuilder:push(element)
        self.data.val[#self.data.val + 1] = element
        return self
    end

    ---Sets the spacing between the elements
    ---@param value number
    function GroupBuilder:spacing(value)
        self.data.opts.spacing = value
        return self
    end

    ---Sets the spacing between the elements
    ---@param value Position
    function GroupBuilder:position(value)
        self.data.opts.position = value
        return self
    end

    return GroupBuilder
end

---Padding
---@param val number
---@return Component
local function padding(val)
    return { type = "padding", val = val }
end

--- Button element
---@param sc string
---@param txt string
---@param action string
---@return table
local function button(sc, icon, txt, action)
    local text = icon .. " " .. txt

    local options = button_options()
        :position("center")
        :text(text)
        :shortcut(sc)
        :cursor(19)
        :width(19)
        :shortcut_alignment("right")
        :shortcut_hl("field")
        :text_hl("Function")
        :keymap("n", sc, action, { noremap = true, silent = true })

    return new_button()
        :text(text)
        :options(options)
        :on_press(function()
            local key = vim.api.nvim_replace_termcodes(sc, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end)
        :build()
end

function M.opts()
    local lazy = require("lazy")
    local stats = lazy.stats()

    local header_ascii = require('utils.headers'):get_random()

    local header = text_builder()
        :text(header_ascii)
        :position("center")
        :hl_text("Normal")
        :build()

    local plugin_count = text_builder()
        :text("󰏖  " .. stats.loaded .. "/" .. stats.count .. " plugins loaded")
        :position("center")
        :hl_text("String")
        :build()

    local group = group_builer()
        :push(button("u", " ", "Update", ":Lazy update<CR>"))
        :push(button("q", "󰗼 ", "Quit", ":qa<CR>"))
        :spacing(1)
        :position("center")
        :build()

    Map("n", "°", ":Alpha<CR>")

    return {
        layout = {
            padding(3),
            header,
            padding(3),
            plugin_count,
            padding(2),
            group
        },
    }
end

return { M }
