local M = {}
function M.config()
  local status, lspsaga = pcall(require, "lspsaga")
  if not status then
    return
  end
  lspsaga.setup {
    ui = {
      border = "single",
      -- winblend = 10,
      code_action = "",
      actionfix = " ",
    },
    hover = {
      max_width = 0.6,
      max_height = 0.6
    },
  }
end
return M
