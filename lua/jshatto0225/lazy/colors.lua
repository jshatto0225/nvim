function ColorMyPencils(color)
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
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
        italics = false
    },
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
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
        terminal_colors = true,         -- add neovim terminal colors
        undercurl = true,
        underline = false,
        bold = true,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,         -- invert background for search, diffs, statuslines and errors
        contrast = "",          -- can be "hard", "soft" or empty string
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
        style = "storm",                -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true,             -- Enable this to disable setting the background color
        terminal_colors = true,         -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = false },
          keywords = { italic = false },
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark",           -- style for sidebars, see below
          floats = "dark",             -- style for floating windows
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
        },
      })
      ColorMyPencils()
    end
  },


}
