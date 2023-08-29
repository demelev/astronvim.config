local sound_dir = "/home/demelev/.config/astronvim/sounds/Audio/"
--local sound_dir_click = "/home/demelev/.config/astronvim/sounds/click.ogg"
local sound_dir_click = "/home/demelev/.config/astronvim/sounds/type.ogg"
local insert_move = "/home/demelev/.config/astronvim/sounds/Audio/glass_002.ogg"

return {
  {
    'ledger/vim-ledger',
    dev = true,
    ft = { "ledger" },
  },

  {
    'whleucka/reverb.nvim',
    event = "BufReadPre",
    opts = {
    sounds = {
      -- add custom sound paths for other events here
      -- eg. EVENT = "/some/path/to/sound.mp3"
      BufRead = sound_dir .. "start.ogg",
      CursorMovedI =  sound_dir_click,
      CursorMoved =  insert_move,
      --InsertLeave = sound_dir .. "switch_002.ogg",
      CmdlineLeave = sound_dir .. "confirmation_002.ogg",
      CmdlineEnter = sound_dir .. "confirmation_003.ogg",
      InsertEnter = sound_dir .. "toggle_002.ogg",
      InsertLeave = sound_dir .. "toggle_001.ogg",
      ExitPre = sound_dir .. "exit.ogg",
      BufWrite = sound_dir .. "drop_004.ogg",
      },
    },
  },
  -- " DB Database
  -- Plug 'tpope/vim-dadbod'
  -- Plug 'kristijanhusak/vim-dadbod-ui'
  -- Plug 'thinca/vim-quickrun'
  --? Plug 'pierreglaser/folding-nvim'
  -- ? Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  --? Plug 'APZelos/blamer.nvim'
  --? Plug 'liuchengxu/vista.vim'
}
