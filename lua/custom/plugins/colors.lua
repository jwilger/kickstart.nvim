return {
	'folke/tokyonight.nvim',
	opts = { style = 'night' },
	config = function()
		vim.cmd [[colorscheme tokyonight-night]]
		require('lualine').setup {
			options = {
				-- ... your lualine config
				theme = 'tokyonight'
				-- ... your lualine config
			}
		}
	end
}
