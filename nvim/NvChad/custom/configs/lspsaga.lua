local M = {}
function M.config()
  local status, lspsaga = pcall(require, "lspsaga")
  if not status then
    return
  end
  lspsaga.setup {
    ui = {
      border = "rounded",
      winblend = 10,
      code_action = "",
      actionfix = " ",
    },
    hover = {
      max_width = 0.6,
    },
    finder = {},
  }
end
return M
