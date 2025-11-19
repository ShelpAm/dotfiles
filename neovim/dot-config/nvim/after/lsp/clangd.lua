return {
    cmd = {
        "clangd",
        -- "-j=8",
        -- "--completion-style=detailed",
        "--header-insertion=never",
        -- "--pch-storage=memory",
        -- "--header-insertion-decorators",
        -- "--print-options",
        "--log=error",
        -- "--log=info",
        -- "--log=verbose",
        -- "--experimental-modules-support", -- Leads to crash when no compile_commands.json exists.
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    root_markers = {
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac', -- AutoTools
        '.git',
    },
    on_attach = require('user.core.lsp.config').default_on_attach,
}
