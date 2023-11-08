return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  opts = {
      -- ensure_installed = { "prettier", "stylua" },
      filesystem = {
        bind_to_cwd = false, -- true creates a 2-way binding between vim's cwd and neo-tree's root
        follow_current_file = {
          enabled = false,
        },
        filtered_items = {
          never_show_by_pattern = {
            "*.meta"
          }
        }
      }
    }
}
