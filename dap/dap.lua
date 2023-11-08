local dap = require 'dap'
-- local command = '/home/demelev/Downloads/unity-debug-3.0.1/extension/bin/UnityDebug.exe'
-- 3.0.1 hangs unity until disconnected
-- local command = '/home/demelev/Downloads/unity-debug-2.7.2/extension/bin/UnityDebug.exe'
-- local unity_process_id_regexp = '[%w ]+ %(%w+%) %((%d+)%)'

-- require('dap').adapters.unity = {
  -- type = 'executable',
  -- command = 'mono',
  -- args = {
    -- command
  -- },
  -- enrich_config = function (config, next)
    -- local unity_pid = vim.fn.system('ps -C "Unity" -o pid,cmd | grep "Editor/Unity" | cut -f1 -z -d" "')
    -- local proc_entry = 'Unity Editor (Unity) ('..unity_pid:sub(1, -2)..')'
    -- -- local proc_entry = vim.fn.system('mono '..command..' list')
    -- config.name = proc_entry
    -- next(config)
  -- end,
-- }

-- dap.configurations.cs = {
  -- {
    -- name = 'Unity Editor',
    -- type = 'unity',
    -- request = 'attach',
    -- -- path = '/home/demelev/projects/work/golf/Unity.Product.TrackmanPractice/Library/EditorInstance.json',
  -- }
-- }

-- DAP UI settings
local dapui = require("dapui")
dapui.setup {}

dap.listeners.after.event_initialized["dapui_config"] = function()
  print("dapui config terminated")
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  print("dapui config terminated")
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  print("dapui config exited")
  dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = 'ﱣ', texthl='ErrorMsg' })
vim.fn.sign_define("DapBreakpointCondition", { text = 'ﰉ', texthl='ErrorMsg' })
vim.fn.sign_define("DapLogPoint", { text = '鍊', texthl='ErrorMsg'  })
vim.fn.sign_define("DapStopped", { text = '﯀', texthl='ErrorMsg' })
vim.fn.sign_define("DapBreakpointRejected", { text = 'ﰸ', texthl='ErrorMsg' })
-- 'ﱤ  ﰸ '
-- ﰉ ﰈ ﯀
-- ﰊ
