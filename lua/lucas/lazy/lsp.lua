return {
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
        {'neovim/nvim-lspconfig',
            config = function()
                local lsp = require('lsp-zero').preset("recommended")
                lsp.set_sign_icons({
                        error = '✘',
                        warn = '▲',
                        hint = '⚑',
                        info = '»'
                        })
                lsp.on_attach(function(client, bufnr)
                    lsp.default_keymaps({buffer = bufnr})
                    end)
                require('mason').setup({})
                require('mason-lspconfig').setup({
                        ensure_installed = {
                            'gopls',
                            'lua_ls',
                            'pyright',
                            'clangd',
                            'vimls',
                            'marksman',
                            'rust_analyzer',
                            'typos_lsp',
                        },
                        handlers = {
                            lsp.default_setup,
                        },
                    })
                local lspconfig = require('lspconfig')
                local configs = require('lspconfig/configs')
                configs.zk = {
                    default_config = {
                        cmd = {'zk', 'lsp'},
                        filetypes = {'markdown'},
                        root_dir = function()
                            return vim.loop.cwd()
                            end,
                        settings = {}
                    };
                }

                require('lspconfig').clangd.setup {
                    init_options = {
                        fallbackFlags = {'--std=c++20'}
                    },
                    filetypes = { "h", "c", "cpp", "cc" },
                    root_dir = lspconfig.util.root_pattern(
                        '.clangd',
                        '.clang-tidy',
                        '.clang-format',
                        'compile_commands.json',
                        'compile_flags.txt',
                        'configure.ac',
                        '.git'
                    )
                }
                require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
                local cmp = require('cmp')
                local cmp_select = {behaviour = cmp.SelectBehavior.Select}
                local cmp_mappings = lsp.defaults.cmp_mappings({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    })
                lsp.set_preferences({
                    suggest_lsp_servers = false,
                    sign_icons = {
                    error = 'E',
                    warn = 'W',
                    hint = 'H',
                    info = 'I'
                    }
                })
            lsp.on_attach(function(client, bufnr)
                    local opts = {buffer = bufnr, remap = false}
                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)
                    end)
                lsp.setup()
                end
        }
}
