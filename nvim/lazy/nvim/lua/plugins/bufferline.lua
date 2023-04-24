local status, buffer = pcall(require,'bufferline')
if not status then print('bufferline not found') return end

buffer.setup({
  options = {
    mode = "tabs",
    separator_style = 'thin',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
   buffer_selected = {
    --   -- fg = '',
      bold = true,
    },
 },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
