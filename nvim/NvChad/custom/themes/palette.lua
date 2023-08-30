local M = {}
local P = {
  mainbg = "#1b1e28",
  lightbg = "#a6accd",
  actvbg = "#303340",
  base03 = "#a6accd",
  base04 = "#171922",
  base05 = "#a6accd",
  base08 = "#e4f0fb",
  base0c = "#da70d6",
  yellow = "#FFFAC2",
  mainteal = "#5DE4C7",
  subteal = "#5FB3A1",
  darkteal = "#42675A",
  mainblue = "#89DDFF",
  subblue = "#ADD7FF",
  darkblue1 = "#91B4D5",
  darkblue2 = "#7390AA",
  mainpink = "#FAE4FC",
  subpink = "#FCC5E9",
  darkpink = "#D0679D",
  blueGray1 = "#A6ACCD",
  blueGray2 = "#767C9D",
  blueGray3 = "#506477",
  subbg1 = "#303340",
  subbg2 = "#1B1E28",
  subbg3 = "#171922",
  txt = "#E4F0FB",
  white = "#FFFFFF",
  one_bg2 = "#494b53", -- 20% lighter than black
  one_bg3 = "#5f6269", -- 30$ lighter that black
  onyx = "#050608", -- 80% darkger than black
  actvbg2 = "#232633" or "#272B39",
}
M.base_30 = {
  white = P.white,
  black = P.mainbg,
  darker_black = P.actvbg2,
  black2 = P.mainbg,
  one_bg = P.actvbg,
  one_bg2 = P.one_bg2,
  one_bg3 = P.one_bg3,
  grey = P.blueGray3,
  grey_fg = P.blueGray2,
  grey_fg2 = P.blueGray3,
  light_grey = P.darkblue1,
  red = P.darkpink,
  baby_pink = P.subpink,
  pink = P.mainpink,
  line = P.actvbg,
  green = P.subteal,
  vibrant_green = P.subteal,
  nord_blue = P.subpink,
  blue = P.mainblue,
  seablue = P.subblue,
  yellow = P.yellow,
  sun = P.subpink,
  purple = P.lightbg,
  dark_purple = P.txt,
  teal = P.mainteal,
  orange = P.darkblue1,
  cyan = P.mainblue,
  statusline_bg = P.mainbg,
  lightbg = P.lightbg,
  pmenu_bg = P.actvbg,
  folder_bg = P.darkblue1,
}

M.base_16 = {
  base00 = P.mainbg,
  base01 = P.lightbg,
  base02 = P.actvbg,
  base03 = P.base03,
  base04 = P.base04,
  base05 = P.base05,
  base06 = P.lightbg,
  base07 = P.base05,
  base08 = P.base08,
  base09 = P.darkpink,
  base0A = P.subblue,
  base0B = P.mainteal,
  base0C = P.mainteal,
  base0D = P.mainteal,
  base0E = P.base05,
  base0F = P.white,
}
M.polish_hl = {
  ["@variable"] = { fg = P.txt },
  ["@boolean"] = { link = "Boolean" },
  Comment = { fg = P.blueGray2 },
  ["@variable.builtin"] = { fg = P.txt },
  ["@constant.builtin"] = { fg = P.subblue },
  ["@constant.falsy"] = { fg = P.darkpink },
  ["@constructor"] = { fg = P.blueGray2 },
  ["@function.builtin"] = { fg = P.subblue },
  ["@function"] = { fg = P.subblue },
  ["@function.call"] = { fg = P.blueGray1 },
  ["@keyword"] = { fg = P.darkblue1 },
  ["@keyword.return"] = { fg = P.subteal },
  ["@keyword.function"] = { fg = P.darkblue1 },
  ["@keyword.operator"] = { fg = P.subblue },
  ["@field"] = { fg = P.txt },
  ["@label"] = { fg = P.darkblue1 },
  Include = { fg = P.mainblue },
  ["@method"] = { fg = P.mainteal },
  ["@operator"] = { link = "Operator" },
  ["@parameter"] = { fg = P.txt },
  ["@property"] = { fg = P.subblue },
  ["@punctuation.delimiter"] = { fg = P.subblue },
  ["@punctuation.special"] = { fg = P.darkblue1 },
  ["@punctuation.bracket"] = { fg = P.blueGray2 },
  -- ["@string"] = { link = "String" },
  ["@string.escape"] = { fg = P.darkpink },
  Tag = { fg = P.mainteal },
  ["@tag.attribute"] = { fg = P.blueGray1, link = "" },
  ["@tag.delimiter"] = { fg = P.txt },
  -- ["@txt"] = { fg = P.txt },
  ["@title"] = { fg = P.mainteal, style = "bold" },
  Type = { fg = P.blueGray2 },
  ["@type"] = { link = "Type" },
  ["@type.builtin"] = { link = "Type" },
  ["@none"] = { fg = P.txt },
  CmpItemAbbr = { fg = P.blueGray2 },
  CmpItemAbbrDeprecated = { fg = P.darkpink },
  CmpItemAbbrMatch = { fg = P.txt },
  CmpItemAbbrMatchFuzzy = { fg = P.mainteal },
  CmpItemKind = { fg = P.darkblue1 },
  CmpItemKindClass = { fg = P.yellow },
  CmpItemKindFunction = { fg = P.mainblue },
  CmpItemKindInterface = { fg = P.subblue },
  CmpItemKindMethod = { fg = P.darkpink },
  CmpItemKindSnippet = { fg = P.blueGray1 },
  CmpItemKindVariable = { fg = P.mainteal },
  ["CmpSel"] = { fg = P.txt, link = "" },
  St_CommandmodeText = { fg = P.mainteal },
  St_CommandModeSep = { fg = P.mainteal },
  St_CommandMode = { bg = "#5DE4C7" },
  St_TerminalmodeText = { fg = P.yellow },
  St_TerminalModeSep = { fg = P.yellow },
  St_TerminalMode = { bg = P.yellow },
  NvimTreeNormalNC = { bg = P.subbg3 },
  NvimTreeNormal = { bg = P.subbg3 },
  ["@constructor.tsx"] = { bg = "red" },
}
M.type = "dark"

M = require("base46").override_theme(M, "poimandres")

return M
