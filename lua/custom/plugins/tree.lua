return {
	'nvim-tree/nvim-tree.lua',
	opts = function()
		local lib = require("nvim-tree.lib")
		local view = require("nvim-tree.view")


		local function collapse_all()
			require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
		end

		local function edit_or_open()
			-- open as vsplit on current node
			local action = "edit"
			local node = lib.get_node_at_cursor()

			-- Just copy what's done normally with vsplit
			if node.link_to and not node.nodes then
				require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
				view.close() -- Close the tree if file was opened
			elseif node.nodes ~= nil then
				lib.expand_or_collapse(node)
			else
				require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
				view.close() -- Close the tree if file was opened
			end
		end

		local function vsplit_preview()
			-- open as vsplit on current node
			local action = "vsplit"
			local node = lib.get_node_at_cursor()

			-- Just copy what's done normally with vsplit
			if node.link_to and not node.nodes then
				require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
			elseif node.nodes ~= nil then
				lib.expand_or_collapse(node)
			else
				require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
			end

			-- Finally refocus on tree if it was lost
			view.focus()
		end

		local function my_on_attach(bufnr)
			local api = require('nvim-tree.api')

			local function opts(desc)
				return {
					desc = 'nvim-tree: ' .. desc,
					buffer = bufnr,
					noremap = true,
					silent = true,
					nowait = true
				}
			end

			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set('n', 'l', edit_or_open, opts('Edit or Open'))
			vim.keymap.set('n', 'L', vsplit_preview, opts('VSplit Previw'))
			vim.keymap.set('n', 'h', function()
				local node = api.tree.get_node_under_cursor()
				node.close_node()
			end, opts('Close'))
			vim.keymap.set('n', 'H', collapse_all, opts('Collapse All'))
		end

		return {
			disable_netrw = true,
			hijack_cursor = true,
			update_focused_file = {
				enable = true,
				update_root = true
			},
			modified = {
				enable = true
			},
			on_attach = my_on_attach
		}
	end,
	requires = {
		'nvim-tree/nvim-web-devicons', -- optional, for file icons
	},
	keys = {
		{ '<leader>t', '<cmd>NvimTreeToggle<cr>', { desc = '[t]oggle NvimTree' } }
	}
}
