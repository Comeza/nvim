return {
    dap = {
        Stopped = { 'X ', 'DiagnosticWarn', 'DapStoppedLine' },
        Breakpoint = 'B ',
        -- BreakpointCondition = ' ',
        -- BreakpointRejected = { ' ', 'DiagnosticError' },
        -- LogPoint = '.>',
    },
    diagnostics = {
        Error = 'E ',
        Warn = 'W ',
        Hint = 'H ',
        Info = 'I ',
    },
    git = {
        added = '+ ',
        modified = '~ ',
        removed = '- ',
    },

    -- Kinds {{{
    kinds = {
        Array = ' ',
        Boolean = ' ',
        Class = ' ',
        Color = ' ',
        Constant = ' ',
        Constructor = ' ',
        Copilot = ' ',
        Enum = ' ',
        EnumMember = ' ',
        Event = ' ',
        Field = ' ',
        File = ' ',
        Folder = ' ',
        Function = ' ',
        Interface = ' ',
        Key = ' ',
        Keyword = ' ',
        Method = ' ',
        Module = ' ',
        Namespace = ' ',
        Null = ' ',
        Number = ' ',
        Object = ' ',
        Operator = ' ',
        Package = ' ',
        Property = ' ',
        Reference = ' ',
        Snippet = ' ',
        String = ' ',
        Struct = ' ',
        Text = ' ',
        TypeParameter = ' ',
        Unit = ' ',
        Value = ' ',
        Variable = ' ',
    },
    -- }}}
    -- Lazy {{{
    lazy = {
        -- Icons {{{
        cmd = ' ',
        config = '',
        event = '',
        ft = ' ',
        init = ' ',
        import = ' ',
        keys = ' ',
        lazy = '󰒲 ',
        loaded = '●',
        not_loaded = '○',
        plugin = ' ',
        runtime = ' ',
        source = ' ',
        start = '',
        task = '✔ ',
        list = {
            '●',
            '➜',
            '★',
            '‒',
        },
        -- }}}
        -- -- No Icons {{{
        -- cmd = '',
        -- config = '',
        -- event = '',
        -- ft = '',
        -- init = '',
        -- import = '',
        -- keys = '',
        -- lazy = '',
        -- loaded = '',
        -- not_loaded = '',
        -- plugin = '',
        -- runtime = '',
        -- source = '',
        -- start = '',
        -- task = '',
        -- list = {
        --     '',
        --     '',
        --     '',
        --     '',
        -- },
        -- -- }}}
    -- }}}
    },
}

