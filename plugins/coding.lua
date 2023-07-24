return {
  {
    'metakirby5/codi.vim',
    cmd = "Codi",
    lazy = false,
    config = function()
      vim.cmd [[
        let g:codi#interpreters = {
           \ 'cs': {
               \ 'bin': 'csharp',
               \ 'prompt': '^\(csharp\|......\)> ',
           \ },
           \ 'nu': {
               \ 'bin': 'nu',
               \ 'prompt': '^.*> ',
           \ },
           \ 'ps1': {
               \ 'bin': ['pwsh', '-nol', '-noni'],
               \ 'prompt': '^\(PS .*>\|>>\) ',
           \ },
        \ }
      ]]
    end
  },
  {
    -- 'github/copilot.vim',
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    ft = {
      "cs"
    },
    --event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
    dependencies = {
      {
        'zbirenbaum/copilot-cmp',
        after = {"copilot.lua"},
        config = function()
          require("copilot_cmp").setup()
        end
      }
    }
  },
  {'rafcamlet/nvim-luapad', lazy = false},
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
}
