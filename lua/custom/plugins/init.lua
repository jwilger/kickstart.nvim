-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	-- 'jk' == '<Esc>' in insert mode
	vim.keymap.set('i', 'jk', '<Esc>', { silent = true }),

	-- easier window navigation
	vim.keymap.set('n', '<c-h>', '<c-w>h', { silent = true }),
	vim.keymap.set('n', '<c-j>', '<c-w>j', { silent = true }),
	vim.keymap.set('n', '<c-k>', '<c-w>k', { silent = true }),
	vim.keymap.set('n', '<c-l>', '<c-w>l', { silent = true }),
}
