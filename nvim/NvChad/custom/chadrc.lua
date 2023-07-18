---@type ChadrcConfig
local M = {}
-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
M.ui = {
  theme = "poimandres",
  theme_toggle = { "oceanic-next", "oceanic-next" },
  transparency = false,
  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    separator_style = "block",
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    overriden_modules = function()
      return require "custom.configs.statusline"
    end,
  },
  tabufline = {
    lazyload = true,
    show_numbers = false,
    overriden_modules = function()
      return require "custom.configs.tabufline"
    end,
  },
  cmp = {
    style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
    -- lspkind_text = false,
  },
  telescope = {
    style = "bordered",
  },
  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Find File", "f + f", "Telescope find_files" },
      { "  Browse Files", "f + l", "Oil" },
      { "󰈚  Recent Files", "f + o", "Telescope oldfiles" },
      { "󰈭  Find Word", "f + w", "Telescope live_grep" },
      { "  Bookmarks", "m + a", "Telescope marks" },
      { "  Themes", "Spc + th", "Telescope themes" },
      { "  Mappings", "Spc + ch", "NvCheatsheet" },
    },
  },
}
M.plugins = "custom.plugins"
-- check core.mappings for table structure
M.mappings = require "custom.mappings"
return M
