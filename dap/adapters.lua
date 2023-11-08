local debugger = '/home/demelev/.vscode/extensions/deitry.unity-debug-3.0.11/bin/UnityDebug.exe'
return {
  unity = {
    type = 'executable',
    command = 'mono',
    args = { debugger },
    enrich_config = function (config, next)
      local unity_pid = vim.fn.systemlist('mono '..debugger..' list')

      vim.ui.select(unity_pid, {}, function(pid)
        if pid ~= nil then
          config.name = pid
          next(config)
        end
      end
      )
    end,
  },
  old_unity = {
    type = 'executable',
    command = 'mono',
    args = { '/home/demelev/Downloads/unity-debug-2.7.2/extension/bin/UnityDebug.exe' },
    enrich_config = function (config, next)
      local unity_pid = vim.fn.systemlist('ps -C "Unity" -o pid,cmd | grep "Editor/Unity" | choose 0')

      vim.ui.select(unity_pid, {}, function(pid)
        local proc_entry = 'Unity Editor (Unity) ('..pid:sub(1, -1)..')'
        -- local proc_entry = vim.fn.system('mono '..command..' list')
        config.name = proc_entry
        next(config)
      end
      )
    end,
  }
}
