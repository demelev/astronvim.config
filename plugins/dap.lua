local command = '/home/demelev/Downloads/unity-debug-2.7.2/extension/bin/UnityDebug.exe'

local dap_settings = astronvim.user_opts("dap")
local mason_nvim_dap = require "mason-nvim-dap"

return {
  "jay-babu/mason-nvim-dap.nvim",
  enabled = true,
  config = function(plugin, opts)
    local dap = require('dap')
    dap.adapters.unity = dap_settings.adapters.unity
    dap.configurations.cs = dap_settings.configurations.cs
    dap.configurations.rust = dap_settings.configurations.rust
    mason_nvim_dap.setup(opts)
  end,
  opts = {
    automatic_installation = {
      exclude = { "rust" }
    },
  }
}
