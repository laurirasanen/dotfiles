-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim

lvim.colorscheme = "retrobox"

lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.ensure_installed = { "cpp", "c", "glsl" }

-- telescope
lvim.builtin.telescope.defaults.layout_config.width = 0.95

-- no delay
vim.opt.tm = 0
vim.opt.ttm = 0

-- spacing
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- keys
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"

lvim.builtin.which_key.mappings["ss"] = {
    '<cmd>lua require("spectre").toggle()<CR>',
    "Spectre"
}

--[[
lvim.builtin.which_key.mappings["e"] = {
    ':Neotree<CR>',
    "neo-tree"
}
]]

-- stop changing cwd you fuck why is this the default?
lvim.builtin.project.active = false
lvim.builtin.nvimtree.setup.update_cwd = false

-- plugins
lvim.plugins = {
    -- find and replace
    {
        "nvim-pack/nvim-spectre",
        event = "BufRead",
        config = function()
            require("spectre").setup()
        end,
    },
    -- scrollbar
    {
        'wfxr/minimap.vim',
        build = "cargo install --locked code-minimap",
        cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
        config = function()
            vim.cmd("let g:minimap_width = 10")
            vim.cmd("let g:minimap_auto_start = 1")
            vim.cmd("let g:minimap_auto_start_win_enter = 1")
        end,
    },
}
