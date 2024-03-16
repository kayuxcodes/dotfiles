require("nvchad.options")

local o = vim.o
local opt = vim.opt

o.cursorlineopt = "number,line"
o.statuscolumn = "%!v:lua.require'utils.statuscolumn'.statuscolumn()"
opt.shell = "fish"
opt.cmdheight = 1
opt.autoindent = true
opt.title = true
