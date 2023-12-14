--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
vim.cmd [[set fileformat=unix]]
local config = {
  -- dap = {
    -- configurations = {
      -- c = {
        -- name = 'Unity Editor',
        -- type = 'unity',
        -- request = 'attach',
      -- },
      -- cs = {
        -- {
          -- name = 'Unity Editor',
          -- type = 'unity',
          -- request = 'attach',
          -- -- path = '/home/demelev/projects/work/golf/Unity.Product.TrackmanPractice/Library/EditorInstance.json',
        -- }
      -- }
    -- },
    -- adapters = {
      -- unity = {
        -- type = 'executable',
        -- command = 'mono',
        -- args = { '/home/demelev/Downloads/unity-debug-2.7.2/extension/bin/UnityDebug.exe' },
        -- enrich_config = function(config, next)
          -- local unity_pid = vim.fn.systemlist('ps -C "Unity" -o pid,cmd | grep "Editor/Unity" | choose 0')

          -- vim.ui.select(unity_pid, {}, function(pid)
            -- local proc_entry = 'Unity Editor (Unity) (' .. pid:sub(1, -1) .. ')'
            -- -- local proc_entry = vim.fn.system('mono '..command..' list')
            -- config.name = proc_entry
            -- next(config)
          -- end
          -- )
        -- end,
      -- }
    -- }
  -- },
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "nightly",   -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main",       -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false,   -- automatically reload and sync packer after a successful update
    auto_quit = false,     -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },
  -- Set colorscheme to use
  colorscheme = "onedark",
  --colorscheme = "material",
  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },
  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      foldlevelstart = 100,
      foldlevel = 100,
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true,         -- sets vim.opt.number
      spell = false,         -- sets vim.opt.spell
      signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
      wrap = false,          -- sets vim.opt.wrap
      scrolloff = 1,
    },
    g = {
      mapleader = " ",                   -- sets vim.g.mapleader
      autoformat_enabled = false,        -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true,                -- enable completion at start
      autopairs_enabled = true,          -- enable autopairs at start
      diagnostics_enabled = true,        -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true,              -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = false,  -- disable notifications when toggling UI elements
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " █████  ███████ ████████ ██████   ██████",
    "██   ██ ██         ██    ██   ██ ██    ██",
    "███████ ███████    ██    ██████  ██    ██",
    "██   ██      ██    ██    ██   ██ ██    ██",
    "██   ██ ███████    ██    ██   ██  ██████",
    " ",
    "    ███    ██ ██    ██ ██ ███    ███",
    "    ████   ██ ██    ██ ██ ████  ████",
    "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "    ██   ████   ████   ██ ██      ██",
  },
  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = false
      hl.DiagnosticHint.italic = false
      hl.DiagnosticInfo.italic = false
      hl.DiagnosticWarn.italic = false

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      cmp = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      treesitter = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },
  -- Diagnostics configuration (for vim.diagnostic.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
    update_in_insert = false,
  },
  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
      -- "sonarlint_language_server",
      "azure_pipelines_ls",
      "nushell",
    },
    -- Add overrides for LSP server settings, the keys are the name of the server
    config = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },

      -- sonarlint_language_server = function()
      --   return {
      --     cmd = {
      --       "sonarlint-language-server",
      --       "-stdio",
      --       "-analyzers",
      --       vim.fn.expand("$HOME/Downloads/omnisharp-plugin/sonarlint-omnisharp-plugin-1.10.0.70998.jar"),
      --     },
      --     root_dir = require("user.csharp.root_dir"),
      --     filetypes = { "cs" }
      --   }
      -- end,
      nushell = function()
        return {
          cmd = { "nu", "--lsp" },
          root_dir = require("user.csharp.root_dir"),
          filetypes = { "nu" }
        }
      end,
      azure_pipelines_ls = function()
        return {
          cmd = {
            "node",
            "/home/demelev/Downloads/package/out/server.js",
            "--stdio"
          },
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                  "/azure-*.y*l",
                  "/azure-pipeline*.y*l",
                  "/azure-courses.yml",
                  "/*.azure*",
                  "Azure-Pipelines/**/*.y*l",
                  "Pipelines/*.y*l",
                },
              },
            },
          }
        }
      end,
      -- omnisharp = function()
      --   local root_dir = require('user.csharp.root_dir')
      --
      --   return {
      --     handlers = { ["textDocument/definition"] = require('omnisharp_extended').handler },
      --     root_dir = root_dir,
      --     single_file_support = false,
      --     on_new_config = function(new_config, new_root_dir)
      --       -- print("Config cmd "..vim.inspect(require("lspconfig")["omnisharp"].default_config.cmd))
      --       --
      --       -- Get the initially configured value of `cmd`
      --       new_config.cmd = { unpack(new_config.cmd or {}) }
      --
      --       -- Append hard-coded command arguments
      --       table.insert(new_config.cmd, '-z') -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
      --       vim.list_extend(new_config.cmd, { '--hostPID', tostring(vim.fn.getpid()) })
      --       vim.list_extend(new_config.cmd, { '-s', new_root_dir })
      --       table.insert(new_config.cmd, 'DotNet:enablePackageRestore=false')
      --       vim.list_extend(new_config.cmd, { '--encoding', 'utf-8' })
      --       table.insert(new_config.cmd, '--languageserver')
      --
      --       new_config.capabilities = vim.deepcopy(new_config.capabilities)
      --       new_config.capabilities.workspace.workspaceFolders = true -- https://github.com/OmniSharp/omnisharp-roslyn/issues/909
      --     --
      --     --   table.insert(new_config.cmd, '-z') -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
      --     --   vim.list_extend(new_config.cmd, { '-s', new_root_dir })
      --     --   vim.list_extend(new_config.cmd, { '--hostPID', tostring(vim.fn.getpid()) })
      --     --   vim.list_extend(new_config.cmd, { '--encoding', 'utf-8' })
      --     --   table.insert(new_config.cmd, '--languageserver')
      --     end
      --   }
      -- end,
      omnisharp = function()
        return {
          handlers = { ["textDocument/definition"] = require('omnisharp_extended').handler },
          root_dir = require('user.csharp.root_dir'),
          enable_editorconfig_support = true,
          enable_ms_build_load_projects_on_demand = false,
          enable_roslyn_analyzers = true,
          organize_imports_on_format = false,
          enable_import_completion = true,
          -- Specifies whether to include preview versions of the .NET SDK when
          -- determining which version to use for project loading.
          sdk_include_prereleases = true,
          analyze_open_documents_only = true,
          enable_decompilation_support = true,
        }
      end
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false,    -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- add to the global LSP on_attach function
    on_attach = function(client, bufnr)
      -- vim.wo.foldmethod = 'expr'
      -- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

      if client.name == 'omnisharp' then
        -- client.server_capabilities.semanticTokensProvider = {
        -- full = vim.empty_dict(),
        -- legend = {
        -- tokenModifiers = { "static_symbol" },
        -- tokenTypes = {
        -- "comment",
        -- "excluded_code",
        -- "identifier",
        -- "keyword",
        -- "keyword_control",
        -- "number",
        -- "operator",
        -- "operator_overloaded",
        -- "preprocessor_keyword",
        -- "string",
        -- "whitespace",
        -- "text",
        -- "static_symbol",
        -- "preprocessor_text",
        -- "punctuation",
        -- "string_verbatim",
        -- "string_escape_character",
        -- "class_name",
        -- "delegate_name",
        -- "enum_name",
        -- "interface_name",
        -- "module_name",
        -- "struct_name",
        -- "type_parameter_name",
        -- "field_name",
        -- "enum_member_name",
        -- "constant_name",
        -- "local_name",
        -- "parameter_name",
        -- "method_name",
        -- "extension_method_name",
        -- "property_name",
        -- "event_name",
        -- "namespace_name",
        -- "label_name",
        -- "xml_doc_comment_attribute_name",
        -- "xml_doc_comment_attribute_quotes",
        -- "xml_doc_comment_attribute_value",
        -- "xml_doc_comment_cdata_section",
        -- "xml_doc_comment_comment",
        -- "xml_doc_comment_delimiter",
        -- "xml_doc_comment_entity_reference",
        -- "xml_doc_comment_name",
        -- "xml_doc_comment_processing_instruction",
        -- "xml_doc_comment_text",
        -- "xml_literal_attribute_name",
        -- "xml_literal_attribute_quotes",
        -- "xml_literal_attribute_value",
        -- "xml_literal_cdata_section",
        -- "xml_literal_comment",
        -- "xml_literal_delimiter",
        -- "xml_literal_embedded_expression",
        -- "xml_literal_entity_reference",
        -- "xml_literal_name",
        -- "xml_literal_processing_instruction",
        -- "xml_literal_text",
        -- "regex_comment",
        -- "regex_character_class",
        -- "regex_anchor",
        -- "regex_quantifier",
        -- "regex_grouping",
        -- "regex_alternation",
        -- "regex_text",
        -- "regex_self_escaped_character",
        -- "regex_other_escape",
        -- },
        -- },
        -- range = true,
        -- }

        -- print(vim.inspect(client.server_capabilities.semanticTokensProvider))
        local function toSnakeCase(str) return string.gsub(str, "%s*[- ]%s*", "_") end
        local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
        for i, v in ipairs(tokenModifiers) do
          tokenModifiers[i] = toSnakeCase(v)
        end
        local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
        for i, v in ipairs(tokenTypes) do tokenTypes[i] = toSnakeCase(v) end
        -- print(vim.inspect(client.server_capabilities.semanticTokensProvider))
        -- client.server_capabilities.semanticTokensProvider = nil
        -- local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
        -- for i, v in ipairs(tokenModifiers) do
        -- tokenModifiers[i] = v:gsub(' ', '_')
        -- end
        -- local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
        -- for i, v in ipairs(tokenTypes) do
        -- tokenTypes[i] = v:gsub(' ', '_')
        -- end
      end

      local navbuddy = require("nvim-navbuddy")
      if navbuddy ~= nil then
        navbuddy.attach(client, bufnr)
      end
    end,
    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    dev = { path = "~/projects/nvim-related" },
    lockfile = vim.fn.stdpath "config" .. "/lua/user/lazy-lock.json",
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml", "gzip", "matchit", "zipPlugin",
          -- "netrwPlugin",
          "tarPlugin", "matchparen"
        },
      },
    },
  },
  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["<a-m>"] = { "<cmd>Telescope lsp_document_symbols<cr>", desc = "Search for symbol in document" },
      ["<a-w>"] = { "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Search for symbol in workspace" },
      ["<a-b>"] = { "<cmd>Telescope buffers<cr>", desc = "Pick a buffer" },
      ["-"] = { "<cmd>edit %:h<cr>", desc = "Open current folder" },
      ["<C-P>c"] = { "<cmd>Telescope find_files previewer=false find_command={'fd','--type','f','-ecs'}<cr>" },
      ["<C-P>p"] = { "<cmd>Telescope find_files previewer=false<cr>" },
      ["<C-P>w"] = { "<cmd>Telescope find_files previewer=false cwd=..<cr>" },
      ["<C-P>l"] = { "<cmd>Telescope find_files previewer=false cwd=<c-r>=FindRootDirectory()<cr><cr>" },
      ["<space>t"] = { "<cmd> :Switch<cr>" },
      --  Mappings to easily toggle fold levels
      ["z0"] = { "<cmd>set foldlevel=0<cr>" },
      ["z1"] = { "<cmd>set foldlevel=1<cr>" },
      ["z2"] = { "<cmd>set foldlevel=2<cr>" },
      ["z3"] = { "<cmd>set foldlevel=3<cr>" },
      ["z4"] = { "<cmd>set foldlevel=4<cr>" },
      ["z5"] = { "<cmd>set foldlevel=5<cr>" },
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },
  -- Configure plugins
  plugins = {
    -- You can disable default plugins as follows:
    -- ["goolord/alpha-nvim"] = { disable = true },

    -- You can also add new plugins here as well:
    -- Add plugins, the packer syntax without the "use"
    -- { "andweeb/presence.nvim" },
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },

    -- We also support a key value style plugin definition similar to NvChad:
    -- ["ray-x/lsp_signature.nvim"] = {
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
    --
    {
      'tzachar/cmp-tabnine',
      run = './install.sh',
      requires = 'hrsh7th/nvim-cmp',
      after = 'nvim-cmp',
      config = function()
        astronvim.add_user_cmp_source "cmp_tabnine"
        local tabnine = require('cmp_tabnine.config')

        tabnine:setup({
          max_lines = 1000,
          max_num_results = 20,
          sort = true,
          run_on_every_keystroke = true,
          snippet_placeholder = '..',
          ignored_file_types = {
            -- default is not to ignore
            -- uncomment to ignore in lua:
            -- lua = true
          },
          show_prediction_strength = false
        })
      end,
    },
    { 'eugen0329/vim-esearch' },
    { 'editorconfig/editorconfig-vim' },
    { 'mg979/vim-visual-multi' },
    { 'terryma/vim-expand-region' },
    {
      'vim-scripts/Buffergator',
      cmd = 'BuffergatorToggle'
    },
    { 'randomize/switch.vim' },
    { 'godlygeek/tabular' },
    { 'vimwiki/vimwiki' },
    { 'preservim/nerdcommenter' },
    { 'brooth/far.vim' },
    -- " Plug 'camspiers/animate.vim'
    -- " Plug 'camspiers/lens.vim'
    { 'vim-scripts/VisIncr' },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-repeat' },
    --{{{ Buffer navigation
    -- " Plug 'easymotion/vim-easymotion'
    -- " Plug 'ggandor/lightspeed.nvim'
    { 'ggandor/leap.nvim' },
    { 'wellle/targets.vim' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    -- Plug 'kana/vim-textobj-user'
    -- Plug 'kana/vim-textobj-indent'
    -- Plug 'zandrmartin/vim-textobj-blanklines'
    -- Plug 'kana/vim-textobj-fold'
    -- Plug 'glts/vim-textobj-indblock'
    -- }}}
    -- Plug 'ray-x/lsp_signature.nvim'
    { 'folke/zen-mode.nvim',                        cmd = 'ZenMode' },
    { 'folke/twilight.nvim' },
    { 'APZelos/blamer.nvim' },
    { 'mbbill/undotree',                            cmd = "UndotreeToggle" },
    { 'SmiteshP/nvim-navic' },
    { 'ray-x/guihua.lua',                           run = 'cd lua/fzy && make' },
    -- { 'ray-x/navigator.lua',
    -- config = function()
    -- local root_dir = require('user.csharp.root_dir')
    -- require('navigator').setup({
    -- lsp = {
    -- }
    -- })
    -- end,
    -- requires = {
    -- { 'ray-x/guihua.lua' },
    -- { 'neovim/nvim-lspconfig' },
    -- },
    -- },

    -- Colorschemes
    { 'joshdick/onedark.vim' },
    { 'EdenEast/nightfox.nvim' },
    -- Life coding
    { 'metakirby5/codi.vim' },
    -- { 'scrooloose/nerdtree' },
    ["Wansmer/treesj"] = {
      requires = { { "nvim-treesitter/playground" } },
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
    { "folke/trouble.nvim" },
    { "GustavoKatel/tasks.nvim" },
    { "pierreglaser/folding-nvim" },
    ["hrsh7th/cmp-nvim-lsp-signature-help"] = {
      after = "nvim-cmp",
      config = function() astronvim.add_user_cmp_source "nvim_lsp_signature_help" end,
    },
    -- Syntax
    { "ledger/vim-ledger" },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    lspkind = {
      before = function(entry, vim_item)
        if entry.source.name == "cmp_tabnine" then
          local detail = (entry.completion_item.data or {}).detail
          vim_item.kind = ""
          if detail and detail:find('.*%%.*') then
            vim_item.kind = vim_item.kind .. ' ' .. detail
          end

          if (entry.completion_item.data or {}).multiline then
            vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
          end
        end
        return vim_item
      end
    },
    treesitter = { -- overrides `require("treesitter").setup(...)`
      -- ensure_installed = { "lua" },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      -- ensure_installed = { "sumneko_lua" },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      -- ensure_installed = { "prettier", "stylua" },
    },
    ["neo-tree"] = {
    },

  },
  -- LuaSnip Options
  luasnip = {
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
    -- Configure luasnip loaders (vscode, lua, and/or snipmate)
    vscode = {
      -- Add paths for including more VS Code style snippets in luasnip
      paths = {},
    },
  },
  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      copilot = 1005,
      tab_nine = 1000,
      nvim_lsp = false,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },
  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

vim.cmd [[
let g:codi#interpreters = {
   \ 'cs': {
       \ 'bin': 'csharp',
       \ 'prompt': '^\(csharp\|......\)> ',
   \ },
   \ 'ps1': {
       \ 'bin': ['pwsh', '-nol', '-noni'],
       \ 'prompt': '^\(PS .*>\|>>\) ',
   \ },
\ }
]]
return config
