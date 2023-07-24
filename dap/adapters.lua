return {
  unity = {
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
