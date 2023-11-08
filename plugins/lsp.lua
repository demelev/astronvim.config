vim.filetype.add({
  extension = {
    nu = "nu",
  },
})

return {
  {
    'zioroboco/nu-ls.nvim',
    ft = { "nu" },
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'jose-elias-alvarez/null-ls.nvim',
        opts = function(_, config)
          config.sources = { require('nu-ls') }
          return config
        end,
      }
    },
  },
}
