local M = {}
M.options = {
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    current_buffer_fuzzy_find = {
      previewer = false,
    },
    -- live_grep = {
    --   theme = "dropdown",
    -- },
  },
}
M.opts = function()
  local default_options = require "plugins.configs.telescope"
  if M.options then
    default_options = vim.tbl_deep_extend("force", default_options, M.options)
  end
  return default_options
end
return M
