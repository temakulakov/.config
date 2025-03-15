return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function() vim.opt_local.relativenumber = true end,
      },
    },
    default_component_configs = {
      last_modified = {
        enabled = true, -- включает отображение даты последнего редактирования
        width = 20, -- задает ширину колонки (можно изменить по вкусу)
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false, -- показывать скрытые файлы с точкой
        hide_gitignored = false, -- не скрывать файлы, указанные в .gitignore
        hide_hidden = false, -- не скрывать файлы с системным атрибутом "hidden" (на Windows)
      },
    },
  },
}
