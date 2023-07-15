local fn = vim.fn
local config = require("core.utils").load_config().ui.statusline
local sep_style = config.separator_style

local default_sep_icons = {
  default = { left = "", right = " " },
  round = { left = "", right = "" },
  block = { left = "█", right = "█" },
  arrow = { left = "", right = "" },
}

local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

local sep_l = separators["left"]
local sep_r = separators["right"]

local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
  return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
end

local M = {}

local sl_theme_minimal = require "nvchad_ui.statusline.minimal"

-- table of modules
local statusline_modules = {
  "mode",
  "fileinfo",
  "git",
  "LSP_progress",
  "file_encoding",
  "LSP_Diagnostics",
  "LSP_status",
  "cwd",
  "cursor_position",
}
-- add custom modules here
local custom_modules = {}
custom_modules.cursor_position = function()
  local icon = ""
  local current_line = fn.line "."
  local total_line = fn.line "$"
  local text = math.modf((current_line / total_line) * 100) .. tostring "%%"
  text = string.format("%4s", text)
  text = (current_line == 1 and "Top") or text
  text = (current_line == total_line and "Bot") or text

  return "%#St_Pos_sep#" .. sep_l .. "%#St_Pos_bg#" .. icon .. " " .. "%#St_Pos_txt#" .. " " .. text .. " "
end
custom_modules.file_encoding = function()
  return "%#St_gitIcons#" .. string.upper(vim.bo.fileencoding) == "" and ""
    or "%#St_gitIcons#" .. string.upper(vim.bo.fileencoding) .. "  "
end
-- assigning or re-ordering
M.cursor_position = function()
  return custom_modules.cursor_position()
end
M.LSP_status = function()
  return ""
end
-- re-ordering
M.file_encoding = function()
  return sl_theme_minimal.LSP_Diagnostics()
end
M.LSP_Diagnostics = function()
  return custom_modules.file_encoding()
end

return M
