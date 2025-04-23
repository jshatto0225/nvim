function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
    --vim.cmd[[set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,sm:block]]
    --vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#DC312E" })
end

return {
    {
        "erikbackman/brightburn.vim",
    },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            italics = true
        },
    },
    {
        "Tsuzat/NeoSolarized.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        "https://github.com/shaunsingh/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.nord_bold = false
            vim.g.nord_italic = false
            require('nord').set()
        end
    },
    {
        "navarasu/onedark.nvim",
        config = function()
            require('onedark').setup({
                style = 'darker',
                transparent = true,
                code_style = {
                    comments = 'none',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none'
                },
            })
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = false,
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
        end,
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    --comments = { italic = false },
                    --keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                    bold = true,
                },
                palette = {
                    -- This is what the theme looks like in tmux, i kinda like it more that the default main
                    main = {
                        base = '#262626',
                        surface = '#262626',
                        overlay = '#303030',
                        muted = '#5F5F84',
                        subtle = '#8787AC',
                        text = '#D7D7FC',
                        love = '#EC6A88',
                        gold = '#F3B28E',
                        rose = '#F3B2B1',
                        pine = '#688686',
                        foam = '#B7D6D6',
                        iris = '#D1B0D4',
                    },
                    dawn = {
                        base = '#1e1e1e',
                        surface = '#1e1e1e',
                        overlay = '#303030',
                        muted = '#5F5F84',
                        subtle = '#8787AC',
                        text = '#bdb76b',
                        love = '#ee4636',
                        gold = '#c8c8aa',
                        rose = '#ff8000',
                        pine = '#d8a0df',
                        foam = '#ffd700',
                        iris = '#ffd700',
                    },
                },
            })
            ColorMyPencils()
        end
    },
}
