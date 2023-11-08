return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(plugin, opts)

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.nu = {
        install_info = {
          url = "https://github.com/nushell/tree-sitter-nu",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "nu",
      }

      local con = require "plugins.configs.nvim-treesitter"
      con(plugin, opts)
    end
  },
  {
    "demelev/nushell.nvim",
    dev = true,
    lazy = false,
  }
}
