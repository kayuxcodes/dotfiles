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

-- table of modules
local statusline_modules = {
  "mode",
  "fileinfo",
  "git",
  "sep",
  "LSP_progress",
  "sep",
  "file_encoding",
  "LSP_Diagnostics",
  "LSP_status",
  "cwd",
  "cursor_position",
}

-- add custom modules here
local custom_modules = {}
local M = {}
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
local K = {}
function K.ov(modules)
  -- modules
  -- local mode = modules[1]
  -- local fileinfo = modules[2]
  -- local git = modules[3]
  -- local LSP_progress = modules[5]
  -- local file_encoding = modules[7]
  -- local LSP_Diagnostics = modules[8]
  -- local LSP_status = modules[9]
  -- local cwd = modules[10]
  -- local cursor_position = modules[11]

  local mode, filinfo, git, boo, LSP_progress, foo, file_encoding, LSP_Diagnostics, LSP_status, cwd, cursor_position =
    unpack(modules)
  -- assigning
  -- modules[11] = cursor_position
  modules[9] = ""
  modules[11] = custom_modules.cursor_position()
  -- re-ordering
  modules[7] = LSP_Diagnostics
  modules[8] = custom_modules.file_encoding()
end
return K
