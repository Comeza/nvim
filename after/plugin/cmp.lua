local ICONS = {
    Method        = "",
    Function      = "",
    Constructor   = "",
    Field         = "",
    Variable      = "",
    Module        = "",
    Unit          = "",
    Value         = "",
    Keyword       = "",
    Snippet       = "",
    Color         = "",
    File          = "",
    Reference     = "",
    Folder        = "",
    EnumMember    = "",
    Constant      = "",
    Struct        = "",
    Event         = "",
    Operator      = "",
    TypeParameter = "",
    Package       = "",
    Class         = "",
    Property      = "",
    Enum          = "",
    Interface     = "",
    String        = "",
    Number        = "",
    Boolean       = "",
    Array         = "",
    Object        = "",
    Key           = "",
    Null          = "",
    TypeAlias     = "",
    Parameter     = "",
    Macro         = "",
    Text          = "",
}

local cmp = require('cmp')

cmp.setup {
    view = {
        entries = { name = 'custom' }
    },
    formatting = {
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s [%s]', ICONS[vim_item.kind], vim_item.kind)
            -- Source
            vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                    latex_symbols = "[LaTeX]",
                    buffer = "[Buffer]",
                })[entry.source.name]
            return vim_item
        end
    },
}
