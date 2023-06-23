local _, alpha = pcall(require, "alpha")

local header = {
    type = "text",
    val = require('comesa.headers').get_header(),
    opts = {
        position = "center",
        hl = "Comment",
    },
}

local pluginCount = {
    type = "text",
    val = "󰏖  " .. (function ()
       local count = 0
       for _,_ in pairs(packer_plugins) do
           count = count + 1
       end
       return count
    end)() .. " plugins in total",
    opts = {
        position = "center",
        hl = "String",
    },
}


local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 6,
        width = 19,
        align_shortcut = "right",
        hl_shortcut = "Number",
        hl = "Function",
    }

    if keybind then
        opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
    }
end

local buttons  = {
    type = "group",
    val = {
        button( "e", "   Create" , ":ene <BAR> startinsert <CR>"),
        button( "r", "   Restore", ":SessionManager load_last_session<CR>"),
        button( "l", "󰃀   Load",    ":SessionManager load_session<CR>"),
        button( "c", "   Config",  ":cd ~/.config/nvim/<CR>:e .<CR>"),
        button( "u", "󰏔   Update",  ":PackerSync<CR>"),
        button( "q", "󰁮   Quit" ,   ":qa<CR>"),
    },
    opts = {
        position = "center",
        spacing = 1
    }
}

local section = {
    header = header,
    buttons = buttons,
    pluginCount = pluginCount,
}

local opts = {
    layout = {
        { type = "padding", val = 3 },
        section.header,
        { type = "padding", val = 3 },
        -- section.greetHeading,
        section.pluginCount,
        { type = "padding", val = 2 },
        section.buttons,
        -- { type = "padding", val = 2 },
        -- section.footer,
    },
    opts = {
        margin = 44,
    },
}

alpha.setup(opts)

vim.keymap.set("n", "°", ":Alpha<CR>")
