local builtin = require("telescope.builtin")
local keymap = vim.keymap
keymap.set("n", "<C-f>", builtin.find_files, {})
keymap.set("n", "<C-g>", builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["esc"] = actions.close,
            },
        },
        file_ignore_patterns = {
            ".git",
            "lazy-lock.json",
            "node_modules",
            "yarn.lock",
            "schema.gql",
        },
        dynamic_preview_title = true,
        path_display = { "smart" },
    },

    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        find_files = {
            hidden = true,
        },
    },
    layout_config = {
        horizontal = {
            preview_cutoff = 100,
            preview_width = 0.5,
        },
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    },
})
