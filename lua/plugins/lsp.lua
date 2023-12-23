local keymap = vim.keymap
local builtin = require("telescope.builtin")
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- keymap.set('n', '<space>e', vim.diagnostic.open_float)
keymap.set("n", "<A-[>", vim.diagnostic.goto_prev)
keymap.set("n", "<A-]>", vim.diagnostic.goto_next)
-- keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        -- keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
        -- keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
        -- keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        keymap.set("n", "gr", builtin.lsp_references, opts)
        keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_config = {
    capabilities = capabilities,
}
require("mason-lspconfig").setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup(lsp_config)
    end,
})
