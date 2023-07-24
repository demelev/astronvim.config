local command = '/home/demelev/Downloads/unity-debug-2.7.2/extension/bin/UnityDebug.exe'
local dap_settings = astronvim.user_opts("dap")

return {
  "jay-babu/mason-nvim-dap.nvim",
  enabled = true,
  config = function(plugin, opts)
    local dap = require('dap')
    dap.adapters.unity = dap_settings.adapters.unity
    dap.configurations.cs = dap_settings.configurations.cs
    local mason_nvim_dap = require "mason-nvim-dap"
    mason_nvim_dap.setup(opts)
  end,
  opts = {
    automatic_setup = {
      adapters = dap_settings.adapters,
      configurations = dap_settings.configurations,
      -- adapters =
      -- {
        -- unity = {
          -- type = 'executable',
          -- command = 'mono',
          -- args = {
            -- command
          -- },
          -- enrich_config = function(config, next)
            -- local unity_pid = vim.fn.system('ps -C "Unity" -o pid,cmd | grep "Editor/Unity" | cut -f1 -z -d" "')
            -- local proc_entry = 'Unity Editor (Unity) (' .. unity_pid:sub(1, -2) .. ')'
            -- -- local proc_entry = vim.fn.system('mono '..command..' list')
            -- config.name = proc_entry
            -- next(config)
          -- end,
        -- }
      -- },
      -- configurations = {
        -- cs = {
          -- {
            -- name = 'Unity Editor',
            -- type = 'unity',
            -- request = 'attach',
            -- -- path = '/home/demelev/projects/work/golf/Unity.Product.TrackmanPractice/Library/EditorInstance.json',
          -- }
        -- }
      -- }
    }
  }
}
