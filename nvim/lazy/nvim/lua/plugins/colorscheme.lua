-- themeName is a global variable on init.lua
local status, n = pcall(vim.cmd, "colorscheme " .. themeName)
if (not status) then print("theme not found") return end
