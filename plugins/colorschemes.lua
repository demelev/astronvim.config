return {
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    config = function()
      require('material').setup {}
    end
  },
  {
    "catppuccin/nvim",
    lazy = false,
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {}
    end,
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    as = "onedark",
    config = function()
      require('onedark').load()
    end
  }
}
