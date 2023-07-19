local M = {}
function M.config()
  local default_options = require "plugins.configs.cmp"
  local options = { window = { documentation = {} } }
  if require("core.utils").load_config().ui.transparency then
    options.window.documentation.border = "single"
    options.window.documentation.winhighlight = "Normal:CmpDocTransparent" .. ",FloatBorder:CmpDocBorder"
  end
  if options then
    default_options = vim.tbl_deep_extend("force", default_options, options)
  end
  return default_options
end
return M
