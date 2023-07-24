return {
  {
    'ggandor/flit.nvim',
    dependencies = { 'ggandor/leap.nvim' },
    lazy = true,
    config = function()
      require 'flit'.setup {
        labeled_modes = "v",
        multiline = true,
      }
    end
  },
  {
    'ggandor/leap.nvim',
    lazy = false,
    config = function()
      require 'leap'.setup {
      }
    end
  },

  { "Hoffs/omnisharp-extended-lsp.nvim", lazy = false },
  {
    "SmiteshP/nvim-navbuddy",
    cmd = 'Navbuddy',
    config = function()
      require("nvim-navbuddy").setup {}
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    }
  }
}
