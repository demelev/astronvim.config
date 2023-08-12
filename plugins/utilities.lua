return {
  -- {
  --   'demelev/sonarlint.nvim',
  --   dev = true,
  --   lazy = false,
  --   config = function ()
  --     print("Hello from sonarlint.nvim")
  --     require 'sonarlint'.setup({
  --         cmd = {
  --           "sonarlint-language-server",
  --           "-stdio",
  --           "-analyzers",
  --           vim.fn.expand("$HOME/Downloads/omnisharp-plugin/sonarlint-omnisharp-plugin-1.10.0.70998.jar"),
  --         },
  --         root_dir = require("user.csharp.root_dir"),
  --         filetypes = { "cs" }
  --     })
  --   end
  -- },
  { "godlygeek/tabular", lazy = false },
  {
    'demelev/ledger.nvim',
    dev = true,
    ft = { 'ledger' },
    config = function()
      print "Configuring ledger"
      require('ledger-nvim').setup()
    end
  },
  {
    'demelev/unity.nvim',
    dev = true,
    lazy = false,
    dependencies = { "open-browser.vim" },
    config = function()
      require 'unity-nvim'.setup()
    end
  },
  {
    'eugen0329/vim-esearch',
    lazy = false,
    keys = {
      { "<space>/.", function() vim.fn['esearch#init']({paths = vim.fn.expand('%')}) end, mode = {'n', 'v'} },
      { "<space>/w", function() vim.fn['esearch#init']({paths = vim.fn.getcwd()..'/../'}) end, mode = 'n' },
    },
    -- config = function()
      -- vim.cmd [[
        -- nnoremap <space>/. :call esearch#init({'paths': expand('%')})<cr>
        -- vnoremap <space>/. :call esearch#init({'paths': expand('%')})<cr>
        -- noremap <space>/w :call esearch#init({'paths': getcwd().'/../'})<cr>
      -- ]]
     -- end
  },
  { 'mbbill/undotree', cmd = {'UndotreeToggle', 'UndotreeFocus'} },
  --{ 'ggandor/leap.nvim', cmd = "BufEnter" },
  { 'tpope/vim-surround', lazy = false },
  { 'wellle/targets.vim', lazy = false },
  { 'nvim-treesitter/nvim-treesitter-textobjects', lazy = false },
  {
    'vim-scripts/open-browser.vim',
    lazy = false,
    config = function()
      vim.cmd [[
"nmap <space>sg :OpenBrowserSearch -google <c-r>=expand("<cword>")<cr><cr>
nmap <space>su :OpenBrowserSearch -unity3d <c-r>=expand("<cword>")<cr><cr>
nmap <space>sr :OpenBrowserSearch -rust <c-r><c-w><cr>
nmap <space>ag :OpenBrowserSearch -google
nmap <space>au :OpenBrowserSearch -unity3d
nmap <space>ar :OpenBrowserSearch -rust
    ]]
    end
  },
  {
    'folke/todo-comments.nvim',
    lazy = false,
    config = function()
      require("todo-comments").setup {

      }
    end
  },
  {
    'folke/trouble.nvim',
    lazy = false,
    config = function()
      require("trouble").setup {}
    end
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/playground" },
    ft = { 'cs' },
    config = function()
      local tsj_utils = require('treesj.langs.utils')
      require('treesj').setup({
        langs = {
          c_sharp = {
            -- Methods
            parameter_list = tsj_utils.set_preset_for_args(),
            argument_list = tsj_utils.set_preset_for_args(),
            method_declaration = {
              target_nodes = { 'parameter_list' }
            },
            -- Class
            class_declaration = {
              target_nodes = { 'base_list' }
            },
            base_list = tsj_utils.set_preset_for_args(),
            -- Expressions
            object_creation_expression = {
              target_nodes = {
                'initializer_expression',
              }
            },
            initializer_expression = tsj_utils.set_preset_for_list(),
            invocation_expression = {
              target_nodes = { 'argument_list' }
            }
          }
        },
        max_join_length = 1000,
      })
    end
  },
  {
    'airblade/vim-rooter',
    cmd = "Rooter",
    config = function()
      vim.g.rooter_patterns = { 'build.gradle', '.git/' }
      vim.g.rooter_manual_only = 1
    end,
  }
}
