-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}
---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = false,
  },
  TblineFill = {
    link = "none",
  },
  -- this will used for CmpDoc if tranparency is disabled
  CmpDoc = {
    link = "",
  },
}
---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  -- this will used for CmpDoc if tranparency is enabled
  CmpDocTransparent = { link = "none" },
  SagaBorder = { link = "CmpDocBorder" },
  ["@constructor.tsx"] = { link = "Tag" },
}

return M
