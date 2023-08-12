local utils = require "astronvim.utils"
local is_available = utils.is_available

function finddir(name)
  for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
    if vim.fn.isdirectory(dir .. "/" ..name) == 1 then
      return dir
    end
  end
end

M = {
    n = {
      ["<leader>ff"] = false,
      ["<leader>tt"] = false,         -- disable bottom in terminal
      -- ["<leader>fo"] = false,
      --["<c-p>o"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find history" },
      -- ["<leader>lf"] = false -- disable formatting keymap
      ["<a-m>"] = { "<cmd>Telescope lsp_document_symbols<cr>", desc = "Search for symbol in document" },
      ["<a-w>"] = { "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Search for symbol in workspace" },
      ["<a-b>"] = { "<cmd>Telescope buffers<cr>", desc = "Pick a buffer" },
      ["-"] = { "<cmd>edit %:h<cr>", desc = "Open current folder" },
      ["<C-P>c"] = { "<cmd>Telescope find_files previewer=false find_command={'fd','--type','f','-ecs'}<cr>" },
      ["<C-P>p"] = { "<cmd>Telescope find_files previewer=false<cr>" },
      ["<C-P>w"] = { "<cmd>Telescope find_files previewer=false cwd=..<cr>" },
      ["<C-P>l"] = { "<cmd>Telescope find_files previewer=false cwd=<c-r>=FindRootDirectory()<cr><cr>" },
      ["z0"] = { "<cmd>set foldlevel=0<cr>" },
      ["z1"] = { "<cmd>set foldlevel=1<cr>" },
      ["z2"] = { "<cmd>set foldlevel=2<cr>" },
      ["z3"] = { "<cmd>set foldlevel=3<cr>" },
      ["z4"] = { "<cmd>set foldlevel=4<cr>" },
      ["z5"] = { "<cmd>set foldlevel=5<cr>" },

      ["<space>t"] = { "<cmd> :Switch<cr>" },
      ["<space>sg"] = { "<cmd>OpenBrowserSearch -google <c-r>=expand('<cword>')<cr><cr>"}
    },
    x = {},
    v = {},
}

if is_available "leap.nvim" then
  M.n['f'] = { '<Plug>(leap-forward)' }
  M.n['F'] = { '<Plug>(leap-backward)' }
  -- M.n['<>a'] = { '<Plug>(leap-forward-x)' }
end

if is_available "toggleterm.nvim" then
  M.n["<leader>gg"] = { "<cmd>Git<cr>", desc = "Open fugitive status" }
  M.n["<leader>gt"] = { function() utils.toggle_term_cmd {cmd = "lazygit", dir = finddir('.git'), hidden = true} end, desc = "ToggleTerm lazygit" }
end

if is_available "substitute.nvim" then
    M.n.s = { require('substitute.exchange').operator, desc = "Exchange with motion operator" }
    M.n.ss = { require('substitute.exchange').line, desc = "Exchange a line" }
    M.n.S = { require('substitute.exchange').eol, desc = "Exchange till end of line"}
    M.x.s = { require('substitute.exchange').visual, desc = "Exchange selected"}
end

return M
