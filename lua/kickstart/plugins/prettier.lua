return {
  {
    'prettier/vim-prettier',
    run = 'npm install', -- Ensure dependencies are installed with npm
    config = function()
      -- Function to format selected lines with Prettier
      vim.cmd [[
        function! PrettierFormatRange(start, end)
        execute a:start . ',' . a:end . 'Prettier'
        endfunction
      ]]

      -- Command to format the selected range
      vim.cmd [[
        command! -range FormatRange call PrettierFormatRange(<line1>, <line2>)
      ]]

      -- Key mapping in visual mode to format the selected lines
      vim.api.nvim_set_keymap('v', '<leader>p', ':FormatRange<CR>', { noremap = true, silent = true })
    end,
  },
}
