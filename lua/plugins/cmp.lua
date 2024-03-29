local M = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- Snippet Engine
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        -- Adds a number of user-friendly snippets
        "rafamadriz/friendly-snippets",

        -- Path completion
        "hrsh7th/cmp-path",
    },
}

local formatting = {
    format = function(_, item)
        local icons = require("config.icons").kinds
        if #item.abbr > 25 then
            item.abbr = string.sub(item.abbr, 0, 25) .. "~"
        end
        item.menu = ""
        if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
        end
        return item
    end,
}

local view = {
    entries = {
        name = "custom",
        selection_order = "top_down",
    },
}

local experimental = {
    ghost_text = {
        hl_group = "CmpItemMenu",
    },
}

local appearance = {
    menu = {
        direction = "above"
    }
}

function M.config()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.config.setup({})
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    local config = {
        formatting = formatting,
        appearance = appearance,
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<M-j>"] = cmp.mapping.scroll_docs(4),
            ["<M-k>"] = cmp.mapping.scroll_docs(-4),
            ["<C-Space>"] = cmp.mapping.complete({}),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ["<Tab>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),
        sources = {
            { name = 'nvim_lsp_signature_help' },
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" },
        },
        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,

                -- copied from cmp-under, but I don't think I need the plugin for this.
                -- I might add some more of my own.
                function(entry1, entry2)
                    local _, entry1_under = entry1.completion_item.label:find("^_+")
                    local _, entry2_under = entry2.completion_item.label:find("^_+")
                    entry1_under = entry1_under or 0
                    entry2_under = entry2_under or 0
                    if entry1_under > entry2_under then
                        return false
                    elseif entry1_under < entry2_under then
                        return true
                    end
                end,

                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        },
        view = view,
        experimental = experimental,
        preselect = "item",
    }

    cmp.setup(config)
end

return { M }
