local status, prettier = pcall(requier, 'prettier')
if not status then return end

prettier.setup({
  bin = 'prettierd',
  filestypes = {
    'css',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'json',
  }  
})
